import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/upadate_product.dart';


class ProductCard extends StatelessWidget {
   ProductCard({ required this.product, Key? key}) : super(key: key);
ProductModel product ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);

      },
      child: Stack(
        children: [
          Container(
            height: 190,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius:40,
                        spreadRadius: 0,
                        offset: Offset(15  , 15),

                      )
                      ] ),
                  child: Card(
                    elevation: 3,
                    child:Padding(
                      padding: const EdgeInsets.only(top: 38 , bottom: 5,left: 16, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:   MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 10,),
                          Container(height: 45,child: Text(product.title,style: TextStyle( color: Colors.black38),)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(product.price.toString(),style: TextStyle( color: Colors.black54),),
                              Icon(Icons.favorite, color: Colors.red,),
                            ],)
                        ],),
                    )),
                ),
              ],
            ),
          ),
          Positioned(
              height: 70,
              width: 150,
              child: Image.network(product.image))
        ],
      ),
    );
  }
}