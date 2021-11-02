import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:conso_customer/extensions_lang.dart';

class ReviewsScreen extends StatefulWidget {
  final int id;

  ReviewsScreen({Key key, this.id}) : super(key: key);

  @override
  _ReviewsScreenState createState() =>
      _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('User_reviews'.t),
      body: ListView(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.r ,vertical: 15.r),
            child: Row(
              children: [
                svgImage('favourite2'),
                SizedBox(
                  width: 10.w,
                ),
                textBodyBigSkinny('User_reviews'.t, color: defaultColor),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(

            margin: EdgeInsets.symmetric(horizontal: 30.w),
            decoration: BoxDecoration(
              color: Colors.white,
              /*  border: Border.all(color: defaultHint),*/
            boxShadow: boxShadow()),
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
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }


}
