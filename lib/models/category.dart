class Category {
  int categoryID;
  String name;
  String description;

  Category(this.categoryID, this.description, this.name);

  Category.fromJson(Map json) {
    categoryID = json["categoryID"];
    description = json["description"];
    name = json["name"];
  }

  Map toJson() {
    return {"categoryID": categoryID, "description": description, "name": name};
  }
}
