import 'package:conso_customer/screens/Home/select_dates.dart';
import 'package:conso_customer/screens/travelers_details.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/Constant.dart';
import 'package:conso_customer/shared/components/LineDashedPainter.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:conso_customer/shared/styles/style.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:conso_customer/extensions_lang.dart';

class PlanDetails extends StatefulWidget {
  const PlanDetails({Key key}) : super(key: key);

  @override
  _PlanDetailsState createState() => _PlanDetailsState();
}

class _PlanDetailsState extends State<PlanDetails>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;

  PageController pageController = PageController(initialPage: 0);

  bool isZero = true;

  double pinnedHeaderHeight;

  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(initialIndex: 0,length: 2, vsync: this);
    controller.addListener(() {
      setState(() {
        isZero = controller.index!=1;
      });
  });
        }
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    pinnedHeaderHeight = statusBarHeight + kToolbarHeight;
    return Scaffold(
      backgroundColor: Colors.white,

      body: ExtendedNestedScrollView(
        pinnedHeaderSliverHeightBuilder: () => pinnedHeaderHeight,
        onlyOneScrollInBody: true,
        floatHeaderSlivers: false,
        headerSliverBuilder: (context, isInner) {
          return [SliverAppBar(
            floating: false,
            excludeHeaderSemantics: false,

            title: Text('فندق كارلتون المعييد',
              style: defaultTextStyleTitle(),
            ),
            elevation: 0,

            //backgroundColor: const Color(0xffF3F5F7),
            centerTitle: true,
            stretch: true,
            expandedHeight: 250.h,
            pinned: true,
            brightness: Brightness.dark,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,

              background: Container(
                color: Colors.black,
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      foregroundDecoration: BoxDecoration(
                        color: Colors.black26
                      ),
                      child: imageNet(Constant.imageTest),
                    ),

                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            textBodyMedium('القاهرة'),
                            SizedBox(width: 5.w,),
                            svgImage('two-way') ,
                            SizedBox(width: 5.w,),
                             textBodyMedium('الرياض')
                          ],),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              textBody('رحلة ذهاب و عودة'),
                            SizedBox(width: 5.w,),
                              textBody('-'),
                              svgImage('user',color: Colors.white) ,
                              SizedBox(width: 5.w,),
                              textBody('2'),
                              textBody('-'),

                              SizedBox(width: 5.w,),
                              textBody(' الدرجة الاقتصادية')
                          ],),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),

          )
          ];
        },
        body: Column(
          children: [
            Expanded(
                child: Tab1())
            // PageView(
            //   children: [
            //     // tap1(),
            //     // tap1()
            //   ],
            // )
          ],
        ),
      ),
    );
  }

}

class Tab1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildBox() ,
        buildBox() ,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(children: [
            textBody('عدد المقاعد المتاحة : 2',color:defaultColor),
            Spacer(),
            textBody('456 ريال',color:defaultColor),
          ],),
        ) ,
        SizedBox(height: 20.h,),
        Center(
          child: defaultButton(
            // fontSize: 20.sp,
              isShadow: false,
              isExpanded: false,
              toUpper: false,
              isFittedText: true,
              iconEnd: false,
              icon: Icon(Icons.arrow_back ,color: Colors.white,),
              onPressed:(){
                To(context, TravelersDetails()) ;
              },
              text:'book'.t ,
              height: 35.h),
        ),
        SizedBox(height: 20.h,),

      ],
    );
  }

  Widget buildBox(){
   return Container(
      margin: EdgeInsets.all(15.r),
      padding: EdgeInsets.all(15.r),
      decoration: boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            svgImage('airline',size: 20.r) ,
            SizedBox(width: 10.w,),
            textBodyMedium('رحلة الطيران المغادرة : 17 مارس',color: defaultColor,fontSize: 16.sp)
          ],) ,
          SizedBox(height: 20.h,),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(

                  children: [
                    SizedBox(height: 5.h,),
                    Container(
                      height: 15.w,
                      width: 15.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: defaultColor ,width: 2.w),
                          shape: BoxShape.circle
                      ),),
                    Expanded(child:Container(
                      // decoration:BoxDecoration(
                      //   color: Colors.black,
                      //  // border: Border.merge(Border.all(width: 1), Border.all(width: 1))
                      // ) ,
                      width: 1,
                      child: CustomPaint(painter: LineDashedPainter()),
                    ),),
                    // Spacer(),
                    Container(

                      height: 15.w,
                      width: 15.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: defaultColor ,width: 2.w),
                          shape: BoxShape.circle
                      ),),
                    SizedBox(height: 25.h,width: 20.w,child: Container(color: Colors.white,),),
                  ],
                ),
                SizedBox(width: 10.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textBody('23:35',color: defaultColor,),
                    textBody('مطار القاهرة الدولي (CAI)',color: defaultHint),
                    textBody('مدة الرحلة : ساعتان و 25 دقيقة',color: defaultHint),
                    SizedBox(height: 20.h,),
                    textBody('23:35',color: defaultColor,),
                    textBody('مطار القاهرة الدولي (CAI)',color: defaultHint),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          textBodyMedium('رحلة الطيران المغادرة : 17 مارس',color: defaultColor,fontSize: 16.sp)


        ],
      ),
    ) ;
  }
}





