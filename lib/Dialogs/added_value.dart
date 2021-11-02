import 'package:conso_customer/screens/Home/choose_category_passengers.dart';
import 'package:conso_customer/screens/Home/select_dates.dart';
import 'package:conso_customer/screens/Home/select_destination.dart';
import 'package:conso_customer/screens/Home/select_rooms_guests.dart';
import 'package:conso_customer/screens/HomeSearch/home_search.dart';
import 'package:conso_customer/screens/HomeSearch/home_search_notifier.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/ScrollColumnExpandable.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/custom_navigate.dart';
import 'package:conso_customer/shared/components/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddBalance extends StatefulWidget {
  @override
  _flight_dialogState createState() => _flight_dialogState();
}

class _flight_dialogState extends State<AddBalance> {


  TextEditingController recharge = TextEditingController()..text = '';


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      //height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20.h),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: buildCloseButton(() {
                    Navigator.of(context).pop();
                  }),
                ),
                textBody('Please_amount'.t, color: defaultColor,),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: defaultTextFormDialog(recharge, 'مبلغ الشحن',isBorder: true,textAlign:TextAlign.center),
                ) ,
                SizedBox(
                  height: 10.h,
                ),
                textBody('Shipping_through'.t, color: defaultColor,),

                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:
                    List.generate(3, (index) {
                      return Row(
                        children: [
                          customCheck(false, (){

                          },color: defaultColor) ,
                          SizedBox(width: 5.w,),
                          svgImage('visa'),
                        ],
                      );
                    }) .toList(),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            height: 1,
            color: defaultColor,
          ),
          DefaultButton(
            background: Colors.white,
            textColor: defaultColor,
            onPressed: () {

             // To(context, HomeSearch());
            },
            fontSize: 15.sp,
            text: 'Recharge'.t,
            height: 50.h,

            isExpanded: true,
            isBorder: false,
            isShadow: false,
            // icon: svgImage('chat_btn', color: Colors.white, size: 15),
          ),
        ],
      ),
    );
  }


}


showAddBalanceDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => ScrollColumnExpandable(
      children: [
        Spacer(),
        AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: AddBalance(),
        ),
        Spacer(),
      ],
    ),
  );
}
