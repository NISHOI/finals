import 'package:flutter/material.dart';
import 'homepage.dart';

class CheckoutPage extends StatefulWidget {
  final Map<List<String>, int> cartItems;

  const CheckoutPage({
    super.key,
    required this.cartItems,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? selectedPaymentMethod;

  double calculateSubtotal() {
    double subtotal = 0.0;

    widget.cartItems.forEach((productDetails, quantity) {
      double price = double.parse(productDetails[1]);
      subtotal += price * quantity;
    });

    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFAC00),
        title: const Text(
          'attheblanc',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Jaro",
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Order Summary',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Jaro',
                    color: Colors.black
                ),
              ),

              buildCartItemsList(widget.cartItems),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Subtotal:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Jaro",
                      ),
                    ),
                    Text(
                      '₱${calculateSubtotal().toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Jaro",
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),

              const Text(
                'Payment Method',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Jaro',
                    color: Colors.black
                ),
              ),
              const SizedBox(height: 10),

              paymentOptionTile('Cash on Delivery'),
              paymentOptionTile('Credit / Debit Card'),
              paymentOptionTile('GCash'),
              paymentOptionTile('PayMaya'),

              const SizedBox(height: 20),

              const Text(
                'Shipping Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: "Jaro"
                ),
              ),
              const SizedBox(height: 10),
              customTextField('Country'),
              customTextField('City'),
              customTextField('Street / Building Name'),
              customTextField('Unit / Floor'),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFFAC00),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)
                    ),
                    side: const BorderSide(color: Colors.black, width: 2),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Order Placed Successfully!\nPayment: ${selectedPaymentMethod ?? "Not Selected"}'),
                      ),
                    );

                    Future.delayed(const Duration(milliseconds: 500), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    });
                  },

                  child: const Text(
                    'ORDER',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: "Jaro"
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildCartItemsList(Map<List<String>, int> cartItems) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartItems.keys.length,
      itemBuilder: (context, index) {
        List<String> productDetails = cartItems.keys.elementAt(index);
        int quantity = cartItems[productDetails]!;
        String productName = productDetails[0];

        return ListTile(
          title: Text(
            productName,
            style: const TextStyle(
                fontFamily: 'Jaro',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          subtitle: Text(
            'Qty.: ${quantity.toString()}',
            style: const TextStyle(
              fontFamily: 'Jaro',
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        );

      },
    );
  }


  Widget paymentOptionTile(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
              color: selectedPaymentMethod == title
                  ? Colors.black
                  : Colors.grey.shade400,
              width: 2),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: "Jaro", fontSize: 18, color: Colors.black),
            ),
            Icon(
              selectedPaymentMethod == title
                ? Icons.radio_button_checked
                : Icons.radio_button_off,
                color: Colors.black,
            )
          ],
        ),
      ),
    );
  }

  Widget customTextField(String hintText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:  const TextStyle(
            fontFamily: "Jaro",
            fontSize: 18.0,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey)),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
      ),
    );
  }
}

