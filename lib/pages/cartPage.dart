import 'package:flutter/material.dart';
import 'package:tea_elect_finals/pages/footer.dart';

import 'checkoutPage.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckoutPage(),
                  ),
                );
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
              OrderProduct(
                productName: "MIDNIGHT OIL DARK ROAST COFFEE",
                price: "P729",
                caption: "The best coffee in town!",
                photo: "Roasted_coffee_beans.jpg",
              ),
              SizedBox(height: 20),

              SizedBox(height: 20),



              SizedBox(height: 50),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}

class OrderProduct extends StatelessWidget {
  final String productName;
  final String price;
  final String caption;
  final String photo;

  const OrderProduct({
    super.key,
    required this.productName,
    required this.price,
    required this.caption,
    required this.photo,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: "Jaro",
                  ),
                ),
              ),
            ],
          ),
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