import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/size_extension.dart';

class OfferDetails extends StatefulWidget {
  const OfferDetails({Key key}) : super(key: key);

  @override
  _OfferDetailsState createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Offer_details'.t),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             margin: EdgeInsets.all(20.w),
             clipBehavior: Clip.hardEdge,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10.r)
             ),
             width: double.infinity,
             height: 110.h,
               child: imageNet('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg')),
           Padding(
             padding:EdgeInsetsDirectional.only(start: 22.w),
             child: textBodyMedium('إحجز الفنادق و الطيران و احصل على خصومات ',color: defaultHint,fontSize: 15.sp,fontWeight: FontWeight.w500),
           ) ,
           Divider(),
           Padding(
             padding:EdgeInsets.symmetric(horizontal: 22.w ),
             child: textBodyMedium('هذا النص هو مثال لنص يمكن أن يستبدل في نفس ،'
                 ' حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى '
                 'إضافة إلى زيادة عدد الحروف التى يولدها التطبيق',
                 color: Colors.black,
                 fontSize: 15.sp,
                 fontWeight: FontWeight.w500,
             textAlign: TextAlign.start),
           ) ,

           SizedBox(height: 20.h,) ,
           Padding(
             padding:EdgeInsetsDirectional.only(start: 22.w),
             child: textBodyMedium('إحجز الفنادق و الطيران و احصل على خصومات ',color: defaultHint,fontSize: 15.sp,fontWeight: FontWeight.w500),
           ) ,
           Divider(),
           Padding(
             padding:EdgeInsets.symmetric(horizontal: 22.w ),
             child: textBodyMedium('هذا النص هو مثال لنص يمكن أن يستبدل في نفس ،'
                 ' حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى '
                 'إضافة إلى زيادة عدد الحروف التى يولدها التطبيق',
                 color: Colors.black,
                 fontSize: 15.sp,
                 fontWeight: FontWeight.w500,
                 textAlign: TextAlign.start),
           ) ,
         ],
        ),

      ),
    );
  }
}
