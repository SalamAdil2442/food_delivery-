import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:resturants_test/Widget/big_text.dart';
import 'package:resturants_test/Widget/icon_text_string.dart';
import 'package:resturants_test/Widget/small_text.dart';
import 'package:resturants_test/unit/daimention.dart';

class page_colum extends StatelessWidget {
  final String text_of_name_of_foot;
  page_colum({super.key, required this.text_of_name_of_foot});

  @override
  Widget build(BuildContext context) {
    return Column(
      //      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        big_text(
          text: text_of_name_of_foot,
          size: dimention.font26,
        ),
        SizedBox(
          height: dimention.height12,
        ),
        Row(
          children: [
            Wrap(
                children: List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 124, 46, 46),
                          size: 17,
                        ))),
            SizedBox(
              width: 5,
            ),
            text_small(text: "4.5"),
            SizedBox(
              width: dimention.width20,
            ),
            text_small(text: "1252"),
            SizedBox(
              width: dimention.width4,
            ),
            text_small(text: "comment"),
          ],
        ),
        SizedBox(
          height: dimention.height12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon_text(
                icons: Icons.circle_sharp,
                texts: "Normall",
                coloricon: Color.fromARGB(255, 231, 9, 9),
                colortext: Color.fromARGB(179, 0, 0, 0)),
            icon_text(
                icons: Icons.location_city,
                texts: "17.2",
                coloricon: Color.fromARGB(255, 250, 2, 2),
                colortext: Color.fromARGB(179, 129, 7, 7)),
            icon_text(
                icons: Icons.av_timer_rounded,
                texts: "min",
                coloricon: Color.fromARGB(255, 250, 2, 2),
                colortext: Color.fromARGB(179, 129, 7, 7))
          ],
        ),
      ],
    );
  }
}
