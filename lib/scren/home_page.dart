import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:resturants_test/Widget/big_text.dart';
import 'package:resturants_test/Widget/small_text.dart';
import 'package:resturants_test/scren/page_view.dart';



import 'package:resturants_test/unit/daimention.dart';

class homescrren extends StatefulWidget {
  const homescrren({super.key});

  @override
  State<homescrren> createState() => _homescrrenState();
}

class _homescrrenState extends State<homescrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: dimention.width10,
                top: dimention.height25,
                right: dimention.width10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    big_text(text: "Iraq"),
                    Row(
                      children: [
                        text_small(text: "kurdstan"),
                        Icon(
                          (Icons.arrow_drop_down),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  height: dimention.height35,
                  width: dimention.width35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(dimention.radius14),
                      color: Colors.amberAccent),
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: page_view1(),
          ))
        ],
      ),
    );
  }
}
