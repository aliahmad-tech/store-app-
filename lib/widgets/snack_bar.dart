import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String messaege) {

  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content:Text(messaege)));
}

