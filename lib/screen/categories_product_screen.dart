import 'package:flutter/material.dart';
import 'package:project_practice/screen/product_details_screen.dart';

class CategoriesProductScreen extends StatefulWidget {
  final String categoriesName;

  final List<Map<String, dynamic>> myCartItems;
  final List<Map<String, dynamic>> items;


  const CategoriesProductScreen({
    super.key,
    required this.categoriesName,
    required this.myCartItems,
    required this.items,
  });

  @override
  State<CategoriesProductScreen> createState() =>
      _CategoriesProductScreenState();
}

class _CategoriesProductScreenState extends State<CategoriesProductScreen> {
  final Map<String, int> productQuantity = {};

  final Map<String, List<Map<String, dynamic>>> categoriesList = {

    "Fashion": [
      {
        "Name": "jacket",
        "oldPrice": 1800,
        "Price": 800,
        "image":
            "https://images.unsplash.com/vector-1741591987052-608871d246a3?q=80&w=878&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "T-Shirt",
        "oldPrice": 900,
        "Price": 600,
        "image":
            "https://plus.unsplash.com/premium_vector-1719017977408-ae6c969acdbe?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "winter collection",
        "oldPrice": 2200,
        "Price": 1000,
        "image":
            "https://plus.unsplash.com/premium_vector-1724355762918-775a14a5c3d5?q=80&w=1140&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "cap & scarf",
        "oldPrice": 1400,
        "Price": 500,
        "image":
            "https://images.unsplash.com/vector-1756376915191-40e530e8cbaa?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Shoes",
        "oldPrice": 3000,
        "Price": 1400,
        "image":
            "https://images.unsplash.com/vector-1747938651178-54bd251b48da?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Heals",
        "oldPrice": 5000,
        "Price": 1000,
        "image":
            "https://images.unsplash.com/vector-1751812978886-cee3311a254a?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },
    ],

    "Electronic": [
      {
        "Name": "Android Phone",
        "oldPrice": 22000,
        "Price": 10000,
        "image":
            "https://images.unsplash.com/vector-1742131266634-80c5ba824f9e?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Laptop",
        "oldPrice": 45000,
        "Price": 35000,
        "image":
            "https://images.unsplash.com/vector-1739547092206-9a931584e6f4?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Fan",
        "oldPrice": 5000,
        "Price": 3000,
        "image":
            "https://plus.unsplash.com/premium_vector-1758272015308-66de79a22382?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Air Conditioner",
        "oldPrice": 10000,
        "Price": 5000,
        "image":
            "https://plus.unsplash.com/premium_vector-1732698442245-9d38e7413662?q=80&w=1267&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Refrigerator",
        "oldPrice": 25000,
        "Price": 15000,
        "image":
            "https://plus.unsplash.com/premium_vector-1760026564848-a8f212b6828b?q=80&w=713&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Watching TV",
        "oldPrice": 2000,
        "Price": 7000,
        "image":
            "https://images.unsplash.com/vector-1756381489464-96f17dd335a8?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },
    ],

    "Home": [
      {
        "Name": "Painting",
        "oldPrice": 1800,
        "Price": 1000,
        "image":
            "https://plus.unsplash.com/premium_vector-1683133789712-6ddf2521540d?q=80&w=901&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "vase with Flower",
        "oldPrice": 1500,
        "Price": 900,
        "image":
            "https://images.unsplash.com/vector-1748588262293-6754668a4ce6?q=80&w=1172&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "GoldFish",
        "oldPrice": 5000,
        "Price": 2000,
        "image":
            "https://plus.unsplash.com/premium_vector-1732314210268-48998a8141d6?q=80&w=938&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Nature Painting",
        "oldPrice": 2000,
        "Price": 800,
        "image":
            "https://plus.unsplash.com/premium_vector-1724266677450-55f3df77b34b?q=80&w=708&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Colorful lights",
        "oldPrice": 2200,
        "Price": 1700,
        "image":
            "https://plus.unsplash.com/premium_vector-1723779257500-5faed4749030?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },
    ],

    "Sports": [
      {
        "Name": "Football",
        "oldPrice": 1000,
        "Price": 799,
        "image":
            "https://images.unsplash.com/vector-1738324092750-f9b451fde7ee?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Tennis Kit",
        "oldPrice": 3000,
        "Price": 2500,
        "image":
            "https://images.unsplash.com/vector-1767996455415-186f52e4f96e?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Basketball kit",
        "oldPrice": 2400,
        "Price": 1999,
        "image":
            "https://plus.unsplash.com/premium_vector-1730133275357-432d35ab7ca3?q=80&w=806&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Cricket kit",
        "oldPrice": 3500,
        "Price": 2999,
        "image":
            "https://plus.unsplash.com/premium_vector-1728216032151-1853645376b4?q=80&w=925&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },
    ],

    "Beauty": [
      {
        "Name": "Skin care kit",
        "oldPrice": 2500,
        "Price": 2000,
        "image":
            "https://plus.unsplash.com/premium_vector-1721917737098-752746d777d7?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "SunsCream",
        "oldPrice": 1400,
        "Price": 999,
        "image":
            "https://plus.unsplash.com/premium_vector-1721017326261-cb4757339d13?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Makeup kit",
        "oldPrice": 7000,
        "Price": 5000,
        "image":
            "https://plus.unsplash.com/premium_vector-1770126905218-0ca90122a879?q=80&w=1096&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Nail Polish",
        "oldPrice": 650,
        "Price": 500,
        "image":
            "https://images.unsplash.com/vector-1776398011080-a1744981fbe5?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },

      {
        "Name": "Lipstick",
        "oldPrice": 1000,
        "Price": 800,
        "image":
            "https://plus.unsplash.com/premium_vector-1722057404548-1c10dc20b791?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final currentProduct = categoriesList[widget.categoriesName] ?? [];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.categoriesName} Product",
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
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Welcome to ${widget.categoriesName} section",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 535,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: currentProduct.length,
                    itemBuilder: (context, index) {
                      final products = currentProduct[index];

                      final String productName = products["Name"];
                      final int oldPrice = products["oldPrice"];
                      final int price = products["Price"];
                      final int quantity = productQuantity[productName] ?? 1;

                      final int discount = oldPrice > price
                          ? (((oldPrice - price) / oldPrice) * 100).round()
                          : 0;

                      return Column(
                        children: [
                          Card(
                            elevation: 2,
                            color: Colors.deepPurple.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [

                                SizedBox(
                                  height: 180,
                                  width: double.infinity,
                                  child: Image.network(
                                    (products["image"] ?? "").toString(),
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }

                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                        child: Icon(
                                          Icons.broken_image,
                                          size: 50,
                                          color: Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    products["Name"],
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    spacing: 8,
                                    runSpacing: 4,
                                    children: [
                                      if (oldPrice > price)
                                        Text(
                                          "₹$oldPrice",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),

                                      Text(
                                        "₹$price",
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),

                                      if (discount > 0)
                                        Text(
                                          "$discount% OFF",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        if (quantity > 1) {
                                          setState(() {
                                            productQuantity[productName] =
                                                quantity - 1;
                                          });
                                        }
                                      },

                                      icon: Icon(
                                        Icons.remove_circle_outline,
                                        size: 30,
                                        color: Colors.red,
                                      ),
                                    ),

                                    Text(
                                      "$quantity",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple,
                                      ),
                                    ),

                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          productQuantity[productName] =
                                              quantity + 1;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        size: 30,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),

                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Total: ₹${price * quantity}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                    productsData: products,
                                    productQuantity: quantity,
                                    globalCartList: widget.myCartItems,
                                    globalOrderList: widget.items,
                                  ),
                                ),
                              );
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple.shade300,
                              foregroundColor: Colors.white,
                            ),

                            child: Text(
                              "View",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
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