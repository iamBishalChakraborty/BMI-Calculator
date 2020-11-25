import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label, this.color});

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70,
          color: color,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: TextStyle(color: color, fontFamily: 'NunitoSans'),
        ),
      ],
    );
  }
}
