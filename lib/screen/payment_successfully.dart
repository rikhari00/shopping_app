import 'package:flutter/material.dart';
import 'package:project_practice/database/database_helper.dart';
import 'package:project_practice/screen/order_screen.dart';

class PaymentSuccessfully extends StatelessWidget {
  final List<Map<String, dynamic>> orderList;
  final List<Map<String, dynamic>> globalOrderList;

  const PaymentSuccessfully({
    super.key,
    required this.orderList,
    required this.globalOrderList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade300
      ),

      body: Stack(
        children: [

          //Background Gradient
          Container(
            height: double.infinity,
            width: double.infinity,
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
              children: [
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white54,
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      size: 90,
                      color: Colors.green,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                //Payment message
                Text(
                  "Payment Successfully",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 20),
                Text(
                  "Your payment has been completed successfully.",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 15),
                //Order Conformation card
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.local_shipping_outlined,
                        size: 50,
                        color: Colors.deepPurple,
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Your order is confirmed!",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),

                      const SizedBox(height: 10),
                      Text(
                        "Your order is deliver in...days",
                        style: TextStyle(
                            fontSize: 22
                        ),
                      ),

                      const SizedBox(height: 10),
                      Text(
                        "Thank you for shopping with us",
                        style: TextStyle(
                            fontSize: 22
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                //continue shopping
                ElevatedButton(
                  onPressed: () async {
                    for (final item in orderList) {
                      await DatabaseHelper.insertOrderItem(item);
                    }

                    if (!context.mounted) return;

                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderScreen(
                          orderItems: [],
                          globalOrderList: globalOrderList,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Continue shopping",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
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
