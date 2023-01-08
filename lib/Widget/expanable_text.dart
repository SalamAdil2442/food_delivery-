import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturants_test/unit/daimention.dart';

class TextWrapper extends StatefulWidget {
  TextWrapper({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _TextWrapperState createState() => _TextWrapperState();
}

class _TextWrapperState extends State<TextWrapper>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AnimatedSize(
          duration: Duration(milliseconds: 300),
          child: ConstrainedBox(
              constraints: isExpanded
                  ? BoxConstraints()
                  : BoxConstraints(maxHeight: 100),
              child: Text(widget.text,
                  style: TextStyle(
                      fontSize: dimention.font16,
                      color: Colors.black,
                      height: 1.5),
                  softWrap: true,
                  overflow: TextOverflow.fade))),
      isExpanded
          ? OutlinedButton.icon(
              label: Text('Read less'),
              icon: Icon(Icons.arrow_upward),
              onPressed: () => setState(() => isExpanded = false))
          : TextButton.icon(
              style: ButtonStyle(),
              icon: Icon(Icons.arrow_downward),
              label: Text(
                'Read more',
              ),
              onPressed: () => setState(() => isExpanded = true))
    ]);
  }
}
