import 'package:conso_customer/items/itemCount.dart';
import 'package:conso_customer/items/itemRoom.dart';
import 'package:conso_customer/modle/travelers.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '';

class SelectRoomsGuests extends StatefulWidget {
  @override
  _SelectRoomsGuestsState createState() => _SelectRoomsGuestsState();
}

class _SelectRoomsGuestsState extends State<SelectRoomsGuests> {
  List types = [
    'Tourism_degree'.t,
    'economy_class_nexcellent'.t,
    'business_men'.t,
    'First_class'.t
  ];
  List travelerss = [
    Travelers("dodd" , 55),
    Travelers("dodd" , 55),
    Travelers("dodd" , 55),
    Travelers("dodd" , 55),
  ] ;

  int select = 0;


  clearAll(){
    setState(() {
      travelerss.clear();
    });


  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 15.w, right: 15.w),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // SizedBox(
                //   height: 10.h,
                // ),
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
                    textBodyBigSkinny('Select_rooms_guests'.t, color: defaultColor),
                    Spacer(),
                    InkWell(
                      onTap: clearAll,
                        child: textBody('clear_all'.t, color: defaultColor)),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),

                SizedBox(height: 20.h,) ,
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: textBodyBigSkinny('travelers'.t , color: defaultColor)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ListView.builder(
                    itemCount: travelerss.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ItemRome(index) ;
                  },),

                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      travelerss.add( Travelers("dodd" , 55),) ;
                    });
                  },
                  child: Row(children: [
                    svgImage('add', size: 20.w) ,
                    SizedBox(width: 10.w,),
                    textBody('Add_room'.t,color: defaultColor) ,

                  ],),
                ),
                SizedBox(height: 20.h,) ,
                DefaultButton(text: 'confirm'.t,onPressed:(){


                }),
                SizedBox(height: 20.h,) ,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
