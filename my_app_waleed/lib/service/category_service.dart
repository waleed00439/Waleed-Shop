import 'package:http/http.dart' as http;
import 'package:my_app_waleed/utils/my_string.dart';

import '../modle/category_model.dart';
import '../modle/product_model.dart';

class CategoryServices {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}

class AllCategorySercvises {
  static Future<List<Welcome>> getAllCategory(String categoryNames) async {
    var response =
        await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return welcomeFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
