import 'package:conso_customer/items/itemCount.dart';
import 'package:conso_customer/items/itemRoom.dart';
import 'package:conso_customer/items/item_favorite_destinations.dart';
import 'package:conso_customer/modle/travelers.dart';
import 'package:conso_customer/screens/ServiceProvider/itemServiceProvider.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '';

class SelectDates extends StatefulWidget {
  bool isRage ;

  SelectDates({this.isRage = true});

  @override
  _SelectDatesState createState() => _SelectDatesState();
}

class _SelectDatesState extends State<SelectDates> {


   DateTime startDate ;
  // DateTime endDate ;
  PickerDateRange dateRange ;
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
                    child: buildCloseButton(() {
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
                      //  onTap: clearAll,
                        child: textBody('clear_all'.t, color: defaultColor)),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                SfDateRangePicker(
                  selectionMode:widget.isRage?DateRangePickerSelectionMode.extendableRange : DateRangePickerSelectionMode.single,
                  onSelectionChanged: (value) {
                    setState(() {
                      if(value.value is DateTime){
                        startDate = value.value ;
                      }else{
                        dateRange = value.value ;
                      }
                    });

                  },
                ),
                SizedBox(
                  height: 20.h,
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border:Border.all(color: defaultColor , width: 1 , )
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(child: DateCardView('date_arrival'.t ,dateRange?.startDate??startDate)),
                        VerticalDivider(thickness: 1, width: 1, color: Colors.black,),
                        Visibility(
                          visible: widget.isRage,
                            child: Expanded(child: DateCardView('Departure_Date'.t , dateRange?.endDate??startDate)))
                      ],
                    ),
                  ),
                ) ,
                SizedBox(
                  height: 20.h,
                ),
                defaultButton(text: 'confirm'.t,onPressed:(){
                  Navigator.pop(context,dateRange);
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
class DateCardView extends StatelessWidget {
  String title ;
  DateTime dateTime ;

  DateCardView(this.title ,this.dateTime) ;

  getDate(DateTime dateTime , String format){
    return dateTime!=null? DateFormat(format).format(dateTime) :'-' ;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textBody(title,color: defaultHint) ,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              textBodyMedium(getDate(dateTime,'dd'),color: defaultColor ,fontSize: 25.sp),
              SizedBox(width: 10.w,) ,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textBody(getDate(dateTime ,'MMM yyyy' ),color: defaultTextColor,) ,
                  textBody(getDate(dateTime,'EEEE'),color: defaultTextColor) ,
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

