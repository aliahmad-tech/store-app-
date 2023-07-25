import 'package:flutter/material.dart';
import 'package:store/screens/home_page.dart';
import 'package:store/screens/upadate_product.dart';
void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        HomePage.id : (context) => const  HomePage() ,
        UpdateProductPage.id : (context) =>   UpdateProductPage() ,

      } ,
      initialRoute: HomePage.id ,
    );
  }
}

