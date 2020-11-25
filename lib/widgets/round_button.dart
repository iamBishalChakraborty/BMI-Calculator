import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({@required this.onPressed, this.icon});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(15),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        icon,
      ),
      shape: CircleBorder(),
    );
  }
}
