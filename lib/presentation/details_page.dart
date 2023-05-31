import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_api_product_list/controller/product_controller.dart';
import 'package:flutter_getx_api_product_list/data/models/product_model.dart';

import 'package:flutter_getx_api_product_list/utilities/components/product_tile.dart';
import 'package:get/get.dart';


class DetailsPage extends StatelessWidget {
  
  final ProductController homeController = Get.put(ProductController());

  DetailsPage(
    this.product,
    {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60,),
          Row(
            children: [
              Spacer(flex: 1,),
              IconButton(onPressed: (){
                Navigator.pop(context);
              },
             icon: Icon(Icons.arrow_back_sharp)),
             Spacer(flex: 10,),
              Text(product.name, style: TextStyle(
                      color: Colors.redAccent[700],
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                      ),),
                      Spacer(flex: 15,)
            ],
          ),
          SizedBox(height: 40,),
          Image.network(
                      product.imageLink,
                      width: MediaQuery.of(context).size.width*0.82,
                      height: 200,
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
                    SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(product.description, style: TextStyle(
            ),
            textAlign: TextAlign.justify,
            ),),
          SizedBox(height: 40,),
          RichText(text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Category : ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                  )
              ),
              TextSpan(
                text: product.category,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                  )
              ),
            ]
          )),
          SizedBox(height: 12,),
          RichText(text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Price : ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                  )
              ),
              TextSpan(
                text: product.price + " " + String.fromCharCode(36),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                  )
              ),
            ]
          )),
          SizedBox(height: 12,),
          RichText(text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Marka : ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                  )
              ),
              TextSpan(
                text: product.brand.toString(),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                  )
              ),
            ]
          )),
          SizedBox(height: 12,),
          RichText(text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Product Type : ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                  )
              ),
              TextSpan(
                text: product.productType,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                  )
              ),
            ]
          )),
          SizedBox(height: 12,),
          RichText(text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Rating : ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                  )
              ),
              TextSpan(
                text: product.rating.toString(),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                  )
              ),
            ]
          )),
          SizedBox(height: 12,),
          RichText(text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Create Date : ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                  )
              ),
              TextSpan(
                text: product.createdAt.toString(),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                  )
              ),
            ]
          )),
          SizedBox(height: 12,),
          RichText(text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Update Date : ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                  )
              ),
              TextSpan(
                text: product.updatedAt.toString(),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                  )
              ),
            ]
          )),
        ],
      ),
    );
  }
}
