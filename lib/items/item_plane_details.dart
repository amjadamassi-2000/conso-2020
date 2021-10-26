import 'package:conso_customer/screens/hotel_details.dart';
import 'package:conso_customer/screens/plan_details.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/size_extension.dart';


class ItemPlanDetails extends StatefulWidget {
  const ItemPlanDetails() ;

  @override
  _ItemPlanDetailsState createState() => _ItemPlanDetailsState();
}

class _ItemPlanDetailsState extends State<ItemPlanDetails> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        To(context, PlanDetails()) ;
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: defaultBorder),
              borderRadius: BorderRadius.circular(10.r)),
          width: MediaQuery.of(context).size.width * 0.90,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15.r),
                child: Column(
                  children: [
                    Row(children: [
                      textBody('رحلة بدون توقف',color: defaultTextColor.withAlpha(200)),
                      Spacer() ,
                      textBody('رحلة ذهاب و عودة',color: defaultTextColor.withAlpha(200))
                    ],),
                    Row(
                      children: [
                        buildCenterView('23:35','CAI'),
                        Expanded(child: Column(
                          children: [
                            textBody('2س  - 35 د',color: defaultTextColor),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                DottedLine(
                                  direction: Axis.horizontal,
                                  lineLength: double.infinity,
                                  lineThickness: 1.0,
                                  dashLength: 3.0,
                                  dashColor: defaultTextColor,
                                  dashRadius: 0.0,
                                  dashGapLength: 3.0,
                                  dashGapColor: Colors.transparent,
                                  dashGapRadius: 0.0,
                                ),
                              svgImage('airplane-icon',size: 15.r)
                              ],
                            )
                          ],
                        )),
                        buildCenterView('23:35','CAI'),
                      ],
                    )
                  ],
                ),
              ) ,
              DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 10.0,
                dashColor: defaultTextColor,
                dashRadius: 0.0,
                dashGapLength: 8.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
              Container(
                padding: EdgeInsets.all(15.r),
                child: Column(
                  children: [
                    Row(children: [
                      textBody('رحلة بدون توقف',color: defaultTextColor.withAlpha(200)),
                      Spacer() ,
                      textBody('رحلة ذهاب و عودة',color: defaultTextColor.withAlpha(200))
                    ],),
                    Row(
                      children: [
                        buildCenterView('23:35','CAI'),
                        Expanded(child: Column(
                          children: [
                            textBody('2س  - 35 د',color: defaultTextColor),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                DottedLine(
                                  direction: Axis.horizontal,
                                  lineLength: double.infinity,
                                  lineThickness: 1.0,
                                  dashLength: 3.0,
                                  dashColor: defaultTextColor,
                                  dashRadius: 0.0,
                                  dashGapLength: 3.0,
                                  dashGapColor: Colors.transparent,
                                  dashGapRadius: 0.0,
                                ),
                                svgImage('airplane-icon',size: 15.r)
                              ],
                            )
                          ],
                        )),
                        buildCenterView('23:35','CAI'),
                      ],
                    )
                  ],
                ),
              ) ,
              Divider(color: defaultHint,height: 1,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.r,vertical: 10.r),
                  child: Row(
                    children: [
                      textBodyMedium('عدد المقاعد المتاحة : 2',color: defaultColor,fontWeight: FontWeight.w400,fontSize: 16.sp),
                      Spacer(),
                      textBodyMedium('645 ريال',color: defaultColor,fontSize: 18.sp),
                    ],
                  ))
            ],
          )),
    );

  }
  buildCenterView(String test ,String text2){
   return Column(
      children: [
        textBody(test,color: defaultColor) ,
        textBody(text2,color: defaultTextColor.withAlpha(190))

      ],
    );
  }
}
