import 'package:conso_customer/items/itemCount.dart';
import 'package:conso_customer/modle/travelers.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '';

class ChooseCategoryPassengers extends StatefulWidget {
  @override
  _ChooseCategoryPassengersState createState() => _ChooseCategoryPassengersState();
}

class _ChooseCategoryPassengersState extends State<ChooseCategoryPassengers> {
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
                    textBodyBigSkinny('Choose_category_passengers'.t, color: defaultColor),
                    Spacer(),
                    textBody('clear_all'.t, color: defaultColor),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                    child: textBodyBigSkinny('Category'.t , color: defaultColor,fontSize: 18.sp)),
                SizedBox(
                  height: 10.h,
                ),
                GridView.count(

                  crossAxisCount: 2,
                  childAspectRatio: 2.3.h,
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  crossAxisSpacing: 5.w,
                  mainAxisSpacing: 5.w,

                  scrollDirection: Axis.vertical,
                  children: [
                    defaultButton(
                        fontSize: 12.sp,
                        isShadow: false,
                        onPressed: () {
                          setState(() {
                            select = 0 ;
                          });
                        },
                        text: types[0],
                        isBorder: select != 0,
                        height: 40.h),
                    defaultButton(
                        fontSize: 12.sp,
                      isShadow: false,
                        onPressed: () {
                          setState(() {
                            select = 1 ;
                          });
                        },
                        text: types[1],
                        isBorder: select != 1,
                        height: 40.h),
                    defaultButton(
                        fontSize: 12.sp,
                        isShadow: false,
                        onPressed: () {
                          setState(() {
                            select = 2 ;
                          });
                        },
                        text: types[2],
                        isBorder: select != 2,
                        height: 40.h),
                    defaultButton(
                      fontSize: 12.sp,

                        isShadow: false,
                        onPressed: () {
                          setState(() {
                            select = 3 ;
                          });
                        },
                        text: types[3],
                        isBorder: select != 3,
                        height: 40.h),
                  ],
                ),
                SizedBox(height: 20.h,) ,
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: textBodyBigSkinny('travelers'.t , color: defaultColor ,fontSize: 18.sp)),
                SizedBox(height: 20.h,) ,
                ItemCount(title: 'Adult'.t,),
                ItemCount(title: 'Child'.t,),
                ItemCount(title: 'baby_without_seat'.t,),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 10.w),
                //   child: ListView.builder(
                //     itemCount: travelerss.length,
                //     physics: NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemBuilder: (context, index) {
                //       return ItemCount() ;
                //   },),
                //
                // ),
                SizedBox(height: 20.h,) ,
                defaultButton(text: 'confirm'.t,onPressed:(){
                  setState(() {
                    travelerss.add( Travelers("dodd" , 55),) ;
                  });

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
