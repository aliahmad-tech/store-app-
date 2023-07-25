import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/get_all_products.dart';
import 'package:store/widgets/Product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
static String id = "homepage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       elevation:0,
       backgroundColor: Colors.white,
       title:  Row(children: const [
         Icon(Icons.arrow_back_ios, color: Colors.black26,size: 30,),
         Spacer(flex: 1,),
         Text('New Trend',style: TextStyle( color: Colors.black54),),
         Spacer(flex: 1,),
         Icon(Icons.shopping_cart, color: Colors.black,size: 30,),

       ]),
    ),
      body: FutureBuilder<List<ProductModel>> (
        future: GetAllProductsService().getProducts(),
        builder: (context, snapshot){
          if (snapshot.hasData )
            {
              List<ProductModel> products = snapshot.data!;
              return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
              itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);

                }
                  ),);
            }
          else
            {
            return Center(child: CircularProgressIndicator());
            }
        } ,
      )

      );
  }
}

