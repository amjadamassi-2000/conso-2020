import 'package:conso_customer/screens/adsScreen/ads_notifier.dart';
import 'package:conso_customer/screens/adsScreen/slide_item.dart';
import 'package:conso_customer/shared/components/ExpandablePageView.dart';
import 'package:conso_customer/shared/components/ScrollColumnExpandable.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:conso_customer/shared/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_notifier.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController()..text = '';

  TextEditingController mobile = TextEditingController()..text = '';

  TextEditingController password = TextEditingController()..text = '';

  TextEditingController confirmPass = TextEditingController()..text = '';

  TextEditingController firstName = TextEditingController()..text = '';

  TextEditingController lastName = TextEditingController()..text = '';

  final formKey = new GlobalKey<FormState>();
  final formKey2 = new GlobalKey<FormState>();

  int currentPage = 0;
  bool isAccept = false;

  final PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Widget> w() => [
        Card(
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.only(top: 20.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                defaultTextForm(email, 'email'.t,
                    type: TextInputType.emailAddress,
                    icon: svgImage('email'),
                    defaultValidator: 'dwdwidwid'),
                Divider(height: 1.h,) ,
                defaultTextForm(mobile, 'mobile'.t,
                    type: TextInputType.phone, icon: svgImage('phone')),
                Divider(height: 1.h,) ,
                defaultTextForm(password, 'password'.t,
                    type: TextInputType.visiblePassword,
                    icon: svgImage('password')),
                Divider(height: 1.h,) ,
                defaultTextForm(confirmPass, 'confirm_password'.t,
                    type: TextInputType.visiblePassword,
                    icon: svgImage('password')),
              ],
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.only(top: 20.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              child: Form(
                key: formKey2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    defaultTextForm(
                      firstName,
                      'first_name'.t,
                      icon: svgImage('email'),
                    ),
                    Divider(height: 1.h,) ,
                    defaultTextForm(lastName, 'last_name'.t,
                        icon: svgImage('phone')),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h,) ,
            Row(
              children: [
                customCheck(isAccept, () {
                  setState(() {
                    isAccept = !isAccept;
                  });
                }),
                SizedBox(width: 5.w,) ,
                RichText(
                  //textDirection: TextDirection.ltr,
                  text: TextSpan(
                    text: '',
                    style: defaultTextStyleBody(),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'acceptTo'.t,style: TextStyle(fontFamily: 'Cairo',fontSize: 10.sp)
                      ),
                      TextSpan(
                          text: 'Terms_and_Conditions'.t,
                          style: TextStyle(decoration:TextDecoration.underline ,fontFamily: 'Cairo',fontSize: 10.sp),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () => null),
                    ],
                  ),
                ),


              ],
            )
          ],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        print(currentPage) ;
        if(currentPage == 1){
          currentPage-- ;
          pageController.animateToPage(currentPage,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInCubic);
          return false ;
        }
       return true ;
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
                //  w()[0],
                ExpandablePageView(
                  children: w(),
                  pageController: pageController,
                ),

                SizedBox(
                  height: 20.h,
                ),
                defaultButton(
                    text: 'next'.t,
                    onPressed: () {
                      currentPage ++ ;
                      pageController.animateToPage(currentPage,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInCubic);
                      //  formKey.currentState.validate();
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
