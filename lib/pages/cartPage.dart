import 'package:flutter/material.dart';
import 'package:tea_elect_finals/pages/footer.dart';
import 'checkoutPage.dart';

class CartPage extends StatefulWidget {
  final Map<List<String>, int> cartItems;

  const CartPage({
    super.key,
    required this.cartItems,
  });

  @override
  State<CartPage> createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "attheblanc",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Jaro",
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffFFAC00),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.black,
            height: 3.0,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          if (widget.cartItems.isNotEmpty)
            ...widget.cartItems.keys.toList().asMap().entries.map((entry) {
              List<String> productDetails = entry.value;
              int index = entry.key;
              String productName = productDetails[0];
              String price = productDetails[1];
              String photo = productDetails[2];
              int quantity = widget.cartItems[productDetails]!;

              return CartItem(
                productName: productName,
                price: price,
                photo: photo,
                quantity: quantity,
                onQuantityChange: (int newQuantity) {
                  setState(() {
                    widget.cartItems[productDetails] = newQuantity;
                  });
                },
              );
            }).toList(),
          if (widget.cartItems.isEmpty)
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 120),
                  Text(
                    'Your cart is empty.',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 90),
                ],
              ),
            ),
          const SizedBox(height: 70),
          Center(
            child: ElevatedButton(
              onPressed: widget.cartItems.isEmpty
                  ? null
                  : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(cartItems: widget.cartItems,),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFFAC00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                side: const BorderSide(color: Colors.black, width: 2),
              ),
              child: const Text(
                "PROCEED TO CHECKOUT",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Jaro',
                  fontSize: 24,
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
          const Footer(),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String productName;
  final String price;
  final String photo;
  final int quantity;
  final Function(int) onQuantityChange;

  const CartItem({
    super.key,
    required this.productName,
    required this.price,
    required this.photo,
    required this.quantity,
    required this.onQuantityChange,
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
              Image.asset(
                'assets/product_img/$photo.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  productName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    fontFamily: "Jaro",
                  ),
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Jaro",
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              color: const Color(0xffFFAC00),
            ),
            width: 120,
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      onQuantityChange(quantity - 1);
                    }
                  },
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Jaro",
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (quantity < 3) {
                      onQuantityChange(quantity + 1);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
          child: Row(
            children: [
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Divider(
          color: Colors.black,
          thickness: 1,
        ),
      ],
    );
  }
}
