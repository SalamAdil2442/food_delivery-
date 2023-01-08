import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:resturants_test/unit/daimention.dart';

class Add_icons extends StatelessWidget {
  final IconData icons;
  final Color backroundcolor;
  final Color iocncolor;
  double Size;
  final double iconsize;

  Add_icons(
      {super.key,
      this.iconsize = 24,
      this.Size = 40,
      required this.icons,
      this.backroundcolor = const Color(0xFFfcf4e4),
      this.iocncolor = const Color(0xFF756d54)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Size,
      height: Size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Size / 2),
        color: backroundcolor,
      ),
      child: Icon(
        icons,
        color: iocncolor,
        size: iconsize,
      ),
    );
  }
}
