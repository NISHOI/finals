import 'package:flutter/material.dart';
import 'homepage.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? selectedPaymentMethod;

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
              const SizedBox(height: 10),
              const Text(
                'MIDNIGHT OIL DARK ROAST COFFEE    x1',
                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Jaro',),
              ),
              const Text(
                'DOUBLE CHOC HOT COCOA    x1',
                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Jaro',),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const Text(
                'Total Cost:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Jaro',),
              ),
              const Text(
                '₱1378.00 (Shipping incl.)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Jaro',),
              ),
              const SizedBox(height: 20),

              const Text(
                'Payment Method',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Jaro',
                    color: Colors.black),
              ),
              const SizedBox(height: 10),

              // Custom Payment Tiles
              paymentOptionTile('Cash on Delivery'),
              paymentOptionTile('Credit / Debit Card'),
              paymentOptionTile('GCash'),
              paymentOptionTile('PayMaya'),

              const SizedBox(height: 20),

              // Shipping Address Section
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

          // Order Button
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
                // Action on order
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Order Placed Successfully!\nPayment: ${selectedPaymentMethod ?? "Not Selected"}'),
                  ),
                );

                // Navigate to Homepage after showing SnackBar
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
                  fontSize: 16,
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

  // Custom Payment Tile
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
                  fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
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

  // Custom Text Field Widget
  Widget customTextField(String hintText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
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
