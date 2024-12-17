import 'package:flutter/material.dart';
import 'package:tea_elect_finals/pages/footer.dart';

import 'cartPage.dart';

class OrderPage extends StatelessWidget {
  final String productName;
  final String photo;
  final String price;
  final String desc;

  const OrderPage({
    super.key,
    required this.productName,
    required this.photo,
    required this.price,
    required this.desc
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        centerTitle: true,
        backgroundColor: const Color(0xffFFAC00),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              OrderProduct(
                productName: productName,
                price: price,
                desc: desc,
                photo: photo,
              ),
              const SizedBox(height: 20),

              const SizedBox(height: 20),

              const SizedBox(height: 50),
              const Footer()
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
  final String desc;
  final String photo;

  const OrderProduct({
    super.key,
    required this.productName,
    required this.price,
    required this.desc,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 300, // Reduced height
            width: 300, // Reduced width
            decoration: BoxDecoration(
              color: const Color(0xff93C94E),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/product_img/$photo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
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
          child: Text(
            price,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: "Jaro",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Text(
            desc,
            style: const TextStyle(color: Colors.black, fontFamily: 'Jaro', fontSize: 16),
          ),
        ),
        const SizedBox(height: 15),

        Center(
          child: DropdownButton<String>(
            value: "1 bag (16 Oz. / 454 g)",  // Current value displayed in the dropdown
            hint: const Text('Select a value'),
            onChanged: (String? newValue) {},
            items: <String>['1 bag (16 Oz. / 454 g)', '2 bags (32 Oz. / 908 g)', '3 bags (48 Oz. / 1362 g)']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 15),

        Center(
          child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFFAC00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)
                )
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                child: Text("ADD TO CART", style: TextStyle(color: Colors.black, fontFamily: 'Jaro', fontSize: 20),),
              )
            )
          ,)

      //   tapos customer reviews shit dito bago footer kung kaya pa. pwede kahit wag na

      ],
    );
  }
}