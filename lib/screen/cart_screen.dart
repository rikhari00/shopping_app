import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {

  const CartScreen({super.key,});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.deepPurple.shade300,
      ),
      body: Stack(
        children: [

          //Background Gradient
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

                const SizedBox(height: 10),


              ],
            ),
          ),
        ],
      ),
    );
  }
}