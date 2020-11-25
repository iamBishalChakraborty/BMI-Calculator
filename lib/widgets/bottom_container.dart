import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({@required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
              letterSpacing: 3,
              fontFamily: 'NunitoSans',
              fontWeight: FontWeight.w800),
        ),
      ),
      decoration: BoxDecoration(
        color: Color(0xFFec3a56),
      ),
    );
  }
}
