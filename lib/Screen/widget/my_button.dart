import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  String title;
  final VoidCallback onPress;
  MyButton({Key? key,required this.title,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(title,style: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 2),),
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),
      ),
    );
  }
}
