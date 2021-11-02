import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';


class DefaultButton extends StatelessWidget {

  Color background = defaultColor;
  Color textColor = Colors.white;
  double fontSize;
  double radius;
  Widget icon;
  double height;
  bool isExpanded = true;
  Function onPressed;
  String text;
  bool isBorder = false;
  bool isShadow = true;
  bool toUpper = true;
  bool isFittedText = false;
  bool iconEnd = false;



  DefaultButton({
    this.background = defaultColor,
    this.textColor = Colors.white,
    this.fontSize,
    this.radius,
    this.icon,
    this.height,
    this.isExpanded = true,
    @required  this.onPressed,
    @required  this.text,
    this.isBorder = false,
    this.isFittedText = false,
    this.isShadow = true,
    this.toUpper = true,
    this.iconEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpanded ? double.infinity : null,
      height: height ?? 50.h,
      decoration: BoxDecoration(
          color: isBorder ? Colors.transparent : background,
          borderRadius: BorderRadius.circular(
            radius ?? 10.r,
          ),
          border: isBorder ? Border.all(color: background) : null,
          boxShadow:isShadow &&!isBorder? [
          BoxShadow(color: Colors.black38, offset: Offset(2, 2), blurRadius: 2),
          ]:null
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation:MaterialStateProperty.all<double>(0) ,
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          padding:MaterialStateProperty.all(EdgeInsets.all(0)) ,
          overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Colors.white.withOpacity(0.20);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.white.withOpacity(0.20);
              return null; // Defer to the widget's default.
            },
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Directionality(
            textDirection:iconEnd ? TextDirection.ltr :TextDirection.rtl ,
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon != null ? icon : Container(),
                  icon != null
                      ? SizedBox(
                    width: 5.w,
                  )
                      : Container(),
                  isFittedText?
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      toUpper ? text.toUpperCase() : text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSize ?? 10.sp,
                        color: isBorder ? background :textColor ,
                      ),
                    ),
                  ): Text(
                    toUpper ? text.toUpperCase() : text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize ?? 10.sp,
                      color: isBorder ? background :textColor ,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}