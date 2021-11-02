import 'package:conso_customer/screens/adsScreen/ads_notifier.dart';
import 'package:conso_customer/screens/adsScreen/slide_item.dart';
import 'package:conso_customer/shared/components/ScrollColumnExpandable.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/default_button.dart';
import 'package:conso_customer/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_notifier.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController new_password = TextEditingController()..text = '' ;
  TextEditingController confirm_password = TextEditingController()..text = '' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:myAppBar('sign_in'.t),
      body: Stack(
        children: [Positioned.fill(child: Image.asset('assets/images/backgroungAuth.png',fit: BoxFit.cover,)),
          ScrollColumnExpandable(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
          children: [
            Spacer(flex: 10,) ,
            Center(child: Text('messageLogin'.t,textAlign: TextAlign.center,style: defaultTextStyleBody(),)) ,
            SizedBox(height: 20.h,) ,
            Card(
              clipBehavior:Clip.hardEdge ,
             // margin: EdgeInsets.symmetric(horizontal: 20.w),
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)
              ) ,
              child:Column(
                children: [
                  defaultTextForm(new_password,
                  'new_password'.t ,type: TextInputType.visiblePassword,
                      icon: svgImage('password')) ,
                  Divider(height: 1.h,) ,
                  defaultTextForm(confirm_password, 'confirm_password'.t ,
                      type: TextInputType.visiblePassword,
                  icon: svgImage('password')) ,
                ],
              ) ,
            ),
            SizedBox(height: 20.h,) ,
            DefaultButton(text: 'sign_in'.t,onPressed:(){

            }),
            Spacer(flex: 20,),



          ],
        )],

      ),
    );
  }
}
