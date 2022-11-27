import 'package:http/http.dart' as http;
import 'package:my_app_waleed/utils/my_string.dart';

import '../modle/product_model.dart';

class ProductServices {
  Future<List<Welcome>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return welcomeFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
