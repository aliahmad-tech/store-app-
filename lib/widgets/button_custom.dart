import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({this.onTap , required this.buttonText});
   VoidCallback? onTap;
   String buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.green
        ),
        height: 60,
        width: double.infinity,
        child: Center(child: Text(buttonText)),
      ),
    );
  }
}
