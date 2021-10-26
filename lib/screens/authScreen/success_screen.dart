import 'package:conso_customer/screens/Home/HomeScreen.dart';
import 'package:conso_customer/screens/Home/home_notifier.dart';
import 'package:conso_customer/screens/adsScreen/ads_notifier.dart';
import 'package:conso_customer/screens/adsScreen/slide_item.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/ScrollColumnExpandable.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/custom_navigate.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:conso_customer/shared/pinCodeCustom/pin_code_fields.dart';
import 'package:conso_customer/shared/pinCodeCustom/pin_theme.dart';
import 'package:conso_customer/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

import 'package:provider/provider.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_notifier.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  String code ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:myAppBar('sign_up'.t),
      body: Stack(
        children: [Positioned.fill(child: Image.asset('assets/images/backgroungAuth.png',fit: BoxFit.cover,)),
          ScrollColumnExpandable(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
          children: [
            Spacer(flex: 10,) ,
            svgImage('success'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child:
              textBodyMedium('You_have_successfully_registered'.t,isBold: true , ),
            ) ,
            SizedBox(height: 20.h,) ,
            defaultButton(text: 'continue'.t,onPressed:(){
              CustomNavigate<HomeNotifier>().navigateAndFinish(context,  HomeScreen(), create: (context) =>HomeNotifier());

            }),

            Spacer(flex: 20,),
          ],
        )],

      ),
    );
  }
}
