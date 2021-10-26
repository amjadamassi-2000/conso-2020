import 'package:conso_customer/screens/adsScreen/ads_notifier.dart';
import 'package:conso_customer/screens/adsScreen/slide_item.dart';
import 'package:conso_customer/shared/components/ScrollColumnExpandable.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:conso_customer/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_notifier.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController()..text = '' ;
  TextEditingController password = TextEditingController()..text = '' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:myAppBar('Restore_password'.t),
      body: Stack(
        children: [Positioned.fill(child: Image.asset('assets/images/backgroungAuth.png',fit: BoxFit.cover,)),
          ScrollColumnExpandable(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
          children: [
            Spacer(flex: 10,) ,
             Center(child: textBodyMedium('ForgotPasswordMessage'.t,)) ,

            SizedBox(height: 30.h,) ,
            Card(
              clipBehavior:Clip.hardEdge ,
             // margin: EdgeInsets.symmetric(horizontal: 20.w),
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)
              ) ,
              child:defaultTextForm(email,
              'email'.t ,type: TextInputType.emailAddress,
                  icon: svgImage('email')) ,
            ),
            SizedBox(height: 40.h,) ,
            defaultButton(text: 'Send_activation_code'.t,onPressed:(){

            }),

            Spacer(flex: 20,),

          ],
        )],

      ),
    );
  }
}
