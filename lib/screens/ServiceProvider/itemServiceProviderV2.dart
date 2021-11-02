import 'package:conso_customer/screens/ServiceProvider/ServiceProvidersDetails.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conso_customer/extensions_lang.dart';

class itemServiceProvidersV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        To(context, ServiceProvidersDetails(name: 'cfhsc',));
      },
      child: Container(

        margin: EdgeInsets.all( 10.h),
        width: MediaQuery.of(context).size.width*0.90,
        child: Stack(
          fit:StackFit.loose,
          children: [
            PositionedDirectional(
              start: 20.w,
              bottom: 0,
              end: 0,
              top: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(

                    padding: EdgeInsetsDirectional.only(start: 50.w, top: 30.h , bottom:  20.h , end: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                      boxShadow: boxShadow()
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textBody('إيمان العراقي', color: defaultColor),
                        Row(
                          children: [
                            ratingBar(0),
                            textBody('[1650 تقييم]', color: defaultHint)
                          ],
                        ),
                        textDetails(
                            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس ، حيث يمكنك أن تولد مثل هذا النص أو العديد من ',
                            color: defaultColor,
                            textAlign: TextAlign.start),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,

                          children: [
                            DefaultButton(
                              onPressed: () {},
                              fontSize: 12.sp,
                              text: 'start_chatting'.t,
                              height: 35.h,
                              isShadow: false,
                              isExpanded: false,
                              icon: svgImage('chat_btn', color: Colors.white, size: 15),
                            ),


                            SizedBox(
                              width: 5.w,
                            ),


                         DefaultButton(
                             onPressed: () {},
                              fontSize: 12.sp,
                              isExpanded: false,
                              text: 'start_calling'.t,
                               height: 35.h,
                              isShadow: false,
                              isBorder: true,
                              icon: svgImage('phone_call')
                         ),



                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20.h,
           //   right: 20.h,
              child: imageCircle("https://miro.medium.com/max/12000/1*PgIo7r6qQXem8BmWd-vksQ.jpeg")),
          ],
        ),
      ),
    );
  }
}
