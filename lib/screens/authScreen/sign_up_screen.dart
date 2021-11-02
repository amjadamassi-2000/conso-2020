import 'package:conso_customer/modle/base_respons.dart';
import 'package:conso_customer/modle/User.dart';
import 'package:conso_customer/my_widgets/custom_botton.dart';
import 'package:conso_customer/screens/Home/HomeScreen.dart';
import 'package:conso_customer/screens/authScreen/verifi_screen.dart';
import 'package:conso_customer/shared/components/ExpandablePageView.dart';
import 'package:conso_customer/shared/components/ScrollColumnExpandable.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/default_button.dart';
import 'package:conso_customer/shared/network/remote/WebSarvice.dart';
import 'package:conso_customer/shared/network/remote/dio_helper.dart';
import 'package:conso_customer/shared/storage.dart';
import 'package:conso_customer/shared/styles/style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {


  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  fetchApiSignUp(startLoading, stopLoading, btnState) async {
    final isValid = formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      formKey.currentState.save();
      try {
        startLoading();
        Response response = await getResponse(userSignUp, data: {
          'device_type': 'android',
          'fcm_token': 'android',
          "email": email.text,
          'mobile':mobile.text,
          'password': password.text,
          "first_name": firstName.text,
          "last_name": lastName.text,
        });
        var res = BaseResponse.fromJson(
          response.data,
         // keyObject: 'user',
//          fun: (Map<String, dynamic> json) {
//            return User.fromJson(json);
//          },
        );

        //setUser(res.object as User);
        //User user = getUser();


        if (res.status) {
          print('track 2${mobile.text}') ;
          To(context, VerifiScreen(mobile: mobile,));
        } else {
          showDialogWithMessage(context, res.message);
        }
      } catch (error) {
        stopLoading();
        print(error);
        showDialogWithMessage(context,"Something went wrong..!");
      }
    }
  }

  TextEditingController email = TextEditingController()..text = '';

  TextEditingController mobile = TextEditingController()..text = '';

  TextEditingController password = TextEditingController()..text = '';

  TextEditingController confirmPass = TextEditingController()..text = '';

  TextEditingController firstName = TextEditingController()..text = '';

  TextEditingController lastName = TextEditingController()..text = '';

  final formKey = new GlobalKey<FormState>();

  int currentPage = 0;
  bool isAccept = false;

  final PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print(currentPage);
        if (currentPage == 1) {
          currentPage--;
          pageController.animateToPage(currentPage,
              duration: Duration(milliseconds: 500), curve: Curves.easeInCubic);
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: myAppBar('sign_in'.t),
        body: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              'assets/images/backgroungAuth.png',
              fit: BoxFit.cover,
            )),
            ScrollColumnExpandable(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              children: [
                Spacer(
                  flex: 40,
                ),
                Card(
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.only(top: 20.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defaultTextForm(email, 'email'.t,
                            type: TextInputType.emailAddress,
                            icon: svgImage('email'), validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        }),
                        Divider(
                          height: 1.h,
                        ),
                        defaultTextForm(
                            firstName,
                            'first_name'.t,
                            icon: Icon(Icons.person_outline , size: 35, color: Colors.grey.shade400,),
                            validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        }),
                        Divider(
                          height: 1.h,
                        ),
                        defaultTextForm(lastName, 'last_name'.t,
                            icon: Icon(Icons.person_outline , size: 35, color: Colors.grey.shade400,),
                            validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid last name';
                          }
                          return null;
                        }),
                        Divider(
                          height: 1.h,
                        ),
                        defaultTextForm(
                            mobile,
                            'mobile'.t,
                            type: TextInputType.phone,
                            icon: svgImage('phone'),
                            validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid phone';
                          }
                          if (value.length < 12)
                            return "phone must have 12 character";
                          return null;
                        }
                        ),
                        Divider(
                          height: 1.h,
                        ),
                        defaultTextForm(password, 'password'.t,
                            type: TextInputType.visiblePassword,
                            icon: svgImage('password'), validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        }),
                        Divider(
                          height: 1.h,
                        ),
                        defaultTextForm(confirmPass, 'confirm_password'.t,
                            type: TextInputType.visiblePassword,
                            icon: svgImage('password'), validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid password';
                          }
                          return null;
                        }),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),

                Row(
                  children: [
                    customCheck(isAccept, () {
                      setState(() {
                        isAccept = !isAccept;
                      });
                    }),
                    SizedBox(
                      width: 5.w,
                    ),
                    RichText(
                      //textDirection: TextDirection.ltr,
                      text: TextSpan(
                        text: '',
                        style: defaultTextStyleBody(),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'acceptTo'.t,
                              style: TextStyle(
                                  fontFamily: 'Cairo', fontSize: 10.sp)),
                          TextSpan(
                              text: 'Terms_and_Conditions'.t,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'Cairo',
                                  fontSize: 10.sp),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => null),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15,),

                CustomBtnComponent(
                    text: 'next'.t,
                    onTap: (startLoading, stopLoading, btnState) {
                      fetchApiSignUp(startLoading, stopLoading, btnState);
                    }),


                Spacer(
                  flex: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),


                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'do_have_account'.t,
                        textAlign: TextAlign.center,
                        style: defaultTextStyleBody(),
                      ),


                      Text(
                        'sign_in'.t,
                        textAlign: TextAlign.center,
                        style: defaultTextStyleBody(isBold: true),
                      ),
                    ],
                  ),

                ),
                Spacer(
                  flex: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
