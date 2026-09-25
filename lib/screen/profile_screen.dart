import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  final String userName;
  final String userEmail;

  const ProfileScreen({super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.deepPurple.shade300,
      ),
      body: Stack(
        children: [

          //BackGround Gradient
          Container(
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

          SingleChildScrollView(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.purple.shade100,
                    backgroundImage: NetworkImage(
                        "https://plus.unsplash.com/premium_vector-1682298415890-25c088b408fa?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 10),
                Text(
                  userEmail,
                  style: TextStyle(
                    fontSize: 22,
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