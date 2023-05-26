import 'package:flutter_getx_api_product_list/data/models/product_model.dart';
import 'package:flutter_getx_api_product_list/data/services/product_service.dart';
import 'package:get/state_manager.dart';


class HomeController extends GetxController{

  var isLoading = true.obs;
  List<Product> productList = List<Product>.empty().obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  //Calling Data From Products
  void fetchProduct()async{
    try {
      isLoading(true);
      //Here We Have All data which we have fetched in remote server
      var products =  await ProductService.fetchProduct();
      //if We have Data
      if(productList != null){
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}