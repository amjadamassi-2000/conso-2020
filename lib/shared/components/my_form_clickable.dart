import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFormClickable extends StatefulWidget {
 final TextEditingController textEditingController ;
 final String hint ;
 final Function onTap ;
   MyFormClickable({Key key, this.textEditingController, this.hint, this.onTap , }) : super(key: key);

  @override
  _MyFormClickableState createState() => _MyFormClickableState();
}

class _MyFormClickableState extends State<MyFormClickable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
      child: Row(
        children: [
          Expanded(
              child: defaultTextFormDialog(
                  widget.textEditingController,widget.hint,
                  onTap:widget.onTap,
                  icon: svgImage('user'))),
          Icon(
            Icons.arrow_forward_ios,
            color: defaultColor
          )
        ],
      ),
    );
  }
}
