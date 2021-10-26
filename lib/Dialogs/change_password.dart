import 'package:conso_customer/screens/Home/select_dates.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/ScrollColumnExpandable.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ChangePassword extends StatefulWidget {
  @override
  _flight_dialogState createState() => _flight_dialogState();
}

class _flight_dialogState extends State<ChangePassword> {
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

                defaultTextFormDialog(
                    from, 'Old_Password'.t,
                    onTap: () {}, icon: svgImage('password'),isBorder: true),
                SizedBox(height: 10.h,),
                defaultTextFormDialog(
                    from, 'New_Password'.t,
                    onTap: () {}, icon: svgImage('password'),isBorder: true),
                SizedBox(height: 10.h,),

                defaultTextFormDialog(
                    from, 'confirm_password'.t,
                    onTap: () {}, icon: svgImage('password'),isBorder: true),

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
              setState(() {
                isOne_way = true;
              });
            },
            fontSize: 15.sp,
            text: 'change_Password'.t,
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

showChangePassword(BuildContext context) {
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
          content: ChangePassword(),
        ),
        Spacer(),
      ],
    ),
  );
}
