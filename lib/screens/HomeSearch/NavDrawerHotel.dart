import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:conso_customer/extensions_lang.dart';



class NavDrawerSearchHotel extends StatefulWidget {

//  User user ;
 // Setting settings = Mypref.getSettings();
  @override
  _NavDrawerSearchState createState() => _NavDrawerSearchState();
}

class _NavDrawerSearchState extends State<NavDrawerSearchHotel> {

double value = 0 ;


  @override
  Widget build(BuildContext context) {
  //  user = Mypref.getUser() ;
    return Drawer(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40.h,left: 20.w ,right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
                alignment: AlignmentDirectional.topEnd,
                child: buildCloseButton(
                      () {
                    Navigator.of(context).pop();
                  },
                )),
            SizedBox(
              height: 20.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textBodyBigSkinny('filter'.t, color: defaultColor),
                Spacer(),
                InkWell(
                   /* onTap: clearAll,*/
                    child: textBody('clear_all'.t, color: defaultColor)),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            textBodyBigSkinny('orderBy'.t, color: defaultColor),
            DropdownButton<String>(
              items: <String>['أقرب مغادرة ( القاهرة )', 'أقرب مغادرة ( القاهرة )2', 'أقرب مغادرة ( القاهرة )3', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              isExpanded: true,
              value: 'أقرب مغادرة ( القاهرة )',
              icon: svgImage('arrow_bottom'),
              onChanged: (_) {

              },
            ),
            SizedBox(
              height: 20.h,
            ),
            textBodyBigSkinny('price_range'.t, color: defaultColor),
            FlutterSliderCustom(onDragging:(handlerIndex, lowerValue, upperValue) {

            },),
            SizedBox(
              height: 20.h,
            ),
            textBodyBigSkinny('hotel_name'.t, color: defaultColor),
            defaultTextFormDialog(TextEditingController()..text = '', 'hotel_name'.t,isBorder: true) ,
            SizedBox(
              height: 20.h,
            ),
            textBodyBigSkinny('Rating'.t, color: defaultColor),
            ratingBar(3,
                customDesign:(i){return Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              margin: EdgeInsets.symmetric( horizontal: 5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: defaultHint)
              ),
              child: Row(
              children: [
                textBodyMedium((i+1).toString(),color: defaultColor),
                Icon(
                Icons.star,
                color: defaultColor,
              ),

              ],
            ),);},itemSize: 45.r ,onRatingUpdate:(d){
                  value = d ;
                }) ,
            SizedBox(
              height: 20.h,
            ),
            textBodyBigSkinny('Distance_city_center'.t, color: defaultColor),
            FlutterSliderCustom(onDragging:(handlerIndex, lowerValue, upperValue) {

            },),
            textBodyBigSkinny('Hotel_Features'.t, color: defaultColor),
            DropdownButton<String>(
              items: <String>['أقرب مغادرة ( القاهرة )', 'أقرب مغادرة ( القاهرة )2', 'أقرب مغادرة ( القاهرة )3', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              isExpanded: true,
              value: 'أقرب مغادرة ( القاهرة )',
              icon: svgImage('arrow_bottom'),
              onChanged: (_) {

              },
            ),
            SizedBox(
              height: 20.h,
            ),
            textBodyBigSkinny('Room_Features'.t, color: defaultColor),
            DropdownButton<String>(
              items: <String>['أقرب مغادرة ( القاهرة )', 'أقرب مغادرة ( القاهرة )2', 'أقرب مغادرة ( القاهرة )3', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              isExpanded: true,
              value: 'أقرب مغادرة ( القاهرة )',
              icon: svgImage('arrow_bottom'),
              onChanged: (_) {

              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: DefaultButton(
                // fontSize: 20.sp,
                  isShadow: false,
                  isExpanded: false,
                  toUpper: false,
                  isFittedText: true,
                  onPressed:(){

                  },
                  text:'confirm'.t ,

                  height: 40.h),
            ),
            SizedBox(
              height: 20.h,
            ),

          ],
        ),
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
