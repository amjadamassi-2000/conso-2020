import 'package:conso_customer/modle/base_respons.dart';
import 'package:conso_customer/modle/User.dart';
import 'package:conso_customer/my_widgets/custom_botton.dart';
import 'package:conso_customer/screens/authScreen/login_screen.dart';
import 'package:conso_customer/shared/components/ScrollColumnExpandable.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/network/remote/WebSarvice.dart';
import 'package:conso_customer/shared/network/remote/dio_helper.dart';
import 'package:conso_customer/shared/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ForgotPassword extends StatefulWidget {

  TextEditingController mobile;
  ForgotPassword({this.mobile});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


  TextEditingController email = TextEditingController()..text = '' ;
//  TextEditingController password = TextEditingController()..text = '' ;

  final _formKey = GlobalKey<FormState>();


  forgetPassword(startLoading, stopLoading, btnState) async {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      try {
        startLoading();
        Response response = await getResponse(doYouForgetPassword, data: {
         "email": email.text ,
         'mobile': widget.mobile.text,
         "type" : 1,
        });
        var res = BaseResponse.fromJson(
          response.data,
        );
        if (res.status) {
          //print('track 2${mobile.text}') ;
          To(context, LoginScreen());
        } else {
          showDialogWithMessage(context, res.message);
        }
      } catch (error) {
        stopLoading();
        print(error);
        showDialogWithMessage(context, error.message);
      }
    }
  }





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
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)
              ) ,
              child: defaultTextForm(
                  email,
                  'email'.t ,
                  type: TextInputType.emailAddress,
                  icon: svgImage('email'),

              ) ,
            ),

            SizedBox(height: 40.h,) ,



//            DefaultButton(text: 'Send_activation_code'.t,onPressed:(){
//
//            }),

            CustomBtnComponent(
                text: 'Send_activation_code'.t,
                onTap: (startLoading, stopLoading, btnState) {
                  forgetPassword(startLoading, stopLoading, btnState);
                }),






            Spacer(flex: 20,),

          ],
        )],

      ),
    );
  }
}
