import 'package:flutter/material.dart';
import 'package:flutter_api/models/product.dart';

// ignore: must_be_immutable
class ProductListRowWidget extends StatelessWidget {
  Product product;
  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            Container(
              child: Image.network(
                  "https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_1280.jpg"),
              height: 130,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Text(product.name),
            Text(
              product.unitPrice.toString() + " TL",
              style: TextStyle(color: Colors.blueGrey, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
