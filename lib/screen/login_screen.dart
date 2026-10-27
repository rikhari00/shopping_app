import 'package:flutter/material.dart';
import 'package:project_practice/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final List<Map<String, dynamic>> myCartItems = [];
  final List<Map<String, dynamic>> orderList = [];
  bool isObsecure = true;

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String email = emailController.text.trim();
      String userName = userNameController.text.trim();

      final prefs = await SharedPreferences.getInstance();

      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userName', userName);
      await prefs.setString('userEmail', email);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login with $email"),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            userName: userName,
            userEmail: email,
            myCartItems: myCartItems,
            globalOrderList: orderList,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Page",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.deepPurple.shade300,
        foregroundColor: Colors.white,
      ),

      body: Stack(
        children: [

          // Background Gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepPurple.shade300,
                  Colors.deepPurple.shade100,
                  Colors.purple.shade100,
                  Colors.pink.shade100,
                ],
              ),
            ),
          ),

          //Form wrap for access our validation
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Welcome Back!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                    const Center(
                      child: Icon(
                        Icons.waving_hand,
                        size: 40,
                        color: Colors.purple,
                      ),
                    ),

                    const SizedBox(height: 10),
                    // UserName
                    const Text(
                      "UserName",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    const SizedBox(height: 10),
                    TextFormField(
                      controller: userNameController,
                      decoration: InputDecoration(
                        labelText: "UserName",
                        labelStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                        hintText: "Enter UserName",
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                        prefixIcon: Icon(
                            Icons.person,
                            size: 35,
                            color: Colors.purple.shade300),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter UserName";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 12),
                    // Email Address
                    const Text(
                      "Email Address",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        labelStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                        hintText: "Enter your Email Address",
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold),
                        prefixIcon: Icon(Icons.email,
                            size: 35,
                            color: Colors.purple.shade300
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email address";
                        }
                        bool hasLetter = false;
                        bool hasNumber = false;

                        String username = value.split('@')[0];

                        for (int i = 0; i < username.length; i++) {
                          var char = username[i];

                          if (int.tryParse(char) != null) {
                            hasNumber = true;
                          }
                          else if ((char.compareTo('a') >= 0 && char.compareTo('z') <= 0) ||
                              (char.compareTo('A') >= 0 && char.compareTo('Z') <= 0)) {
                            hasLetter = true;
                          }
                        }

                        if (!hasLetter || !hasNumber) {
                          return "Email must contain both letters and numbers";
                        }

                        if (!value.contains('@') || !value.contains('.')) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 12),
                    // Password
                    const Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      obscureText: isObsecure,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                        hintText: "Enter your Password",
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                        prefixIcon: Icon(
                            Icons.lock,
                            size: 28,
                            color: Colors.purple.shade300
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(isObsecure ?
                            Icons.visibility_off : Icons.visibility
                          ),
                          onPressed: () {
                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }

                        if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: _submitForm,
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}