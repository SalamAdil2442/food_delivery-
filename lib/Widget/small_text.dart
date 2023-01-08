import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class text_small extends StatelessWidget {
  String text;
  double size;
  final Color? colors_text;
  text_small({super.key, this.size = 14, required this.text, this.colors_text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontStyle: FontStyle.italic,
        color: colors_text,
        backgroundColor: Colors.white70,
      ),
    );
  }
}
