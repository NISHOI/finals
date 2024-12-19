import 'package:flutter/material.dart';
import 'package:tea_elect_finals/pages/footer.dart';


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

class OrderProduct extends StatefulWidget {
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
  State<OrderProduct> createState() => _OrderProduct();
}


  class _OrderProduct extends State<OrderProduct>{
  String? selectedValue = "1 bag (16 Oz. / 454 g)";
  int selectedAmount = 1;

  get price => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: const Color(0xff93C94E),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 3)
            ),
            child: Image.asset(
              'assets/product_img/${widget.photo}.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  widget.productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
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
            "₱ ${widget.price}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: "Jaro",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Text(
            widget.desc,
            style: const TextStyle(color: Colors.black, fontFamily: 'Jaro', fontSize: 16),
          ),
        ),
        const SizedBox(height: 15),

        Center(
          child: DropdownButton<String>(
            value: selectedValue,
            hint: const Text('Select a value'),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
                selectedAmount = int.parse(newValue!.split(' ')[0]);
              });
            },
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
          child: SizedBox(
            width: double.infinity,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {'amount': selectedAmount});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFFAC00),
                  side: const BorderSide(color: Colors.black, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Jaro',
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            )
          ),
        )



      ],
    );
  }
}