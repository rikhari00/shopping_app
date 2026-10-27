import 'package:flutter/material.dart';
import 'package:project_practice/screen/payment_screen.dart';
import 'package:project_practice/database/database_helper.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final List<Map<String, dynamic>> globalOrderList;

  const CartScreen({
    super.key,
    required this.cartItems,
    required this.globalOrderList,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple.shade400,
      ),

      body: Stack(
        children: [
          // Background Gradient
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

          widget.cartItems.isEmpty ? const Center(
            child: Text(
              "Your cart is empty!",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ) : ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: widget.cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = widget.cartItems[index];

              final String image = cartItem["image"] ?? "";

              final String productName = cartItem["productName"] ?? "Unknown";

              final int price = cartItem["price"] ?? 0;

              final int quantity = cartItem["quantity"] ?? 1;

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
                            child: image.isNotEmpty ? Image.network(
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
                                : const Icon(Icons.image, size: 80),
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

                      const SizedBox(height:6),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentScreen(
                                        totalAmount: price * quantity,
                                        orderList: widget.cartItems,
                                        globalOrderList:
                                        widget.globalOrderList,
                                      ),
                                ),
                              );
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                            ),

                            child: Text(
                              "Buy",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),
                          OutlinedButton.icon(
                            onPressed: () async {
                              final id = cartItem['id'];
                              debugPrint('Cart item: $cartItem');

                              if (id == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Product ID not found'),
                                  ),
                                );
                                return;
                              }

                              final deleted = await DatabaseHelper.removeCartItem(
                                (id as num).toInt(),
                              );

                              if (!mounted) return;

                              if (deleted > 0) {
                                setState(() {
                                  widget.cartItems.removeWhere(
                                        (item) => item['id'] == id,
                                  );
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Product remove from cart'),
                                  ),
                                );
                              }
                            },

                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            label: const Text(
                              'Remove',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
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