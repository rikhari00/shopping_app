import 'package:flutter/material.dart';
import 'package:project_practice/screen/cart_screen.dart';
import 'package:project_practice/screen/payment_screen.dart';
import 'package:project_practice/database/database_helper.dart';


class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> productsData;

  final int productQuantity;

  final List<Map<String, dynamic>> globalCartList;
  final List<Map<String, dynamic>> globalOrderList;

  const ProductDetailsScreen({
    super.key,
    required this.productsData,
    required this.productQuantity,
    required this.globalCartList,
    required this.globalOrderList,
  });

  @override
  Widget build(BuildContext context) {
    final String productName = productsData["Name"] ?? "Unknown product";
    final int price = productsData["Price"] ?? 0;
    final String image = productsData["image"] ?? " ";
    final int quantity = productQuantity;

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details Screen"),
        backgroundColor: Colors.deepPurple.shade300,
        foregroundColor: Colors.white,
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
            child: Padding(
              padding: EdgeInsets.all(12),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 250,
                    child: Image(
                        image: NetworkImage(image)
                    ),
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      productName,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "₹$price",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Total: ₹${price * quantity}",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final Map<String, dynamic> items = {
                            "image": image,
                            "productName": productName,
                            "price": price,
                            "quantity": quantity,
                            "total": price * quantity,
                          };

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentScreen(
                                totalAmount: price * quantity,
                                orderList: [items],
                                globalOrderList: globalOrderList,
                              ),
                            ),
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),

                        child: Text(
                          "Buy",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),

                      ElevatedButton(
                        onPressed: () async {
                          final Map<String, dynamic> myCartItems = {
                            "image": image,
                            "productName": productName,
                            "price": price,
                            "quantity": quantity,
                            "total": price * quantity,
                          };

                          final id = await DatabaseHelper.insertCartItem(myCartItems);
                          debugPrint('Inserted cart ID: $id');

                          myCartItems['id'] = id;

                          globalCartList.add(myCartItems);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "$productName successfully added to Cart",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );

                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CartScreen(
                                      cartItems: globalCartList,
                                    globalOrderList: globalOrderList,
                                  ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Add to cart",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}