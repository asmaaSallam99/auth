import 'package:flutter/material.dart';
import 'package:homz/models/product.dart';
import 'package:homz/screens/product_detils.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Productdetils(prod: product),
          ),
        );
      },
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: const Color(0xffd4dad1),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    product.image,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image,
                      size: 50,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(product.nameAr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
