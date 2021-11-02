import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conso_customer/extensions_lang.dart';

class itemServiceProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 2,thickness: 2,) ,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageCircle(
                  "https://miro.medium.com/max/12000/1*PgIo7r6qQXem8BmWd-vksQ.jpeg"),
              SizedBox(
                width: 15.w,
              ),
              Flexible(
                child: Column(
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
                          fontSize: 15.sp,
                          text: 'start_chatting'.t,
                          height: 35.h,
                          isExpanded: false,
                          icon: svgImage('chat_btn', color: Colors.white, size: 15),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        DefaultButton(
                            onPressed: () {},
                            fontSize: 15.sp,
                            isExpanded: false,
                            text: 'start_calling'.t,
                            height: 35.h,
                            isBorder: true,
                            icon: svgImage('phone_call')),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
