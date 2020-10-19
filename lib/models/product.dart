class Product {
  int productID;
  int categoryID;
  String quantityPerUnit;
  double unitPrice;
  int unitsInStock;
  String name;

  Product(this.productID, this.categoryID, this.quantityPerUnit, this.unitPrice,
      this.unitsInStock, this.name);

  Product.fromJson(Map json) {
    productID = json["productID"];
    categoryID = json["categoryID"];
    quantityPerUnit = json["quantityPerUnit"];
    unitPrice = double.tryParse(json["unitPrice"].toString());
    unitsInStock = json["unitsInStock"];
    name = json["name"];
  }

  Map toJson() {
    return {
      "productID": productID,
      "categoryID": categoryID,
      "quantityPerUnit": quantityPerUnit,
      "unitPrice": unitPrice,
      "unitsInStock": unitsInStock,
      "name": name
    };
  }
}
