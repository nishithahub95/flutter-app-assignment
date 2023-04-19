import 'package:flutter/material.dart';

class ThemeHelper{
  InputDecoration textInputDecoration([String lableText="", String hintText = "",IconData ficon=Icons.add]){
    return InputDecoration(
     // label: Text('Name'),
      focusColor: Colors.grey,
      labelText: lableText,

     suffixIcon: Icon(ficon,color: Colors.red,),
      labelStyle: TextStyle(color: Colors.black,fontSize: 18),
      hintText: hintText,
      fillColor: Colors.white,
      filled: true,
    );
  }

}