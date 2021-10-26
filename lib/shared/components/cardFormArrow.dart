import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class MyCardForm extends StatefulWidget {
  final String name ;
  final bool isChek ;
  final bool isSwitch ;
  final Function onTap ;
  const MyCardForm(this.name, this.onTap , {this.isChek = false , this.isSwitch=true}) ;

  @override
  _MyCardFormState createState() => _MyCardFormState();
}

class _MyCardFormState extends State<MyCardForm> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(padding: EdgeInsets.all(10.r),
          decoration: boxDecoration,
          child: Row(
            children: [
              textBody(widget.name,color: widget.isChek ? Colors.black :defaultHint),
              Spacer() ,
              if(widget.isSwitch)
              widget.isChek? svgImage('valid'):svgImage('notValid'),
              Icon(Icons.arrow_forward_ios,color: defaultColor)
            ],
          )),
    );
  }
}
