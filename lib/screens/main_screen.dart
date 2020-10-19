import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/data/data.api/category_api.dart';
import 'package:flutter_api/data/data.api/product_api.dart';
import 'package:flutter_api/models/category.dart';
import 'package:flutter_api/models/product.dart';
import 'package:flutter_api/widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = List<Category>();
  List<Widget> categoryWidgets = List<Widget>();
  List<Product> products = List<Product>();

  @override
  void initState() {
    getCategoriesFromApi();
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Yemek Listesi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            ),
            ProductListWidget(products)
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((value) {
      setState(() {
        Iterable list = json.decode(value.body);
        this.categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return FlatButton(
      onPressed: () {
        getProductsById(category);
      },
      child: Text(
        category.name,
        style: TextStyle(color: Colors.blueAccent),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.grey)),
    );
  }

  void getProductsById(Category category) {
    ProductApi.getProductsById(category.categoryID).then((value) {
      setState(() {
        Iterable list = json.decode(value.body);
        this.products = list.map((e) => Product.fromJson(e)).toList();
      });
    });
  }

  void getProducts() {
    ProductApi.getProducts().then((value) {
      setState(() {
        Iterable list = json.decode(value.body);
        this.products = list.map((e) => Product.fromJson(e)).toList();
      });
    });
  }
}
