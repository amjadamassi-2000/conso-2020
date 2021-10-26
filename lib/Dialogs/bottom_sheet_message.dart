
import 'package:conso_customer/items/Item_message_component.dart';
import 'package:conso_customer/items/Item_message_component_ather.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomSheetMessages extends StatefulWidget {
  const BottomSheetMessages({Key key}) : super(key: key);

  @override
  _BottomSheetMessagesState createState() => _BottomSheetMessagesState();
}


class _BottomSheetMessagesState extends State<BottomSheetMessages> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Scaffold(

        appBar: myAppBar('title'),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  reverse: true,
                  itemCount: 4,
              itemBuilder:(context, index) =>index%2 == 0 ? MessageComponent(): MessageComponentOther())),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.w),
              decoration: BoxDecoration(
               // borderRadius: BorderRadius.circular(25),
                boxShadow: boxShadow(),
                color: Colors.white
                //color: AppShared.appTheme['MessagingBox'],
              ),
              //margin: AppStyles.defaultPadding2,
              child: Row(
                children: [

                  Expanded(
                    child: defaultTextFormDialog(TextEditingController(), 'اكتب شيئا',size: 16.sp),
                  ),
                  InkWell(
                    onTap: () async {

                    },
                    child: Icon(Icons.arrow_forward,color: defaultColor,size: 30.r,),
                  ),
                ],
              ),
            )
          ],
        ) ,
      ),
    );
  }
}


