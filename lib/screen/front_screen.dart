import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_practice/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_practice/screen/home_screen.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({super.key});

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () async {
      final prefs = await SharedPreferences.getInstance();

      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

      if (!mounted) return;

      if (isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              userName: prefs.getString('userName') ?? '',
              userEmail: prefs.getString('userEmail') ?? '',
              myCartItems: [],
              globalOrderList: [],
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.purple.shade600,
                    Colors.purple.shade300,
                    Colors.purple.shade100,
                    Colors.pink.shade100,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(Icons.shopping_cart,
                      size: 50,
                      color: Colors.deepPurple,
                    ),
                  ),

                  const SizedBox(height: 10),
                  Text("Shopping App",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}