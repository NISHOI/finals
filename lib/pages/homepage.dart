import 'package:flutter/material.dart';
import 'package:tea_elect_finals/pages/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TEA LOVER'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // Handle cart action
              },
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                'Buy Coffee, Tea, or Hot Choco',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              SizedBox(height: 20),

              //-------<product>----
              Product(
                product_name: "MIDNIGHT OIL DARK ROAST COFFEE",
                price: "P729",
                caption: "The best coffee in town!",
                photo: "Roasted_coffee_beans.jpg",
              ),
              SizedBox(height: 20),

              //-------<product>----
              Product(
                product_name: "TWILIGHT OIL DARK ROAST COFFEE",
                price: "P729",
                caption: "The best coffee in town!",
                photo: "Roasted_coffee_beans.jpg",
              ),
              SizedBox(height: 20),

              //-------<product>----
              Product(
                product_name: "DOUBLE CHOCO",
                price: "P729",
                caption: "The best coffee in town!",
                photo: "Roasted_coffee_beans.jpg",
              ),
              SizedBox(height: 20),

              //-------<product>----
              Product(
                product_name: "HABISCUS COFFEE",
                price: "P729",
                caption: "The best coffee in town!",
                photo: "Roasted_coffee_beans.jpg",
              ),

              SizedBox(height: 50),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  final String product_name;
  final String price;
  final String caption;
  final String photo;

  const Product({
    super.key,
    required this.product_name,
    required this.price,
    required this.caption,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      product_name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            caption,
            style: const TextStyle(color: Colors.black, fontSize: 13),
          ),
        ),
        const SizedBox(height: 10),

        Center(
          child: Container(
            height: 200, // Reduced height
            width: 300, // Reduced width
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/product_img/$photo',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),


      ],
    );
  }
}

