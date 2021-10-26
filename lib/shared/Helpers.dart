
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/size_extension.dart';
class Helpers {
  // // ||... method for showing an message ...||
  // static void showMessage(String message, MessageType messageType) {
  //   if (message == null) return;
  //   if (messageType == MessageType.MESSAGE_FAILED)
  //     BotToast.showNotification(
  //       duration: Duration(seconds: 2),
  //       trailing: (_) => Icon(
  //         Icons.arrow_forward_ios,
  //         color: Colors.red,
  //       ),
  //       title: (_) => Text(
  //         'Failed'.tr,
  //         style: TextStyle(color: Colors.red),
  //       ),
  //       subtitle: (_) => Text(
  //         message,
  //         style: TextStyle(color: Colors.red),
  //       ),
  //       leading: (_) => Icon(
  //         Icons.error,
  //         color: Colors.red,
  //       ),
  //     );
  //   else
  //     BotToast.showNotification(
  //       duration: Duration(seconds: 2),
  //       trailing: (_) => Icon(
  //         Icons.arrow_forward_ios,
  //         color: Colors.teal,
  //       ),
  //       title: (_) => Text(
  //         'Success'.tr,
  //         style: TextStyle(color: Colors.teal),
  //       ),
  //       subtitle: (_) => Text(
  //         message,
  //         style: TextStyle(color: Colors.teal),
  //       ),
  //       leading: (_) => Icon(
  //         Icons.done,
  //         color: Colors.teal,
  //       ),
  //     );
  // }

  //||... shortcut for showing bottom sheet ...||
  static Future<dynamic> bottomSheet({

    @required BuildContext context,
    @required Widget child,
    Color backgroundColor,
    double radius = 30,
    bool isScrollControlled = true,
  }) async {
   // FocusScope.of(context).unfocus();
    return await showModalBottomSheet(
      context: context,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      builder: (_) => child,
    );
  }



  //||... email validator ...||
  static bool isEmail(String text) => RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(text);

  //||... mobile validator ...||
  static bool isMobile(String text) => text.length >= 8 && text.length <= 12;

  //||... url validator ...||
  static bool isUrl(String text) => RegExp(
      r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)')
      .hasMatch(text);





  //||... convert string values to int ...||
  static int toInt(var value) => value == null
      ? null
      : value is int
      ? value
      : int.parse(value);

  //||... convert string values to num ...||
  static num toNum(var value) => value == null
      ? null
      : value is num
      ? value
      : num.parse(value);

  //||... convert string values to double ...||
  static num toDouble(var value) => value == null
      ? null
      : value is double
      ? value
      : double.parse(value);

  // ||... format date ...||
  static String formatDate(DateTime dateTime, {bool withTime = false}) {
    if (dateTime == null) return null;
    if (withTime)
      return DateFormat('yyyy-MM-dd hh:mm').format(dateTime);
    else
      return DateFormat('yyyy-MM-dd').format(dateTime);
  }


  // ||... format time ...||
  static String formatTime(TimeOfDay timeOfDay) {
    if (timeOfDay == null) return null;
    return '${timeOfDay.hour < 10 ? '0${timeOfDay.hour}' : timeOfDay.hour}:${timeOfDay.minute < 10 ? '0${timeOfDay.minute}' : timeOfDay.minute}';
  }


  static callNumber(String number)async {
    // const number = '08592119XXXX'; //set the number here
    bool res = await FlutterPhoneDirectCaller.callNumber('00$number');
  }


}