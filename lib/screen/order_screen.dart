import 'package:flutter/material.dart';
import 'package:project_practice/database/database_helper.dart';

class OrderScreen extends StatefulWidget {
  final List<Map<String, dynamic>> orderItems;
  final List<Map<String, dynamic>> globalOrderList;

  const OrderScreen({
    super.key,
    required this.orderItems,
    required this.globalOrderList,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  List<Map<String, dynamic>> orders = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadOrders();
  }

  Future<void> loadOrders() async {
    final data = await DatabaseHelper.getOrders();

    if (!mounted) return;

    setState(() {
      orders = data;
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Order"),
        backgroundColor: Colors.deepPurple.shade300,
        foregroundColor: Colors.white,
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
          isLoading
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : orders.isEmpty
              ? const Center(
            child: Text(
              "Your Order List is empty!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          )
            : ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final orderItems = orders[index];

              final String image = orderItems["image"] ?? "";

              final String productName = orderItems["productName"] ?? "Unknown";

              final int price = orderItems["price"] ?? 0;

              final int quantity = orderItems["quantity"] ?? 1;

              final int total = price * quantity;

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [

                          // 1. Product Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: image.isNotEmpty
                                ? Image.network(
                              image,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                              const Icon(
                                Icons.image,
                                size: 80,
                              ),
                            )
                                : const Icon(
                                Icons.image,
                                size: 80
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  productName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 4),
                                Text(
                                  "₹$price, quantity: $quantity",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),

                            child: Text(
                              "₹$total",
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}