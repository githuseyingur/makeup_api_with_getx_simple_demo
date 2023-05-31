import 'package:flutter_getx_api_product_list/data/models/product_model.dart';
import 'package:flutter_getx_api_product_list/data/services/product_service.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;


class ProductController extends GetxController{

  var isLoading = true.obs;
  List<Product> productList = List<Product>.empty().obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  //Calling Data From Products
  void fetchProduct() async{
    try {
      isLoading(true);
      //Here We Have All data which we have fetched in remote server
       await ProductService.fetchProduct().then((value) {
        productList = filterDataList(value);
       });
    } finally {
      isLoading(false);
    }
  }

  List<Product> filterDataList(List<Product> dataList) {
  // Filtreleme işlemleri
    List<Product> filteredList = dataList.where((data) =>
      data.price != "0.0"
    ).toList();
    return filteredList;
  }

   static Future<bool> isImgNotFound(Product product) async{
   var response = await http.head(Uri.parse(product.imageLink));
   if(response.statusCode == 404) {
     return true;
   } else {
     return false;
   }
  }
}