import 'package:conso_customer/screens/ServiceProvider/reviews_screen.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:conso_customer/extensions_lang.dart';

class ServiceProvidersDetails extends StatefulWidget {
  final String name;

  ServiceProvidersDetails({Key key, this.name}) : super(key: key);

  @override
  _ServiceProvidersDetailsState createState() =>
      _ServiceProvidersDetailsState();
}

class _ServiceProvidersDetailsState extends State<ServiceProvidersDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(widget.name),
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.all(15.r),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      imageCircle(
                          "https://miro.medium.com/max/12000/1*PgIo7r6qQXem8BmWd-vksQ.jpeg",
                          radius: 50.r),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                      child:
                          textBodyMedium('رائد الماجد', color: defaultColor)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      defaultButton(
                        onPressed: () {},
                        fontSize: 15.sp,
                        text: 'start_chatting'.t,
                        height: 35.h,
                        isShadow: false,
                        isExpanded: false,
                        icon:
                            svgImage('chat_btn', color: Colors.white, size: 15),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      defaultButton(
                          onPressed: () {},
                          fontSize: 15.sp,
                          isExpanded: false,
                          text: 'start_calling'.t,
                          height: 35.h,
                          isShadow: false,
                          isBorder: true,
                          icon: svgImage('phone_call')),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      ratingBar(0),
                      textBody('[1650 تقييم]', color: defaultHint)
                    ],
                  ),
                ],
              )),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                buildRow(),
                Divider(
                  height: 1,
                ),
                buildRow(),
                Divider(
                  height: 1,
                ),
                buildRow(),
                Divider(
                  height: 1,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.r ,vertical: 15.r),
                  child: Row(
                    children: [
                      svgImage('favourite2'),
                      SizedBox(
                        width: 10.w,
                      ),
                      textBodyBigSkinny('User_reviews', color: defaultColor),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50.w),
                  decoration: BoxDecoration(border: Border.all(color: defaultHint)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    textBody('مستخدم 1', color: defaultColor),
                                    Spacer(),
                                    textBody('م 8:30', color: defaultHint),
                                  ],
                                ),
                                ratingBar(5),
                                textDetails('هذا النص هو مثال لنص يمكن أن يستبدل في نفس ، حيث يمكنك أن تولد مثل" هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيقإذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير "من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع',color: defaultColor,maxline:5 ,textAlign: TextAlign.start),


                              ],
                            ),
                          ),
                          Divider(color: defaultHint,height: 1,)
                        ],
                      );
                    },
                  ),
                ),
                InkWell(onTap: (){
                  To(context, ReviewsScreen());
                },child: textBody('text',color: defaultColor)) ,
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  buildRow() {
    return Container(
      padding: EdgeInsets.all(15.r),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              svgImage('resume'),
              SizedBox(
                width: 10.w,
              ),
              textBodyBigSkinny('رائد الماجد', color: defaultColor),
            ],
          ),
          textBodyMedium(
              'هذا النص هو مثال لنص يمكن أن يستبدل في نفس ، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيقإذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموق',
              color: defaultColor,
              fontSize: 12.sp,
              textAlign: TextAlign.start)
        ],
      ),
    );
  }
}
