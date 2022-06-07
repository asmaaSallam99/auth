import 'package:flutter/material.dart';
import 'package:homz/models/product.dart';

class Productdetils extends StatelessWidget {
  const Productdetils({Key? key, required this.prod}) : super(key: key);

  final Product prod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    prod.nameAr,
                    style: TextStyle(color: Colors.black),
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            prod.image,
            height: MediaQuery.of(context).size.height * 0.50,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.image,
              size: 150,
            ),
          ),
          Text(
            prod.nameAr,
            textAlign: TextAlign.center,
          ),
          Text(
            prod.price.toStringAsFixed(2),
            textAlign: TextAlign.center,
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Icon(
                  Icons.camera_alt,
                  size: 50,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
