import 'package:flutter/material.dart';
import 'package:tea_elect_finals/pages/footer.dart';

import 'checkoutPage.dart';

class CartPage extends StatelessWidget {
  final String cartItems;
  final String itemAmount;

  const CartPage({
    super.key,
    required this.cartItems,
    required this.itemAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        centerTitle: true,
        backgroundColor: const Color(0xffFFAC00),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              CartItem( // Gamit nalang ng listview builder dito kasi di natin alam kung ilan items iaadd sa cart
                productName: "MIDNIGHT OIL DARK ROAST COFFEE",
                price: "P729",
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


class CartItem extends StatelessWidget {
  final String productName;
  final String price;
  final String photo;

  const CartItem({
    super.key,
    required this.productName,
    required this.price,
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
        const SizedBox(height: 10),

        Center(
          child: Container(
            height: 200, // Reduced height
            width: 300, // Reduced width
            decoration: BoxDecoration(
              color: Colors.white,
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