import 'package:flutter/material.dart';
import 'package:project_practice/screen/payment_successfully.dart';

class PaymentScreen extends StatefulWidget {
  final int totalAmount;
  final List<Map<String, dynamic>> orderList;
  final List<Map<String, dynamic>> globalOrderList;

  const PaymentScreen({
    super.key,
    required this.totalAmount,
    required this.orderList,
    required this.globalOrderList,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedMethod = "UPI";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment Screen",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.deepPurple.shade400,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [

          // Same Consistent Background Gradient Theme
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepPurple.shade400,
                  Colors.deepPurple.shade100,
                  Colors.purple.shade100,
                  Colors.pink.shade100,
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),

                // 1. Total Price Card Block
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Total Payable:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Text(
                          "₹${widget.totalAmount}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                const SizedBox(height: 30),
                const Text(
                  "Select Option:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),

                // 2. Payment Options Rows (Using Radio List Tiles)
                buildPaymentTile(
                  "UPI (GPay / PhonePe / Paytm)",
                  "UPI",
                  Icons.pix_rounded,
                ),
                buildPaymentTile(
                  "Credit / Debit Card",
                  "Card",
                  Icons.credit_card_rounded,
                ),
                buildPaymentTile(
                  "Cash on Delivery",
                  "COD",
                  Icons.local_shipping_rounded,
                ),

                const Spacer(),

                // 3. Main Action Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentSuccessfully(
                              orderList: widget.orderList,
                              globalOrderList: widget.globalOrderList
                          ),
                      ),
                    );
                  },
                  child: Text(
                    selectedMethod == "Cash on Delivery"
                        ? "Confirm Order"
                        : "Pay Now ₹${widget.totalAmount}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentTile(
      String title,
      String value,
      IconData icon
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      elevation: 2,
      child: RadioListTile<String>(
        secondary: Icon(
            icon,
            color: Colors.deepPurple,
            size: 28
        ),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),
        ),
        value: value,
        groupValue: selectedMethod,
        activeColor: Colors.deepPurple,
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              selectedMethod = newValue;
            });
          }
        },
      ),
    );
  }
}