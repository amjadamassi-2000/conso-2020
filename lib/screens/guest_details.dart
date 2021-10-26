import 'package:conso_customer/screens/Home/select_dates.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/Spinner.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/size_extension.dart';

class GuestDetails extends StatefulWidget {
  const GuestDetails({Key key}) : super(key: key);

  @override
  _GuestDetailsState createState() => _GuestDetailsState();
}

class _GuestDetailsState extends State<GuestDetails> {

  TextEditingController firstName = TextEditingController()
    ..text = '';
  TextEditingController lastName = TextEditingController()
    ..text = '';
  TextEditingController mobile = TextEditingController()
    ..text = '';
  TextEditingController email = TextEditingController()
    ..text = '';
  TextEditingController birthDate = TextEditingController()
    ..text = '';


  bool isFirst =true ;
  Widget myWdget;

  @override
  void initState() {
    // TODO: implement initState
    myWdget = BuildMyWidgetFirst() ;
    super.initState();
  }

  Widget BuildMyWidgetFirst() {
    return Container(
      color: Colors.white,
      key: ValueKey<int>(0),
      child: Column(
        children: [
          divider('contact_details'.t),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            // padding: EdgeInsets.all(5),
            clipBehavior: Clip.hardEdge,
            decoration: boxDecoration,
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                          child: defaultTextFormDialog(
                              firstName, 'fitsName'.t,
                              icon: svgImage('user'))),
                      VerticalDivider(
                        thickness: 1,
                        width: 1,
                        color: defaultBorder,
                      ),
                      Expanded(
                          child: defaultTextFormDialog(
                            lastName,
                            'lastName'.t,
                          )),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 1,
                  color: defaultBorder,
                ),
                defaultTextFormDialog(
                    mobile, 'mobile'.t,
                    icon: svgImage('phone')),

                Divider(
                  thickness: 1,
                  height: 1,
                  color: defaultBorder,
                ),
                defaultTextFormDialog(
                    email, 'email'.t,
                    icon: svgImage('email', color: defaultHint)),

                Divider(
                  thickness: 1,
                  height: 1,
                  color: defaultBorder,
                ),
                defaultTextFormDialog(
                    birthDate,
                    'date_birth'.t,
                    icon: svgImage('calendar-day'),
                    onTap: () {
                      //   To(context, ChooseCategoryPassengers());
                    }),


              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            // padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: boxDecoration,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Expanded(child: defaultTextFormDialog(
                          firstName, 'الجنسية', onTap: () {})),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: defaultColor,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                  decoration: boxDecoration,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customCheck(true, () {

                      }, color: Colors.black),
                      SizedBox(width: 10.w,),
                      textBody('هل تحجز لشخص لآخر ؟', color: Colors.black87),
                    ],
                  ),
                ),
              ],
            ),
          ),
          divider('add'.t),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: boxDecoration,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(child: defaultTextFormDialog(
                    firstName, 'Add_special_requests'.t, onTap: () {})),
                Icon(
                  Icons.arrow_forward_ios,
                  color: defaultColor,
                )
              ],
            ),
          ),
          SizedBox(height: 20.h,),


        ]
        ,
      ),
    ) ;
  }
  Widget BuildMyWidget2() {
    return Container(
      color: Colors.white,
      key: ValueKey<int>(1),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            // padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: [
                    svgImage('bar_code'),
                    SizedBox(width: 10.w,),
                    textBody('أدخل كود الخصم',color: Colors.black),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: defaultTextFormDialog(
                           birthDate,
                          'discount_code'.t,
                        isBorder: true
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    Expanded(
                      flex: 1,
                      child: defaultButton(
                        height: 30.h,
                        isFittedText: true,
                        isExpanded: false,
                        onPressed: () {

                      }, text: 'confirm'.t,),
                    ),
                  ],
                ),


              ],
            ),
          ),
          divider('Payment_method'.t),
          Spinner(names: ['احجز الآن ، ادفع لاحقاً ' ,'المحفظة' ,'البطاقات الائتمانية' ],
            onChange: (i){

          },) ,
          SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: defaultButton(onPressed: () {

            }, text: 'reservation_confirmation'.t,),
          ),
        ]
        ,
      ),
    ) ;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(!isFirst){
          setState(() {
            myWdget = BuildMyWidgetFirst() ;
          });

          isFirst = true ;
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: myAppBar('Guest_details'.t),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          width: 120.h,
                          height: 100.h,
                          child: imageNet(
                            'https://miro.medium.com/max/12000/1*PgIo7r6qQXem8BmWd-vksQ.jpeg',
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              textBody('فندق أسكوب التحلية جدة',
                                  color: defaultColor),
                              SizedBox(height: 10.h,),
                              ratingBar(0),
                              SizedBox(height: 10.h,),
                              textDetails('ليلة واحدة ، نزيل واحد ، غرفة واحدة',
                                  maxline: 1,
                                  color: Colors.black87),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 30.h,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: defaultColor, width: 1,)
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(child: DateCardView(
                                'date_arrival'.t, DateTime.now())),
                            VerticalDivider(thickness: 1,
                              width: 1,
                              color: defaultHint,),
                            Expanded(child: DateCardView(
                                'Departure_Date'.t, DateTime.now()))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15.r),
                color: backgroundColor,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textBodyMedium('الاجمالي', color: defaultColor),
                          SizedBox(height: 10.h,),
                          textDetails(
                            'شاملة الخدمة و الضريبة ما عدا الضريبة السياحية ان وجدت / لا تشمل ضريبة المدينة ان وجدت',
                            color: defaultHint,
                            textAlign: TextAlign.start,
                            isLimit: false,)
                        ],),
                    ),
                    SizedBox(width: 10.w,),
                    Column(
                      children: [
                        textBodyMedium(
                            '3804', color: defaultColor, fontSize: 22.sp),
                        textBodyMedium(
                            'ريال', color: defaultColor, fontSize: 22.sp),
                      ],
                    )
                  ],
                ),
              ),

              AnimatedSwitcher(
                duration:  Duration(milliseconds: 1000),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(child: child, scale: animation);
                },
                child: myWdget,

              ),
               //BuildMyWidget2(),
              Visibility(
                visible: isFirst,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: defaultButton(onPressed: () {
                    setState(() {
                      myWdget = BuildMyWidget2() ;
                      isFirst = false ;
                    });
                  }, text: 'continue'.t,),
                ),
              ),
              SizedBox(height: 100.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
