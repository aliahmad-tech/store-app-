class ProductModel
{
  final int id ;
  final String  title ;
  final dynamic price  ;
  final String description ;
  final String category ;
  final String image ;
  final ProductRatingModel rating ;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required  this.description,
    required  this.category,
    required this.image,
    required this.rating,
  });
  factory ProductModel.fromJson(jsonData)
  {
  return ProductModel(
      id: jsonData['id'],
      category: jsonData['category'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      image: jsonData['image'],
      rating: ProductRatingModel.fromJson(jsonData['rating'])
  );
  }
}


class ProductRatingModel
{
final dynamic rate;
final dynamic count;
  ProductRatingModel({required this.rate,required this.count});
  factory ProductRatingModel.fromJson(jsonData)
  {
   return ProductRatingModel(rate: jsonData['rate'], count: jsonData['count'])  ;

  }

}