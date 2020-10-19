import "package:http/http.dart" as http;

class ProductApi {
  static Future getProducts() {
    return http.get("http://9cf7a27bf442.ngrok.io/products");
  }

  static Future getProductsById(int categoryId) {
    return http
        .get("http://9cf7a27bf442.ngrok.io/products?categoryID=$categoryId");
  }
}
