import 'package:conso_customer/screens/Home/HomeScreen.dart';
import 'package:conso_customer/screens/Home/home_notifier.dart';
import 'package:conso_customer/screens/Home/select_dates.dart';
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

class FlightDialog extends StatefulWidget {
  @override
  _flight_dialogState createState() => _flight_dialogState();
}

class _flight_dialogState extends State<FlightDialog> {
  bool isOne_way = false;

  TextEditingController from = TextEditingController()..text = '';
  TextEditingController to = TextEditingController()..text = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
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
                textBodyMedium('air_flights'.t, color: defaultColor),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: defaultButton(
                        onPressed: () {
                          setState(() {
                            isOne_way = true;
                          });
                        },
                        fontSize: 15.sp,
                        text: 'One_way'.t,
                        height: 35.h,
                        isExpanded: false,
                        isBorder: !isOne_way,
                        isShadow: false,
                        // icon: svgImage('chat_btn', color: Colors.white, size: 15),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: defaultButton(
                        onPressed: () {
                          setState(() {
                            isOne_way = false;
                          });
                        },
                        fontSize: 15.sp,
                        isExpanded: false,
                        text: 'go_back'.t,
                        height: 35.h,
                        isShadow: false,
                        isBorder: isOne_way,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  // padding: EdgeInsets.all(5),
                  clipBehavior: Clip.hardEdge,
                  decoration: boxDecoration,
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                                child: defaultTextFormDialog(from, 'from'.t,
                                    icon: svgImage('from_icon'))),
                            VerticalDivider(
                              thickness: 1,
                              width: 1,
                              color: defaultBorder,
                            ),
                            Expanded(
                                child: defaultTextFormDialog(
                              from,
                              'to'.t,
                            )),
                          ],
                        ),
                      ),
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
                                    from, 'single_degree'.t,
                                    onTap: () {}, icon: svgImage('user'))),
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
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: defaultTextFormDialog(
                                  from, 'date_arrival'.t,
                                  icon: svgImage('calendar-day'),
                                  onTap: ()async {

                                    var ra =  await To(context,SelectDates(isRage: !isOne_way,)) ;
                                    callback(ra) ;
                                  }),
                            ),
                            Expanded(
                              child: Visibility(
                                visible: !isOne_way,
                                child: Row(
                                  children: [
                                    VerticalDivider(
                                      thickness: 1,
                                      width: 1,
                                      color: defaultBorder,
                                    ),
                                    Expanded(
                                        child: defaultTextFormDialog(
                                            to, 'Departure_Date'.t,
                                            onTap: () async{
                                              var ra =  await To(context,SelectDates(isRage: !isOne_way,)) ;
                                              callback(ra) ;
                                            })),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

              CustomNavigate<HomeSearchNotifier>().navigateTo(context,  HomeSearch(), create: (context) =>HomeSearchNotifier());

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

  callback(var ra){
    if(ra!=null){
      setState(() {
        if(!isOne_way){
          from.text = DateFormat(DateFormat.YEAR_MONTH_DAY).format(ra.startDate) ;
          to.text = DateFormat(DateFormat.YEAR_MONTH_DAY).format(ra.endDate) ;
        }else{
          from.text = DateFormat(DateFormat.YEAR_MONTH_DAY).format(ra) ;

        }

      });

    }
  }
}

showFlightDialog(BuildContext context) {
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
          content: FlightDialog(),
        ),
        Spacer(),
      ],
    ),
  );
}
