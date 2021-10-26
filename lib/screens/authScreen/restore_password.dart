import 'package:conso_customer/screens/adsScreen/ads_notifier.dart';
import 'package:conso_customer/screens/adsScreen/slide_item.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/ScrollColumnExpandable.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/pinCodeCustom/pin_code_fields.dart';
import 'package:conso_customer/shared/pinCodeCustom/pin_theme.dart';
import 'package:conso_customer/shared/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

import 'package:provider/provider.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_notifier.dart';

class RestorePassword extends StatefulWidget {
  @override
  _RestorePasswordState createState() => _RestorePasswordState();
}

class _RestorePasswordState extends State<RestorePassword> {
  String code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Restore_password'.t),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/images/backgroungAuth.png',
            fit: BoxFit.cover,
          )),
          ScrollColumnExpandable(
            crossAxisAlignment: CrossAxisAlignment.center,
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            children: [
              Spacer(
                flex: 15,
              ),
              Container(
                  child: textBodyMedium(
                'Restore_password_message'.t,
              )),
              SizedBox(
                height: 30.h,
              ),
              getCard('by_email'.t , 'email',(){

              }),
              getCard('By_mobile_number'.t,'phone',(){

              }),

              Spacer(
                flex: 20,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getCard(text , svg , function)=>  Card(
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r)),
    child: InkWell(
      onTap: function,
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: 15.h ,bottom:15.h , start: 40.w),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            svgImage(svg,color: defaultColor) , SizedBox(width: 10.w,) , textBodyMedium(text , fontSize: 17.sp,color: defaultColor,) ,
          ],),
      ),
    ),
  );
}
