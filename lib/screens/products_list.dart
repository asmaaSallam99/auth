import 'package:flutter/material.dart';
import 'package:homz/data_provider/product_data_provider.dart';
import 'package:homz/models/category.dart';
import 'package:homz/models/product.dart';
import 'package:homz/screens/product_detils.dart';
import 'package:homz/widgets/product_card.dart';

class Productlist extends StatelessWidget {
  const Productlist({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        leading: const Center(
          child: Text(
            "تصفية",
            style: TextStyle(color: Colors.black),
          ),
        ),
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
                    category.nameAr,
                    style: TextStyle(color: Colors.black),
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: ProductsDataProvider().getProductsByCategory(category.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('something went wrong');
          } else if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return GridView.builder(
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                padding: const EdgeInsets.all(20),
                itemCount: snapshot.data!.length,
                itemBuilder: (_, i) => ProductItem(product: snapshot.data![i]),
              );
            } else {
              return Center(
                child: Text('لا توجد منتجات'),
              );
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
