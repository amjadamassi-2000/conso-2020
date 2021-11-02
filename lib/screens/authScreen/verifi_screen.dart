import 'package:conso_customer/modle/base_respons.dart';
import 'package:conso_customer/modle/User.dart';
import 'package:conso_customer/my_widgets/custom_botton.dart';
import 'package:conso_customer/screens/Home/HomeScreen.dart';
import 'package:conso_customer/screens/authScreen/sign_up_screen.dart';
import 'package:conso_customer/screens/authScreen/success_screen.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/ScrollColumnExpandable.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/default_button.dart';
import 'package:conso_customer/shared/network/remote/WebSarvice.dart';
import 'package:conso_customer/shared/network/remote/dio_helper.dart';
import 'package:conso_customer/shared/pinCodeCustom/pin_code_fields.dart';
import 'package:conso_customer/shared/pinCodeCustom/pin_theme.dart';
import 'package:conso_customer/shared/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class VerifiScreen extends StatefulWidget {

  TextEditingController mobile;
  VerifiScreen({this.mobile});

  @override
  _VerifiScreenState createState() => _VerifiScreenState();
}

class _VerifiScreenState extends State<VerifiScreen> {


  String code ;
  User _user;

  sendVerificationCode(startLoading, stopLoading, btnState ) async {
    print('track 1${widget.mobile.text}') ;
      try {
        startLoading();
        Response response = await getResponse(checkCode, data:
        {
          'mobile': widget.mobile.text,
          'code': code,
           "type" : 1,
        });
        var res = BaseResponse.fromJson(response.data , keyObject: 'user' , fun: (Map<String, dynamic> json ) {
          return User.fromJson(json);
        },
        );
        setUser(res.object as User);
        if (res.status) {
          To(context, SuccessScreen());
        } else {
          showDialogWithMessage(context, res.message);
        }
      }
      catch (error) {
        stopLoading();
        print(error.toString());
        showDialogWithMessage(context,'error.message');
      }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:myAppBar('Mobile_Number_Verification'.t),
      body: Stack(
        children: [Positioned.fill(child: Image.asset('assets/images/backgroungAuth.png',fit: BoxFit.cover,)),
          ScrollColumnExpandable(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
          children: [
            Spacer(flex: 20,) ,

            Container(
              width: double.infinity,
              child: Card(
                clipBehavior:Clip.hardEdge ,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)
                ) ,
                child:Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w , vertical: 30.w),
                  child: Column(
                    children: [
                      textBody('Please_enter_activation_code'.t ,color: defaultColor),
                    SizedBox(height: 10.h,),
                      PinCodeTextField(

                        length: 4,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                          fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5),
                          selectedColor: Colors.grey,
                          activeColor: Colors.grey,
                          activeFillColor: Colors.grey,
                          shape: PinCodeFieldShape.box,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 45.w,
                          fieldWidth: 45.w,
                          disabledColor:  Colors.grey,
                          inactiveFillColor: Colors.grey,
                          selectedFillColor:  Colors.grey,
                          inactiveColor:  Colors.grey,
                        ),
                        textStyle: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),
                        animationDuration: Duration(milliseconds: 300),
                        //backgroundColor: Colors.blue.shade50,
                        enableActiveFill: false,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);
//                        if(code.isEmpty) {
//                          showDialogWithMessage(context, "pleas enter verification code");
//                         } else
                         code = value;
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        }, appContext: context,
                      ),
                      Row(
                        children: [

                          textBody('01:25',isBold: true ,color: defaultColor),

                          Spacer(),

                          textBody('Resend_Code'.t, color: defaultColor) ,
                        ],
                      )
                    ],
                  ),
                ) ,
              ),
            ),
            SizedBox(height: 20.h,),



//            DefaultButton(text: 'sign_up'.t,onPressed:(){
//              To(context, SuccessScreen()) ;
//            }),

            CustomBtnComponent(
                text: 'sign_up'.t,
                onTap: (startLoading, stopLoading, btnState) {
                  sendVerificationCode(startLoading, stopLoading, btnState);
                }),


            Spacer(flex: 20,),
          ],
        )],

      ),
    );
  }
}
