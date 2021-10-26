import 'package:conso_customer/items/item_plane_details.dart';
import 'package:conso_customer/items/item_record_bokings.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:conso_customer/extensions_lang.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: myAppBar('orderDetails'.t),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            ItemRecordBookings(0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textBodyBigSkinny('travellersDetails'.t,fontSize: 15.sp,color: defaultHint),
                  SizedBox(height: 10.h,),
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                    return ItemTravelersDetails() ;
                  },) ,
                  SizedBox(height: 15.h,),
                  textBodyBigSkinny('trip_details'.t,fontSize: 15.sp,color: defaultHint),
                  SizedBox(height: 5.h,),
                ],
              ),


            ),
            ItemPlanDetails(),

            SizedBox(height: 20.h,)
          ],
        ),
      ),
    );
  }
}
class ItemTravelersDetails extends StatelessWidget {
  const ItemTravelersDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: boxDecoration,
      child: ExpansionTile(

        collapsedBackgroundColor: Colors.transparent,
        maintainState: true,
        title: Text(
          'Ahmed El-Zabout',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        children: <Widget>[
          Divider(height: 1,),
          Container(
            padding: EdgeInsets.all(15.r),
            child: Column(
              children: [
                buildRowTitleValue('الاسم','Ahmed El-Zabout'),
                buildRowTitleValue('رقم الجوال','(173)211-2509'),
                buildRowTitleValue('البريد الالكتروني','denise.vargas@mail.com'),
                buildRowTitleValue('تاريخ الميلاد','05/04/1978'),
                buildRowTitleValue('الجنسية','فلسطينية'),
                buildRowTitleValue('رقم الجواز','1243213456'),
                buildRowTitleValue('تاريخ الإصدار-لانتهاء','12/02/2019 - 12/02/2022'),

              ],
            ),
          )
        ],
      ),
    );
  }


  buildRowTitleValue(String title,String value){
    return Row(
      children: [
        textBody(title,color: Colors.black),
        Spacer() ,
        textBody(value,color: defaultHint),
      ],
    ) ;
  }
}

