import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchProducts() async {

  var result = await http.get(Uri.https('s3-eu-west-1.amazonaws.com','api.themeshplatform.com/products.json'));
  if (result.statusCode == 200) {
    final responseJson = json.decode(result.body)['data'];
    print(responseJson);
    return responseJson;
  }
  else {
    throw Exception('Failed to load post');
  }

}
