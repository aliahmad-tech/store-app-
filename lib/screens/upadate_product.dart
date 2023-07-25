import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product.dart';
import 'package:store/widgets/button_custom.dart';
import 'package:store/widgets/custom_text_field.dart';
import 'package:store/widgets/snack_bar.dart';
class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);
static String id = 'uddud';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
 String? title  , image , description ,price   ;

 bool isLoading =false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =  ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
         appBar: AppBar(
           automaticallyImplyLeading: false,
           title: Center(child: Text('update product', style: TextStyle(color: Colors.black))),
           backgroundColor: Colors.transparent,
           elevation: 0,
         ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
                children: [
              CustomTextField(pass: false , hintText: 'product name',onChanged: (data){title = data;}),
                  SizedBox(height: 10,),
              CustomTextField(pass: false , hintText: 'description',onChanged: (data){description = data;}),
                  SizedBox(height: 10,),
              CustomTextField(pass: false , hintText: 'price',onChanged: (data){price = data;},inputType: TextInputType.number,),
                  SizedBox(height: 10,),
              CustomTextField(pass: false , hintText: 'image',onChanged: (data){image = data;}),
                  SizedBox(height: 30,),
                  CustomButton(
                      buttonText: 'update',
                      onTap: ()
                      async{
                     await  updateProduct(product);

                        isLoading = true ;
                        setState(() {

                        });
                        try {
                           showSnackBar(context, 'succes');
                        } catch (e) {
                          print(e);
                          showSnackBar(context, 'nooooooooooo');
                        }
                        isLoading =false ;
                        setState(() {

                        });
                      })
            ]),
          ),
        ),
      ),
    );
  }

  Future <void> updateProduct(ProductModel product) async{
    await UpdateProduct().updateProduct(
      id : product.id,
        title: title== null ? product.title : title !,
        category:product.category ,
        image: image== null ? product.image : image !,
        description: description== null ? product.description : description !,
        price: price== null ? product.price.toString() : price !,
    );
  }
}
