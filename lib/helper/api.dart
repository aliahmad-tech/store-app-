import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:store/models/product_model.dart';
class Api
{
  Future <List<dynamic>> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));

      List<dynamic> data =  jsonDecode(response.body);
      return data;
  }




  Future <dynamic> post({required String url, @required dynamic requests , @required String? token}) async {
    Map <String , String> headers  = {};
    if (token != null ){
      headers = {
        'accept' : 'application/json',
        'Content-Type' : 'application/x-www-form-urlencoded',
        'Authorization' : 'Bearer $token'}; }
      else {
      headers = {
        'accept' : 'application/json',
        'Content-Type' : 'application/x-www-form-urlencoded',
      };
    }
    http.Response response = await http.post(Uri.parse(url),
        body: requests,
        headers:headers
    );
   Map <String , dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data ;
    }
    else{
      throw Exception('there is a problem with status code : ${response.statusCode} ');
    }
  }


  Future <dynamic> put({required String url, @required dynamic requests , @required String? token}) async {
    Map <String , String> headers  = {};
    print('kkkkkkkkkkkkkkkkkkkkkkkk');

    if (token != null ){
      headers = {
        'accept' : 'application/json',
        'Content-Type' : 'application/x-www-form-urlencoded',
        'Authorization' : 'Bearer $token'}; }
      else {
      headers = {
        'accept' : 'application/json',
        'Content-Type' : 'application/x-www-form-urlencoded',
      };
    }
    http.Response response = await http.put(Uri.parse(url),
        body: requests,
        headers:headers
    );
   Map<dynamic, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data ;
    }
    else{
      throw Exception('there is a problem with status code : ${response.statusCode} ');
    }
  }

}