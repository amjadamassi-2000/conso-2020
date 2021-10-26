import 'package:conso_customer/screens/order_details.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class ItemRecordBookings extends StatelessWidget {
  final appIndex ;
  ItemRecordBookings(this.appIndex) ;
  double textSize ;
  @override
  Widget build(BuildContext context) {
    textSize = 14.sp ;
    return InkWell(
      onTap: (){
        To(context, OrderDetails()) ;
      },
      child: Column(
        children: [
          getRow('رقم الطلب','112312334',Row(children: [
            textBody('ذهاب و إياب',color: defaultColor,fontSize: textSize),
            SizedBox(width: 5.w,),
            Icon(
              Icons.arrow_forward_ios,
              color: defaultHint,
            ),],)) ,
          SizedBox(height: 7.h,),
          getRow('الجهة','جدة - السعودية',textBody('250ريال',color: defaultColor,fontSize: 18.sp)) ,
          SizedBox(height: 5.h,),
          Visibility(
            visible: appIndex == 0,
            child: getRow('موعد الوصول','11/01/2021',
                Row(
                  children: [
                    textBody('موعد الوصول',color: defaultHint,fontSize: textSize),
                    SizedBox(width: 7.w,),
                    textBody('11/01/2021',color: defaultColor,fontSize: textSize),
                  ],
                )),
          ) ,
          SizedBox(height: 7.h,),
          getRow('تاريخ الطلب','03/01/2021',textBody('قيد المراجعة',color: statusWaitingPreview,fontSize: textSize)) ,

          SizedBox(height: 7.h,),
          Divider(color: Colors.black38,),
        ],
      ),
    );
  }
  Widget getRow(firstTitle,firstValue,Widget widget){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          textBody(firstTitle,color: defaultHint,fontSize: textSize),
          SizedBox(width: 5.w,),
          textBody(firstValue,color: defaultColor,fontSize: textSize),
          Spacer(),
          widget
        ],
      ),
    ) ;
  }
}
