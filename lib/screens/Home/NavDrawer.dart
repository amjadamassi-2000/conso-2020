import 'package:conso_customer/screens/Billing_record.dart';
import 'package:conso_customer/screens/Home/record_bookings.dart';
import 'package:conso_customer/screens/caht_history.dart';
import 'package:conso_customer/screens/call_history.dart';
import 'package:conso_customer/screens/globalScreen/about_us.dart';
import 'package:conso_customer/screens/globalScreen/contact_us.dart';
import 'package:conso_customer/screens/my_profile.dart';
import 'package:conso_customer/screens/my_wallet.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:conso_customer/extensions_lang.dart';



class NavDrawer extends StatelessWidget {

//  User user ;
 // Setting settings = Mypref.getSettings();
  @override
  Widget build(BuildContext context) {
  //  user = Mypref.getUser() ;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 40.h),
        children: <Widget>[
          buildRow('homeIcon', 'home'.t ,(){
            Navigator.pop(context) ;
          }),
          Divider(height: 1,) ,
          buildRow('bill', 'Billing_record'.t ,(){
            To(context, BillingRecord()) ;
          }),
          Divider(height: 1,) ,
          buildRow('wallet', 'my_wallet'.t ,(){
            To(context, MyWallet()) ;
          }),
          Divider(height: 1,) ,
          buildRow('profile_icon', 'MyProfile'.t ,(){
            To(context, MyProfile()) ;
          }),
          Divider(height: 1,) ,
          buildRow('booking', 'Record_bookings'.t ,(){
            To(context,RecordBookings());
          }),
          Divider(height: 1,) ,
          buildRow('log', 'call_log'.t ,(){
            To(context,CallHistory());
          }),
          Divider(height: 1,) ,
          buildRow('chat_icon', 'chat_history'.t ,(){
            To(context, ChatHistory()) ;
          }),
          Divider(height: 1,) ,
          buildRow('agenda', 'About_app'.t ,(){
            To(context,AboutUs());
          }),
          Divider(height: 1,) ,
          buildRow('chat-bubble', 'contactUs'.t ,(){
            To(context, ContactUs()) ;
          }),


        ],
      ),
    );
  }


  Widget buildRow(image ,text,onTap)=> ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 30.w , vertical: 5.h) ,
  leading: svgImage(image,size: 15.w),
  horizontalTitleGap: 0 ,
  title: textBody(text ,color: defaultColor ,textAlign: TextAlign.start),
  onTap: onTap,
  );
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
