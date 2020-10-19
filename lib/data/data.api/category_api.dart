import 'package:http/http.dart' as http;

class CategoryApi {
  static Future getCategories() {
    return http.get("http://9cf7a27bf442.ngrok.io/categories");
  }
}
