import 'package:conso_customer/screens/globalScreen/contact_us.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:conso_customer/extensions_lang.dart';
class AboutUs extends StatefulWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('About_app'.t),
      body: ListView(
        children: <Widget>[
          buildRow('aboutapp', 'About_app'.t ,(){
            To(context, ContactUs()) ;
          }),
          Divider(height: 1,) ,
          buildRow('chat-bubble', 'Q&A'.t ,(){}),
          Divider(height: 1,) ,
          buildRow('idea', 'How_app_work'.t ,(){}),
          Divider(height: 1,) ,
          buildRow('terms', 'Terms_Conditions'.t ,(){}),
          Divider(height: 1,) ,
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
}
