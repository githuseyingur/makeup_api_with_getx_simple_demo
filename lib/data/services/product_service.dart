import 'package:flutter_getx_api_product_list/data/models/product_model.dart';
import 'package:http/http.dart' as http;



class ProductService{
  static var client = http.Client();

  // Fetching Products
  // Here and pass to controller
  static Future<List<Product>> fetchProduct() async{
    var response = await client.get( Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json'));
    if(response.statusCode == 200){
      var jsonString = response.body;
      return productFromJson(jsonString);
    }else{
      return []; 
    }
  }
}