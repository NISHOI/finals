import 'package:flutter/material.dart';
import 'package:tea_elect_finals/pages/footer.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("attheblanc", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "Jaro"),),
        centerTitle: true,
        backgroundColor: const Color(0xffFFAC00),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.black,
            height: 3.0,
          )
        ),
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
                photo: "coffee.png",
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


        // Laman neto yung list ng items, subtotal tapos yung mode of payment pati details


        const SizedBox(height: 10),


      ],
    );
  }
}