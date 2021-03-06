
import 'package:conso_customer/shared/CustomRoundedRectangleBorder.dart';
import 'package:conso_customer/shared/components/Constant.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MessageComponentOther extends StatefulWidget {
 // final User targetUser;

  MessageComponentOther();

  @override
  _MessageComponentOtherState createState() => _MessageComponentOtherState();
}

class _MessageComponentOtherState extends State<MessageComponentOther> {
 // Message _message;

  @override
  Widget build(BuildContext context) {
  //  _message = Provider.of(context, listen: false);
    return Column(
      children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    imageCircle(Constant.imageTest,radius: 20.r),

                    SizedBox(width: 15.w,),
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(
                         // maxWidth: AI.w * 0.65,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 12.h,
                          horizontal: 24.w,
                        ),
                        margin: EdgeInsetsDirectional.only(
                          bottom: 12.h,
                        ),
                          decoration: new ShapeDecoration(
                            //color: Colors.black,
                            shape: new CustomRoundedRectangleBorder(
                              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                              borderWidth: 2.0,
                            ),
                            // side: new BorderSide(color: Colors.white)
                          ),
                        child:Text('?????? ???????? ???? ???????? ?????? ???????? ???? ???????????? ???? ?????? ?? ?????? ?????????? ???? ???????? ?????? ?????? ???????? ???? ???????????? ???? ???????????? ???????????? ?????????? ?????? ?????????? ?????? ???????????? ???????? ???????????? ??????????????',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                    ),
                                  )

                              ),
                    ),
                  ],
                ),
                )

      ]
    );
  }
}
