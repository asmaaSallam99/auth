import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homz/data_provider/catergory_data_provider.dart';
import 'package:homz/models/category.dart';
import 'package:homz/screens/products_list.dart';
import 'package:homz/widgets/auth_form.dart';

class Categories extends StatefulWidget {
  @override
  _Categories createState() => _Categories();
}

class _Categories extends State<Categories> {
  int currentIndex = 0;
  int selectedCategoryId = 1;
  List<Category> subCategories = [];
  List<Category> categories = [];
  onSelectMainCategory(int id) {
    if (selectedCategoryId != id) {
      setState(() {
        selectedCategoryId = id;
        subCategories.clear();
        subCategories.addAll(
            categories.firstWhere((e) => e.id == selectedCategoryId).children ??
                []);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.widgets_rounded),
              label: 'category',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
                size: 50,
              ),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits),
              label: 'cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        body: FutureBuilder(
          future: CategoryDataProvider().getCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('something went wrong'),
              );
            } else if (snapshot.hasData) {
              categories = snapshot.data as List<Category>;
              subCategories = categories
                      .firstWhere((e) => e.id == selectedCategoryId)
                      .children ??
                  [];
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) => MainCategory(
                        category: categories[i],
                        onSelect: onSelectMainCategory,
                        selected: categories[i].id == selectedCategoryId,
                      ),
                      itemCount: categories.length,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 8.0),
                      child: GridView.builder(
                        primary: false,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        padding: const EdgeInsets.all(20),
                        itemCount: subCategories.length,
                        itemBuilder: (_, i) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Productlist(category: subCategories[i]),
                            ));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xffd4dad1),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(subCategories[i].nameAr),
                            ),
                          ),
                        ),
                     
                      ),
                      decoration: const BoxDecoration(
                        // color: Colors.red,

                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}

class MainCategory extends StatelessWidget {
  final Category category;
  final bool selected;
  final ValueChanged<int> onSelect;

  const MainCategory(
      {required this.category,
      required this.onSelect,
      this.selected = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(category.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Colors.purple[300] : Colors.grey,
          borderRadius: BorderRadius.circular(20.0),
        ),
        width: 50,
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
        child: Text(
          category.nameAr,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
