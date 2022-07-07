import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final VoidCallback clickAction;

  const Button({
    Key key,
    this.buttonColor,
    this.buttonText,
    this.clickAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: buttonColor,
      ),
      child: FlatButton(
        onPressed: clickAction,
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
}
