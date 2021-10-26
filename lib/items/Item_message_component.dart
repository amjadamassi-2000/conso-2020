
import 'package:conso_customer/shared/CustomRoundedRectangleBorder.dart';
import 'package:conso_customer/shared/components/Constant.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MessageComponent extends StatefulWidget {
 // final User targetUser;

  MessageComponent();

  @override
  _MessageComponentState createState() => _MessageComponentState();
}

class _MessageComponentState extends State<MessageComponent> {
 // Message _message;

  @override
  Widget build(BuildContext context) {
  //  _message = Provider.of(context, listen: false);
    return Column(
      children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

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
                              type: 1,
                              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                              borderWidth: 2.0,
                            ),
                            // side: new BorderSide(color: Colors.white)
                          ),
                        child:Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس ، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                    ),
                                  )

                              ),
                    ),
                    SizedBox(width: 15.w,),
                    imageCircle(Constant.imageTest,radius: 20.r),


                  ],
                ),
                )

      ]
    );
  }
}
