
import 'package:conso_customer/screens/authScreen/forgot_password.dart';
import 'package:conso_customer/screens/authScreen/sign_up_screen.dart';
import 'package:conso_customer/screens/authScreen/verifi_screen.dart';
import 'package:conso_customer/shared/components/ScrollColumnExpandable.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:conso_customer/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_notifier.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController()..text = '' ;
  TextEditingController password = TextEditingController()..text = '' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:myAppBar('sign_in'.t),
      body: Stack(
        children: [Positioned.fill(child: Image.asset('assets/images/backgroungAuth.png',fit: BoxFit.cover,)),
          ScrollColumnExpandable(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
          children: [
            Spacer(flex: 20,) ,
             Center(child: Text('messageLogin'.t,textAlign: TextAlign.center,style: defaultTextStyleBody(),)) ,
            Spacer(flex: 20,) ,
            Card(
              clipBehavior:Clip.hardEdge ,
             // margin: EdgeInsets.symmetric(horizontal: 20.w),
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)
              ) ,
              child:Column(
                children: [
                  defaultTextForm(email,
                  'email|mobile'.t ,type: TextInputType.emailAddress,
                      icon: svgImage('email')) ,
                  Divider(height: 1.h,) ,
                  defaultTextForm(password, 'password'.t ,
                      type: TextInputType.emailAddress,
                  icon: svgImage('password')) ,
                ],
              ) ,
            ),
            SizedBox(height: 20.h,) ,
            defaultButton(text: 'sign_in'.t,onPressed:(){
              To(context, VerifiScreen()) ;
            }),
            Spacer(flex: 20,),
            Center(child: InkWell(
              onTap: (){
                To(context, ForgotPassword()) ;
              },
            child: Text('forget_password'.t,textAlign: TextAlign.center,style: defaultTextStyleBody(),))) ,
            Spacer(flex: 20,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              Text('Do_you_have_account'.t,textAlign: TextAlign.center,style: defaultTextStyleBody(),) ,
              InkWell(
                onTap: (){
                  To(context, SignUpScreen()) ;
                },
                  child: Text('sign_up'.t,textAlign: TextAlign.center,style: defaultTextStyleBody(isBold: true),)) ,

            ],),

            Spacer(flex: 20,),
          ],
        )],

      ),
    );
  }
}
