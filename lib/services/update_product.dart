import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class UpdateProduct {
  Future <ProductModel> updateProduct ({
    required String? title ,
    required String? category ,
    required String? image ,
    required String? description ,
    required String? price ,
    required int? id ,
  })
  async{
    Map<String , dynamic>  data =    await Api().put(url: 'https://fakestoreapi.com/products$id',
      requests:{
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      },
    );
    print(data);

    return ProductModel.fromJson(data) ;
  }



}