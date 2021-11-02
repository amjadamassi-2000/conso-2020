import 'dart:async' ;
import 'package:easy_localization/easy_localization.dart' as lang;

import 'package:flutter/material.dart' ;
import 'package:get/get.dart'hide Response ,FormData;
import 'package:progress_dialog/progress_dialog.dart';



   const String domain = 'http://www.conso.hexacit.com/api/V1/';
   const String userLogin = 'userLogin';
   const String userSignUp = 'userSignUp';
   const String checkCode = 'checkCode';
   const String doYouForgetPassword = 'requestNewCode';
   const String userImageProfile = 'userImageProfile';
   const String resetPassword = 'resetPassword';
   const String userEditProfile = 'userEditProfile';

   const String getAds = 'getAds';




   const String GoogleKey = 'AIzaSyBm-bSOgvL17sfF6sm4SO8EDHrEf9aYLk4';

    ProgressDialog pr;

   Future<bool> showLoading() {
    print("status : show");
    if (pr == null) {
      pr = ProgressDialog(
        Get.overlayContext,
        type: ProgressDialogType.Normal,
        textDirection: TextDirection.rtl,
        isDismissible: true,
      );
      pr.style(message: lang.tr('Please_Wait'));
    }
    return pr.show();
  }

   void hideLoading() {

    if (pr != null&&pr.isShowing()) {
      pr.hide() ;
    }else if(pr != null) {
      Timer(Duration(seconds: 1), () {
        hideLoading() ;
      });
    }
  }

   showDialogWithMessage(BuildContext context,String title) {
    showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              //  title: new Text(tr('Are_you_sure')),
              content: Text(title.replaceAll('\\n', '\n'),maxLines: 20,),
            ));

//      showDialog(
//          context: ctx,
//          builder: (context) => Center(
//             child: Material(
//                color: Colors.transparent,
//                child:  Container(
//                    width: double.infinity,
//                    margin: EdgeInsets.symmetric(horizontal: 50),
//                    //alignment: Alignment.center,
//                    decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(10)
//                    ),
//
//                    padding: EdgeInsets.all(20),
//                    child: Text(title,style: TextStyle(fontSize: 24),)),
//             ),
//          )
    //  );
  }

//  getMap()=> {
//    "fcmToken": MyStorage.getToken(),
//    'Authorization': 'Bearer ${MyStorage.getUserToken()}',
//    'Accept': 'application/json',
//    'Accept-Language': MyStorage.getlang(),
//  } ;


////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////

