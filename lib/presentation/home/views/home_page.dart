import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_api_product_list/presentation/home/controllers/home_controller.dart';
import 'package:flutter_getx_api_product_list/utilities/components/product_tile.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'ShopX',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.view_list_rounded), onPressed: () {}),
                IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if(homeController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  
                  itemCount: homeController.productList.length,
                  itemBuilder: (context, index) {
                    return ProductTile(homeController.productList[index]);
                  },
                );
            }),
          )
        ],
      ),
    );
  }
}
