import 'package:flutter/cupertino.dart';
import 'package:resturants_test/Widget/small_text.dart';
import 'package:resturants_test/unit/daimention.dart';

class icon_text extends StatelessWidget {
  final IconData icons;
  final String texts;
  final Color coloricon;
  final Color colortext;
  const icon_text({
    super.key,
    required this.icons,
    required this.texts,
    required this.coloricon,
    required this.colortext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icons,
          color: coloricon,
        ),
        SizedBox(
          width: dimention.width4,
        ),
        text_small(
          text: texts,
          colors_text: colortext,
        )
      ],
    );
  }
}
