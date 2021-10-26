import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle defaultTextStyleWithShadow() =>
    TextStyle(fontSize: 25.sp,
      color: defaultColor,
      fontWeight: FontWeight.w500,
      shadows:  [
      Shadow(
      blurRadius: 5.0,
      color: Colors.black,
      offset: Offset(2.0, 2.0),
    ),]
,
);
TextStyle defaultTextStyle() =>
    TextStyle(fontSize: 25.sp,
      color: defaultColor,
      fontWeight: FontWeight.w500,
    );

TextStyle defaultTextStyleTitle() =>
    TextStyle(fontSize: 18.sp,

      color: Colors.white,
      fontWeight: FontWeight.w800,
    );

TextStyle defaultTextStyleBody({isBold = false}) =>
    TextStyle(fontSize: 18.sp,

      color: Colors.white,
      fontWeight:isBold? FontWeight.w900 :FontWeight.w700,
    );
TextStyle defaultTextStyleHint() =>
    TextStyle(fontSize: 18.sp,
      color: defaultHint,
      fontWeight:FontWeight.w600,

    );

TextStyle defaultTextStyleHintDialog({size}) =>
    TextStyle(fontSize:size?? 15.sp,

      color: defaultHint,
      fontWeight:FontWeight.w600,

    );