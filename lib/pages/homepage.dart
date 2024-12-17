import 'package:flutter/material.dart';

import 'cartPage.dart';
import 'footer.dart';
import 'orderPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TEA LOVER', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "Jaro"),),
        centerTitle: true,
        backgroundColor: const Color(0xffFFAC00),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartPage(cartItems: "", itemAmount: "",),
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
              Text(
                'Buy Coffee, Tea, or Hot Choco',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "Jaro"),
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
                desc: "Our OG coffee is a dream, if your dream is of chocolatey nuttiness with beans roasted to the edge of awesome. Go deep, go rich and commit with the darkest coffee you can put in your cup. Responsibly sourced. Organic beans. Just good."
              ),
              SizedBox(height: 20),

              //-------<product>----
              Product(
                productName: "TWILIGHT MEDIUM ROAST COFFEE",
                price: "₱729",
                caption: "Coffee so good",
                photo: "coffee",
                bgColor: "0xff0076D5",
                desc: "Our OG coffee is a dream, if your dream is of chocolatey nuttiness with beans roasted to the edge of awesome. Go deep, go rich and commit with the darkest coffee you can put in your cup. Responsibly sourced. Organic beans. Just good."
                ,
              ),
              SizedBox(height: 20),

              //-------<product>----
              Product(
                productName: "DOUBLE CHOC HOT COCOA",
                price: "₱649",
                caption: "Chocolate wow",
                photo: "choco",
                bgColor: "0xffE93AB8",
                desc: "Indulge in the rich, velvety taste of our Double Chocolate Hot Cocoa. Crafted with premium cocoa and a decadent blend of creamy milk chocolate, this indulgent drink is perfect for those who crave extra chocolatey goodness in every sip. Simply mix with hot water or milk for a luxurious treat that's sure to warm you up on even the coldest days. Whether you’re cozying up at home or sharing with friends, our Double Chocolate Hot Cocoa brings comfort and sweetness in every cup. Ideal for chocolate lovers of all ages!",
              ),
              SizedBox(height: 20),

              //-------<product>----
              Product(
                productName: "HIBISCUS GREEN TEA",
                price: "₱649",
                caption: "This is tea",
                photo: "tea",
                bgColor: "0xffFAAC76",
                desc: "Experience the perfect balance of vibrant flavor and wellness with our Hibiscus Green Tea. This refreshing blend combines the tartness of hibiscus petals with the delicate taste of green tea, creating a fragrant and invigorating brew. Packed with antioxidants and natural goodness, it's a perfect choice for boosting your health while enjoying a soothing cup. Whether hot or iced, Hibiscus Green Tea offers a revitalizing, slightly tangy drink that’s both delicious and refreshing. Ideal for those seeking a natural, flavorful way to relax and refresh!",
              ),
              Footer()
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
  final String desc;

  const Product({
    super.key,
    required this.productName,
    required this.price,
    required this.caption,
    required this.photo,
    required this.bgColor,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderPage(productName: productName, photo: photo, price: price, desc: desc,),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 300,
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
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  caption,
                  style: const TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Jaro"),
                ),
                Text(
                  price,
                  style: const TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Jaro"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
