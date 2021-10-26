import 'package:conso_customer/Dialogs/added_value.dart';
import 'package:conso_customer/Dialogs/change_password.dart';
import 'package:conso_customer/screens/edit_my_profile.dart';
import 'package:conso_customer/screens/edit_my_wallet.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/Constant.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/size_extension.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('MyProfile'.t,actions: [IconButton(onPressed: (){
        To(context, EditMyProfile());
      }, icon: svgImage('pen',color: Colors.white))]),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20.h,),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: ClipOval(
                            child:Container(
                              height: 120.w,
                              width: 120.w,
                              color: defaultColor,
                              child: Center(child: svgImage('user',size: 70,color: Colors.white)),
                            ) /*Image.network(
                              Constant.imageTest,
                              height: 120.w,
                              width: 120.w,
                              fit: BoxFit.cover,
                            ),*/
                          ),
                        ),
                        svgImage('add_btn')
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Center(child: textBodyMedium('محمد أحمد',color: defaultColor)),
                  SizedBox(height: 30.h,),
                  buildRow('email'.t,'user@email.com') ,
                  Divider(),
                  buildRow('mobile'.t,'+966 0000 000 000') ,
                  Divider(),
                  InkWell(
                    onTap: (){
                      showChangePassword(context) ;
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.w),
                        child: textBody('change_Password'.t,color: defaultColor)),
                  ),

                  Divider(),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.w),
                      child: Row(
                        children: [
                          textBody('Change_language'.t,color: defaultColor),
                          Spacer(),
                          textBody('العربية',color: defaultColor),
                        ],
                      )),
                  Divider(),

                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textBody('Notifications'.t,color: defaultColor,fontSize:20.sp ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              textBody('Change_language'.t,color: defaultColor),
                              Spacer(),
                              Switch(
                                value: false,
                                onChanged: (value) {
                                  setState(() {
                                    // isSwitched = value;
                                    // print(isSwitched);
                                  });
                                },
                                // activeTrackColor: Colors.yellow,
                                // activeColor: Colors.orangeAccent,
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              textBodyMedium('logout'.t,color: defaultColor),
              SizedBox(width: 10.w,),
              svgImage('logout')
            ],),
          )
        ],
      ),

    );
  }

  buildRow(title, value){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.r),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textBodyMedium(title,color: defaultHint,fontSize: 14.sp),

          textBodyMedium(value,color: defaultColor),

        ],
      ),
    );
  }
}
