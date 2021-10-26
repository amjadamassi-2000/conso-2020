import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/Constant.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class ItemChatHistory extends StatelessWidget {
  const ItemChatHistory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.h,vertical: 10.h),
      child: Column(
        children: [
          Row(
            children: [
              imageCircle(Constant.imageTest,radius: 35.r),
              SizedBox(width: 10.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    textBodyMedium('آسر الأشقر',color: defaultColor,textAlign: TextAlign.start,fontSize: 22.sp),
                    textDetails('شكرا سعدت بالحديث معك',color: defaultHint,textAlign: TextAlign.start,fontSize: 16.sp,),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
              child: textBody('اليوم 15 يونيو, 15:35',color: defaultHint,textAlign: TextAlign.start,fontSize: 14.sp)),

          Divider(),
        ],
      ),
    );
  }
}
