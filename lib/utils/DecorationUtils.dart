import 'package:flutter/material.dart';

class DecorationUtils{

/**
 * Box decoration ovalado con sombra
 * More info :
 * https://stackoverflow.com/questions/52227846/how-can-i-add-shadow-to-the-widget-in-flutter
 */
 static BoxDecoration boxDecorationShadowOval(double radius){
   return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      );
 }
}