import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TEA LOVER'),
        centerTitle: true,
        backgroundColor: const Color(0xffFFAC00),
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
                productName: "MIDNIGHT OIL DARK ROAST COFFEE",
                price: "₱729",
                caption: "So yummy coffee",
                photo: "coffee",
                bgColor: "0xff0076D5",
              ),
              SizedBox(height: 20),

              //-------<product>----
              Product(
                productName: "TWILIGHT OIL DARK ROAST COFFEE",
                price: "₱729",
                caption: "Coffee so good",
                photo: "coffee",
                bgColor: "0xff0076D5",
              ),
              SizedBox(height: 20),

              //-------<product>----
              Product(
                productName: "DOUBLE CHOC HOT COCOA",
                price: "₱649",
                caption: "Chocolate wow",
                photo: "choco",
                bgColor: "0xffE93AB8",
              ),
              SizedBox(height: 20),

              //-------<product>----
              Product(
                productName: "HIBISCUS GREEN TEA",
                price: "₱649",
                caption: "This is tea",
                photo: "tea",
                bgColor: "0xffFAAC76",
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  final String productName;
  final String price;
  final String caption;
  final String photo;
  final String bgColor;

  const Product({
    super.key,
    required this.productName,
    required this.price,
    required this.caption,
    required this.photo,
    required this.bgColor
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
                      productName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
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
              color: Color(int.parse(bgColor)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/product_img/$photo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        const SizedBox(height: 20),

        const Divider(
          color: Colors.black,
          thickness: 2,
        ),
      ],
    );
  }
}
