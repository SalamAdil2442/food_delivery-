import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturants_test/unit/daimention.dart';

class big_text extends StatelessWidget {
  String text;
  TextOverflow? overflow1;
  double? size;
  Color? color1;

  big_text(
      {super.key,
      this.color1,
      this.overflow1 = TextOverflow.ellipsis,
      required this.text,
      this.size = 0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow1,
      style: TextStyle(
          fontSize: size == 0 ? dimention.font20 : size,
          fontWeight: FontWeight.w400,
          color: color1),
    );
  }
}
