import 'package:flutter/material.dart';

import 'cartPage.dart';
import 'footer.dart';
import 'orderPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Map<List<String>, int> cartItems = {};

  void addToCart(List<String> productDetails, int quantity) {
    setState(() {
      // If the product is already in the cart, update the quantity
      if (cartItems.containsKey(productDetails)) {
        cartItems[productDetails] = cartItems[productDetails]! + quantity;
      } else {
        // If the product is not in the cart, add it
        cartItems[productDetails] = quantity;
      }
    });
  }

  void navigateToOrderPage(String productName, String price, String desc, String photo) async {
    List<String> productDetails = [productName, price, photo];

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(
          productName: productName,
          price: price,
          desc: desc,
          photo: photo,
        ),
      ),
    );

    if (result != null) {
      int amount = result['amount'];
      addToCart(productDetails, amount);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('attheblanc', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "Jaro"),),
        centerTitle: true,
        backgroundColor: const Color(0xffFFAC00),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cartItems: cartItems),
                  ),
                );
              },
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.black,
            height: 3.0,
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Premium coffee beans, roasted to perfection.',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: "Jaro"),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              const SizedBox(height: 20),

              //-------<product>----
              Product(
                productName: "MIDNIGHT OIL DARK ROAST COFFEE",
                price: "₱729",
                caption: "So yummy coffee",
                photo: "coffee",
                bgColor: "0xff0076D5",
                desc: "Our OG coffee is a dream, if your dream is of chocolatey nuttiness with beans roasted to the edge of awesome. Go deep, go rich and commit with the darkest coffee you can put in your cup. Responsibly sourced. Organic beans. Just good.",
                onTap: () => navigateToOrderPage(
                    "MIDNIGHT OIL DARK ROAST COFFEE",
                    "₱729",
                    "Our OG coffee is a dream, if your dream is of chocolatey nuttiness with beans roasted to the edge of awesome. Go deep, go rich and commit with the darkest coffee you can put in your cup. Responsibly sourced. Organic beans. Just good.",
                    "coffee")
              ),
              const SizedBox(height: 20),

              //-------<product>----
              Product(
                productName: "TWILIGHT MEDIUM ROAST COFFEE",
                price: "₱729",
                caption: "Coffee so good",
                photo: "coffee",
                bgColor: "0xff0076D5",
                desc: "Our OG coffee is a dream, if your dream is of chocolatey nuttiness with beans roasted to the edge of awesome. Go deep, go rich and commit with the darkest coffee you can put in your cup. Responsibly sourced. Organic beans. Just good.",
                onTap: () => navigateToOrderPage(
                    "TWILIGHT MEDIUM ROAST COFFEE",
                    "₱729",
                    "Our OG coffee is a dream, if your dream is of chocolatey nuttiness with beans roasted to the edge of awesome. Go deep, go rich and commit with the darkest coffee you can put in your cup. Responsibly sourced. Organic beans. Just good.",
                    "coffee")
              ),
              const SizedBox(height: 20),

              //-------<product>----
              Product(
                productName: "DOUBLE CHOC HOT COCOA",
                price: "₱649",
                caption: "Chocolate wow",
                photo: "choco",
                bgColor: "0xffE93AB8",
                desc: "Indulge in the rich, velvety taste of our Double Chocolate Hot Cocoa. Crafted with premium cocoa and a decadent blend of creamy milk chocolate, this indulgent drink is perfect for those who crave extra chocolatey goodness in every sip. Simply mix with hot water or milk for a luxurious treat that's sure to warm you up on even the coldest days. Whether you’re cozying up at home or sharing with friends, our Double Chocolate Hot Cocoa brings comfort and sweetness in every cup. Ideal for chocolate lovers of all ages!",
                onTap: () => navigateToOrderPage(
                    "DOUBLE CHOC HOT COCOA",
                    "₱649",
                    "Indulge in the rich, velvety taste of our Double Chocolate Hot Cocoa. Crafted with premium cocoa and a decadent blend of creamy milk chocolate, this indulgent drink is perfect for those who crave extra chocolatey goodness in every sip. Simply mix with hot water or milk for a luxurious treat that's sure to warm you up on even the coldest days. Whether you’re cozying up at home or sharing with friends, our Double Chocolate Hot Cocoa brings comfort and sweetness in every cup. Ideal for chocolate lovers of all ages!",
                    "choco")
              ),
              const SizedBox(height: 20),

              //-------<product>----
              Product(
                productName: "HIBISCUS GREEN TEA",
                price: "₱649",
                caption: "This is tea",
                photo: "tea",
                bgColor: "0xffFAAC76",
                desc: "Experience the perfect balance of vibrant flavor and wellness with our Hibiscus Green Tea. This refreshing blend combines the tartness of hibiscus petals with the delicate taste of green tea, creating a fragrant and invigorating brew. Packed with antioxidants and natural goodness, it's a perfect choice for boosting your health while enjoying a soothing cup. Whether hot or iced, Hibiscus Green Tea offers a revitalizing, slightly tangy drink that’s both delicious and refreshing. Ideal for those seeking a natural, flavorful way to relax and refresh!",
                onTap: () => navigateToOrderPage(
                    "HIBISCUS GREEN TEA",
                    "₱649",
                    "Experience the perfect balance of vibrant flavor and wellness with our Hibiscus Green Tea. This refreshing blend combines the tartness of hibiscus petals with the delicate taste of green tea, creating a fragrant and invigorating brew. Packed with antioxidants and natural goodness, it's a perfect choice for boosting your health while enjoying a soothing cup. Whether hot or iced, Hibiscus Green Tea offers a revitalizing, slightly tangy drink that’s both delicious and refreshing. Ideal for those seeking a natural, flavorful way to relax and refresh!",
                    "tea")
              ),
              const Footer()
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
  final Function onTap;

  const Product({
    super.key,
    required this.productName,
    required this.price,
    required this.caption,
    required this.photo,
    required this.bgColor,
    required this.desc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
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
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                )
              ),
              child: Image.asset(
                'assets/product_img/$photo.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
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
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price,
                  style: const TextStyle(color: Colors.black, fontSize: 18, fontFamily: "Jaro"),
                ),
                Text(
                  caption,
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
