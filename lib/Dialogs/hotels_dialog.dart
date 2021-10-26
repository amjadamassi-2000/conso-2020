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
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class hotels_dialog extends StatefulWidget {
  @override
  _flight_dialogState createState() => _flight_dialogState();
}

class _flight_dialogState extends State<hotels_dialog> {
  bool isOne_way = false;

  TextEditingController from = TextEditingController()..text = '';
  TextEditingController destination = TextEditingController()..text = '';
  TextEditingController number_guests = TextEditingController()..text = '';
  TextEditingController number_rooms = TextEditingController()..text = '';
  TextEditingController to = TextEditingController()..text = '';

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
                textBodyMedium('Hotels'.t, color: defaultColor),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  // padding: EdgeInsets.all(5),
                  clipBehavior: Clip.hardEdge,
                  decoration: boxDecoration,
                  child: Column(
                    children: [
                      defaultTextFormDialog(
                          destination, 'Destination_hint'.t,
                          onTap: (){
                            To(context, SelectDestination());
                          },
                          icon: svgImage('mark', color: defaultHint)),
                      Divider(
                        thickness: 1,
                        height: 1,
                        color: defaultBorder,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                                child: defaultTextFormDialog(
                                    number_guests, 'number_guests'.t,
                                    onTap:(){
                                      To(context, SelectRoomsGuests());
                                    },
                                    icon: svgImage('user'))),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: defaultColor,
                            )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        height: 1,
                        color: defaultBorder,
                      ),
                      defaultTextFormDialog(number_rooms, 'number_rooms'.t,
                          icon: svgImage('bed'), onTap: () {
                        To(context, ChooseCategoryPassengers());
                      }),
                      Divider(
                        thickness: 1,
                        height: 1,
                        color: defaultBorder,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                                child: defaultTextFormDialog(from, 'from'.t,onTap: ()async{
                                  PickerDateRange ra =  await To(context,SelectDates()) ;
                                  callback(ra) ;
                                  print(ra.startDate.toIso8601String()) ;
                                },
                                    icon: svgImage('calendar-day'))),
                            VerticalDivider(
                              thickness: 1,
                              width: 1,
                              color: defaultBorder,
                            ),
                            Expanded(
                                child: defaultTextFormDialog(
                                  to,
                                  'to'.t,onTap: ()async{
                                  PickerDateRange ra =  await To(context,SelectDates()) ;
                                  callback(ra) ;
                                },
                                )),
                          ],
                        ),
                      )

                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            height: 1,
            color: defaultColor,
          ),
          defaultButton(
            background: Colors.white,
            textColor: defaultColor,
            onPressed: () {
              CustomNavigate<HomeSearchNotifier>().navigateTo(context,  HomeSearch(isPlan: false,), create: (context) =>HomeSearchNotifier());

             // To(context, HomeSearch());
              setState(() {
                isOne_way = true;
              });
            },
            fontSize: 15.sp,
            text: 'Search'.t,
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

  callback(PickerDateRange ra){
    if(ra!=null){
      setState(() {
        from.text = DateFormat(DateFormat.YEAR_MONTH_DAY).format(ra.startDate) ;
        to.text = DateFormat(DateFormat.YEAR_MONTH_DAY).format(ra.endDate) ;
      });

    }
  }
}


showHotelsDialog(BuildContext context) {
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
          content: hotels_dialog(),
        ),
        Spacer(),
      ],
    ),
  );
}
