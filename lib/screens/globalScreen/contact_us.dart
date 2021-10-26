import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:conso_customer/extensions_lang.dart';
class ContactUs extends StatefulWidget {
  const ContactUs({Key key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('contactUs'.t),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            buildTitleView('Follow_us_on'.t),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                svgImage('twitter'),
                svgImage('facebook'),
                svgImage('instagram')
              ],
            ),
            SizedBox(height: 20.h,),
            buildTitleView('contactUs'.t),
            SizedBox(height: 20.h,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildColumnView('contactUs', 'big_call') ,
                    buildColumnView('write to us', 'bigEmail') ,
                  ],

                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildColumnView('الدعم الفني', 'big_support') ,
                    buildColumnView('قيمنا', 'big_favorite') ,
                  ],

                ),
              ],
            )
          ],
        ),
      ),
    );
  }


  buildColumnView(String text ,String icon){
    return Column(children: [
      svgImage(icon),
      SizedBox(height: 10.h,),
      textBodyMedium(text.t,color: defaultColor)
    ],);
  }
  buildTitleView(String title){
   return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(color: defaultColor,thickness: 2,)),
        SizedBox(width: 10.w,),
        textBodyMedium(title,color: defaultColor) ,
        SizedBox(width: 10.w,),
        Expanded(child: Divider(color: defaultColor,thickness: 2))
      ],);
  }
}
