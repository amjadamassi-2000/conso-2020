import 'package:conso_customer/screens/Home/select_dates.dart';
import 'package:conso_customer/screens/guest_details.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/Constant.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/default_button.dart';
import 'package:conso_customer/shared/styles/style.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:conso_customer/extensions_lang.dart';

class HotelDetails extends StatefulWidget {

  @override
  _HotelDetailsState createState() => _HotelDetailsState();
}



class _HotelDetailsState extends State<HotelDetails> with SingleTickerProviderStateMixin {

  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);
  bool isZero = true;
  double pinnedHeaderHeight;
  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(initialIndex: 0, length: 2, vsync: this);
    controller.addListener(() {
      setState(() {
        isZero = controller.index != 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    pinnedHeaderHeight = statusBarHeight + kToolbarHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ExtendedNestedScrollView(
        pinnedHeaderSliverHeightBuilder: () => pinnedHeaderHeight,
        onlyOneScrollInBody: true,
        floatHeaderSlivers: false,
        headerSliverBuilder: (context, isInner) {
          return [
            SliverAppBar(
              floating: false,
              excludeHeaderSemantics: false,
              title: Text(
                'فندق كارلتون المعييد',
                style: defaultTextStyleTitle(),
              ),
              elevation: 0,
              centerTitle: true,
              stretch: true,
              expandedHeight: 430.h,
              pinned: true,
              brightness: Brightness.dark,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        height: 200.h,
                        child: Stack(
                          children: [
                            PageView.builder(
                              itemCount: 5,
                              onPageChanged: (value) {
                                currentPage = value;
                                setState(() {});
                              },
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(
                                        height: double.infinity,
                                        child: imageNet(Constant.imageTest)),
                                    Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      color: Colors.black12,
                                    ),
                                  ],
                                );
                              },
                            ),
                            PositionedDirectional(
                              end: 10.w,
                              bottom: 10.w,
                              child: AnimatedSmoothIndicator(
                                activeIndex: currentPage,
                                count: 5,
                                effect: WormEffect(
                                    dotColor: Colors.white,
                                    paintStyle: PaintingStyle.fill,
                                    type: WormType.thin,
                                    dotHeight: 10.w,
                                    dotWidth: 10.w),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ratingBar(0),
                                textBody('[1650 تقييم]', color: defaultHint),
                                Spacer(),
                                textBodyMedium('ريال 450',
                                    color: defaultColor, fontSize: 18.sp)
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: defaultColor,
                                    width: 1,
                                  )),
                              child: Column(
                                children: [
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: DateCardView(
                                                'date_arrival'.t,
                                                DateTime.now())),
                                        VerticalDivider(
                                          thickness: 1,
                                          width: 1,
                                          color: defaultHint,
                                        ),
                                        Expanded(
                                            child: DateCardView(
                                                'Departure_Date'.t,
                                                DateTime.now()))
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    height: 1,
                                    color: defaultHint,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.w),
                                    child: Row(
                                      children: [
                                        svgImage('bed', size: 20.w),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        textBodyMedium(
                                            'ليلة واحدة ، نزيل واحد ، غرفة واحدة',
                                            fontSize: 16.sp,
                                            color: defaultColor,
                                            fontWeight: FontWeight.w500),
                                        Spacer(),
                                        svgImage('pen', size: 20.w),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: DefaultButton(
                      onPressed: () {
                        controller.index = 0;
                        setState(() {
                          isZero = true;
                        });
                      },
                      fontSize: 15.sp,
                      text: 'Choose_room'.t,
                      height: 35.h,
                      isExpanded: false,
                      isBorder: !isZero,
                      isShadow: false,
                      // icon: svgImage('chat_btn', color: Colors.white, size: 15),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: DefaultButton(
                      onPressed: () {
                        controller.index = 1;
                        setState(() {
                          isZero = false;
                        });
                      },
                      fontSize: 15.sp,
                      isExpanded: false,
                      text: 'Hotel_details'.t,
                      height: 35.h,
                      isShadow: false,
                      isBorder: isZero,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  Tab1(),
                  Tab2(),
                  //Tab1(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return RoomItem();
      },
    );
  }
}

class RoomItem extends StatelessWidget {
  EdgeInsetsDirectional edgeInsets;

  RoomItem({Key key}) {
    edgeInsets =  EdgeInsetsDirectional.only(top: 10.h, bottom: 10.h, start: 15.h);

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        imageNet(Constant.imageTest),
        Row(
          children: [
            buildRow('قابل للاسترداد', 'dollar-symbol', true),
            buildRow('أقصى عدد النزلاء 1', 'icon_person', true),
          ],
        ),
        Row(
          children: [
            buildRow('إحجز الآن و ادفع لاحقاً', 'check_room', true),
            buildRow('شاملة إقامة و إفطار', 'check_room', false),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(15.r),
          child: Row(
            children: [
              textBodyMedium('ليلة واحدة 450 ريال', color: defaultColor),
              Spacer(),
              DefaultButton(
                  // fontSize: 20.sp,
                  isShadow: false,
                  isExpanded: false,
                  toUpper: false,
                  isFittedText: true,
                  iconEnd: false,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    To(context, GuestDetails());
                  },
                  text: 'room_reservation'.t,
                  height: 35.h),
            ],
          ),
        )
      ],
    );
  }

  buildRow(String name, String icon, bool isActivate) {
    return Expanded(
      child: Container(
        padding: edgeInsets,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            svgImage(icon,
                size: 15.r, color: isActivate ? Colors.blue : Colors.black54),
            SizedBox(
              width: 4.w,
            ),
            textBody(name, color: isActivate ? Colors.blue : Colors.black54),
          ],
        ),
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        divider('Offers'.t),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                10,
                (index) => Container(
                    width: MediaQuery.of(context).size.width * 0.27,
                    margin: EdgeInsets.all(5.r),
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: boxShadow(color: 400)),
                    child: Column(
                      children: [
                        svgImage('check_room', color: defaultColor),
                        textBody('مطاعم', color: defaultColor)
                      ],
                    ))),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        imageNet(Constant.imageTest),
        Container(
          padding: EdgeInsets.all(15.r),
          child: Row(
            children: [
              svgImage('mark', size: 20.r),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                  child: textBodyBigSkinny(
                      'طريق الخبر - الدمام ، 31952 الخبر ، المملكة العربية السعودية',
                      fontSize: 14.sp,
                      color: defaultColor))
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: Expanded(
                child: textBodyBigSkinny(
                    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس ، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيقإذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع',
                    textAlign: TextAlign.start,
                    fontSize: 12.sp,
                    color: defaultTextColor)))
      ],
    );
  }
}
