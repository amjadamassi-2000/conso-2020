import 'dart:async' ;
import 'dart:developer';
import 'dart:html';

import 'package:conso_customer/shared/storage.dart';
import 'package:dio/dio.dart' ;
import 'package:easy_localization/easy_localization.dart' as lang;

import 'package:flutter/material.dart' ;
import 'package:get/get.dart'hide Response ,FormData;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:conso_customer/extensions_lang.dart';

import 'dio_helper.dart';

class WebService {
  //static const String domain = 'http://46.101.219.156/api/V2/';
  static const String domain = 'http://167.172.177.20/api/V1/';

  // static const String domain = 'http://svp-beta.xyz/api/V1/';
  static const String login = domain + 'customer/login';
  static const String sign_up = domain + 'customer/sign-up';





  static const String GoogleKey = 'AIzaSyBm-bSOgvL17sfF6sm4SO8EDHrEf9aYLk4';

   static ProgressDialog pr;

  static Future<bool> showLoading() {
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

  static void hideLoading() {

    if (pr != null&&pr.isShowing()) {
      pr.hide() ;
    }else if(pr != null) {
      Timer(Duration(seconds: 1), () {
        hideLoading() ;
      });
    }
  }

  static void showDialogWithMessage(String title) {
    showDialog(
        context: Get.overlayContext,
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

  getMap()=> {
    "fcmToken": MyStorage.getToken(),
    'Authorization': 'Bearer ${MyStorage.getUserToken()}',
    'Accept': 'application/json',
    'Accept-Language': MyStorage.getlang(),
  } ;

  Future actionPost(String url,Map<String,dynamic> type) async {
    await WebService.showLoading() ;
    try{
      Response response = await DioHelper.dio.post(
        url,
        data: FormData.fromMap(type) ,
        options: Options(
          headers:getMap(),
        ),
      );

      print(' ++=> ${response.toString()}');
      WebService.hideLoading();
      if (response.data['status']) {
        return response.data;
      } else if(response.data['code'].toString() == "401") {
        // Mypref.removeUser() ;
        // Mypref.setIsLogin(false);
        // Get.offAll(login_screen());
      }else{
        WebService.showDialogWithMessage(response.data['message']) ;
        return null;
      }
    } on DioError catch (e) {
      print(e.error.toString());
      print(e.message.toString());
      log(e.response.toString());
      print(e.type.toString());
      print('DioError ${e.toString()}');
    }
  }
////////////////////////////////////////////////////////////////////////////////////////////////////
  Future actionGet(String url,{isLoding = true}) async {
    if(isLoding) await WebService.showLoading() ;
    try{


      print(url) ;
      Response response = await DioHelper.dio.get(
        url,
        options: Options(
          headers: getMap(),
        ),
      );

      print(' ++=> ${response.toString()}');
      if(isLoding)  WebService.hideLoading();
      if (response.data['status']) {
        return response.data;
      }else{
        WebService.showDialogWithMessage(response.data['message']) ;
        return null;
      }
    } on DioError catch (e) {
      print(e.error.toString());
      print(e.message.toString());
      print(e.response.toString());
      print(e.type.toString());
      print('never reached');
      if(isLoding)  WebService.hideLoading();
      WebService.showDialogWithMessage('messageErorr'.t) ;

    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////
  Future getData(String url , String type) async {
    //await WebService.showLoading() ;
    try{
      Response response = await DioHelper.dio.get(
        url,
        options: Options(
          headers: getMap(),
        ),
      );

      log('$type  ++=> ${response.toString()}');
      log('$type  ++=> ${response.headers.toString()}');
      // WebService.hideLoading();
      if (response.data['status']) {
        //return response.data ;
        // List<Address> shifts=  List<Address>.from(response.data['shifts'].map((x) => Shift.fromJson(x)));
      //  await Future.delayed(Duration(milliseconds: 500), () {});
        return response.data[type];
      }else{
        WebService.showDialogWithMessage(response.data['message']) ;
        return "";
      }
    }  on DioError catch (e) {
      print(e.error.toString());
      print(e.message.toString());
      print(e.response.toString());
      print(e.type.toString());
      print('never reached');
      throw '';
    }
  }


}
