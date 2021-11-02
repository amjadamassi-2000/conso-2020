import 'package:conso_customer/modle/base_respons.dart';
import 'package:conso_customer/modle/User.dart';
import 'package:conso_customer/my_widgets/custom_botton.dart';
import 'package:conso_customer/screens/Home/HomeScreen.dart';
import 'package:conso_customer/screens/Home/home_notifier.dart';
import 'package:conso_customer/screens/authScreen/forgot_password.dart';
import 'package:conso_customer/screens/authScreen/sign_up_screen.dart';
import 'package:conso_customer/shared/components/ScrollColumnExpandable.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/custom_navigate.dart';
import 'package:conso_customer/shared/network/remote/WebSarvice.dart';
import 'package:conso_customer/shared/network/remote/dio_helper.dart';
import 'package:conso_customer/shared/storage.dart';
import 'package:conso_customer/shared/styles/style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController()..text = '';
  TextEditingController password = TextEditingController()..text = '';

  final _formKey = GlobalKey<FormState>();

  fetchApiLogin(startLoading, stopLoading, btnState) async {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      try {
        startLoading();
        Response response = await getResponse(userLogin, data: {
          'device_type': 'android',
          'fcm_token': 'android',
          'mobile': email.text,
          'password': password.text,
        });
        var res = BaseResponse.fromJson(
          response.data,
          keyObject: 'user',
          fun: (Map<String, dynamic> json) {
            return User.fromJson(json);
          },
        );
        setUser(res.object as User);
        User user = getUser();
        if (res.status) {
          CustomNavigate<HomeNotifier>().navigateAndFinish(
              context, HomeScreen(),
              create: (context) => HomeNotifier());
          stopLoading();
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
                flex: 20,
              ),
              Center(
                  child: Text(
                'messageLogin'.t,
                textAlign: TextAlign.center,
                style: defaultTextStyleBody(),
              )),
              Spacer(
                flex: 20,
              ),
              Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      defaultTextForm(email, 'email|mobile'.t,
                          type: TextInputType.emailAddress,
                          icon: svgImage('email'),
                          key: ValueKey("email"), validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid email address or phone';
                        }
                        return null;
                      }),
                      Divider(
                        height: 1.h,
                      ),
                      defaultTextForm(password, 'password'.t,
                          type: TextInputType.emailAddress,
                          icon: svgImage('password'),
                          key: ValueKey("password"), validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid Password';
                        }
                        return null;
                      }),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

//            DefaultButton(
//                text: 'sign_in'.t,
//                onPressed: (){
//                  To(context, VerifiScreen());
//                }
//                //fetchApiLogin
//            ),

              CustomBtnComponent(
                  text: 'sign_in'.t,
                  onTap: (startLoading, stopLoading, btnState) {
                    fetchApiLogin(startLoading, stopLoading, btnState);
                  }),

              Spacer(
                flex: 20,
              ),
              Center(
                  child: InkWell(
                      onTap: () {
                        To(context, ForgotPassword(mobile: email ,));
                      },
                      child: Text(
                        'forget_password'.t,
                        textAlign: TextAlign.center,
                        style: defaultTextStyleBody(),
                      ))),
              Spacer(
                flex: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Do_you_have_account'.t,
                    textAlign: TextAlign.center,
                    style: defaultTextStyleBody(),
                  ),
                  InkWell(
                      onTap: () async {
                        To(context, SignUpScreen());
                      },
                      child: Text(
                        'sign_up'.t,
                        textAlign: TextAlign.center,
                        style: defaultTextStyleBody(isBold: true),
                      )),
                ],
              ),

              Spacer(
                flex: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
