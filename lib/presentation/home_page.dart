import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_api_product_list/presentation/details_page.dart';
import 'package:flutter_getx_api_product_list/controller/product_controller.dart';
import 'package:flutter_getx_api_product_list/utilities/components/product_tile.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  
  final ProductController homeController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 165, 32, 32),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.menu, color: Colors.white,),
                        onPressed: () {}
                        ),
                    
                    Spacer(flex: 4,),
                    Text(
                        'Make-Up',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                            ),
                      ),
                      Spacer(flex: 1,),
                  
                  ],
                ),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Obx(() =>
               homeController.isLoading.value?
              Center(child: CircularProgressIndicator()):
               ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
                scrollDirection: Axis.vertical,
                itemCount: homeController.productList.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                  homeController.productList[index],
                  (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  DetailsPage(homeController.productList[index])),
                      );
                  }   
                  );
                },
                  ),
            ),
        
            flex: 9,
          )
        ],
      ),
    );
  }
}
