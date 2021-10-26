import 'package:conso_customer/items/item_record_bokings.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecordBookings extends StatefulWidget {
  const RecordBookings({Key key}) : super(key: key);

  @override
  _RecordBookingsState createState() => _RecordBookingsState();
}

class _RecordBookingsState extends State<RecordBookings>  with SingleTickerProviderStateMixin {
  TabController controller;
  bool isZero = true;
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
    return Scaffold(
      appBar: myAppBar('RecordBookings'.t),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                defaultButton(
                  onPressed: () {
                    controller.index = 0;
                    setState(() {
                      isZero = true;
                    });
                  },
                  icon: svgImage('Hotels',color: isZero?Colors.white :defaultColor),
                  fontSize: 15.sp,
                  text: 'Flight'.t,
                  height: 35.h,
                  isExpanded: false,
                  isBorder: !isZero,
                  isShadow: false,
                  // icon: svgImage('chat_btn', color: Colors.white, size: 15),
                ),
                SizedBox(
                  width: 8.w,
                ),
                defaultButton(
                  onPressed: () {
                    controller.index = 1;
                    setState(() {
                      isZero = false;
                    });
                  },
                  icon: svgImage('Flight',color: !isZero?Colors.white :defaultColor),
                  fontSize: 15.sp,
                  isExpanded: false,
                  text: 'Hotels'.t,
                  height: 35.h,
                  isShadow: false,
                  isBorder: isZero,
                ),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: controller,
            children: [
              Tab1(0),
              Tab1(1),

              //Tab1(),
            ],
          ))
          // PageView(
          //   children: [
          //     // tap1(),
          //     // tap1()
          //   ],
          // )
        ],
      ),
    );
  }
}

class Tab1 extends StatelessWidget {

  final appIndex ;
  Tab1(this.appIndex) ;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ItemRecordBookings(appIndex);
      },
    );
  }

}
