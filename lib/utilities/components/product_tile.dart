import 'package:flutter/material.dart';
import 'package:flutter_getx_api_product_list/data/models/product_model.dart';
import 'package:get/get.dart';


class ProductTile extends StatelessWidget {
   ProductTile(
    this.product, 
    this.onTap,
  {super.key}
  );

  final Product product;
  Function()? onTap;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 192,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      product.imageLink,
                      loadingBuilder: (BuildContext context, child, loadingProgress) {
                        if(loadingProgress == null){
                          return child;
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (BuildContext context, error, stackTrace) {
                        return Container(
                        child: Center(
                          child: Text("There was an error when loading image.." , style: TextStyle(
                            color: Colors.redAccent[700],
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),),
                        ),
                        );
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Obx(() => Container(
                      
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Color.fromARGB(255, 216, 216, 216))
                        ),
                      child: IconButton(
                        icon: product.isFavorite.value
                            ? Icon(Icons.favorite_rounded, color: Colors.green[700],)
                            : Icon(Icons.favorite_border, color: Colors.green[700],),
                        onPressed: () {
                          product.isFavorite.toggle();
                        },
                      ),
                    )),
                  )
                ],
              ),
              SizedBox(height: 8),
              Text(
                product.name,
                maxLines: 2,
                style:
                TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              if (product.rating != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product.rating.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 8),
              Text(product.price + String.fromCharCode(36),
                  style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
            ],
          ),
        ),
      ),
    );
  }
}