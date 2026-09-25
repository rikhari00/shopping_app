import'package:flutter/material.dart';
import 'package:project_practice/screen/cart_screen.dart';
import 'package:project_practice/screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {

  final String userName;
  final String userEmail;

  const HomeScreen({super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Banner List
  final List<String> banner = [
    "https://images.unsplash.com/vector-1761241899087-9abc37a13b8a?q=80&w=1171&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/vector-1776502140456-ecce78c04143?q=80&w=1077&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  ];

  //Discount List
  final List<Map<String, dynamic>> discountOffers = <Map<String, dynamic>> [
    {
      "Title": "Electronic Special Offer",
      "Discount": "50% Off",
      "Code": "welcome10",
      "Color": Colors.orange.shade100,
    },
    {
      "Title": "Fashion Special",
      "Discount": "50% Off",
      "Code": "Fashion10",
      "Color": Colors.orange.shade100,
    },
  ];

  //Categories List
  final List<Map<String, dynamic>> categories = [
    {
      "Name": "Fashion",
      "icon": Icon(Icons.person)
    },

    {
      "Name": "Electronic",
      "icon": Icon(Icons.phone_android_outlined)
    },

    {
      "Name": "Home",
      "icon": Icon(Icons.home_work_outlined)
    },

    {
      "Name": "Sports",
      "icon": Icon(Icons.sports_baseball)
    },

    {
      "Name": "Beauty",
      "icon": Icon(Icons.face_rounded)
    },
  ];

  // Variable for Bottom Navigation Bar
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple.shade300,
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

          //Search Bar
          SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Search",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      hintText: "Search Products",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      prefixIcon: Icon(Icons.search,
                        size: 30,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  //Categories
                  const SizedBox(height: 10),

                  Text("Categories: ",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];

                        return Padding(
                            padding: EdgeInsets.only(right: 16),
                          child: Column(
                            children: [
                              CircleAvatar(
                                child: category["icon"],
                                radius: 25,
                                backgroundColor: Colors.deepPurple.shade100,
                              ),

                              const SizedBox(height: 10),
                              Text(
                                category["Name"],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  //Banner
                  const SizedBox(height: 20),

                  SizedBox(
                    height: 160,

                    child: PageView.builder(
                        itemCount: banner.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 5
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: NetworkImage(banner[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }
                    ),
                  ),

                  //Discount Offer Card
                  const SizedBox(height: 15),

                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:discountOffers.length ,
                        itemBuilder: (context, index) {
                          final offer = discountOffers[index];

                           return Container(
                             width: 240,
                             margin: EdgeInsets.only(right: 14),
                             padding: EdgeInsets.all(12),
                             decoration: BoxDecoration(
                               color: offer["Color"],
                               borderRadius: BorderRadius.circular(12),
                             ),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   offer["Title"],
                                   style: TextStyle(
                                     fontSize: 24,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                                 const SizedBox(height: 10),

                                 Text(
                                   offer["Discount"],
                                   style: TextStyle(
                                     fontSize: 22,
                                     fontWeight: FontWeight.bold
                                   ),
                                 ),

                                 const SizedBox(height: 10),

                                 Text(
                                   offer["Code"],
                                   style: TextStyle(
                                     fontSize: 22,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                               ],
                             ),
                           );
                        }
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      //Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });

          if(index == 0){
            _selectedIndex = 0;
          }
          else if(index == 1){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CartScreen()
              ),
            );
          }
          else if(index == 2){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    userName: widget.userName,
                    userEmail : widget.userEmail,
                  ),
              ),
            );
          }
        },

        unselectedItemColor: Colors.grey.shade700,
        backgroundColor: Colors.pink.shade100,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: "Home",
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag, size: 30),
              label: "My Cart"
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: "Profile"
          ),
        ],
      ),
    );
  }
}