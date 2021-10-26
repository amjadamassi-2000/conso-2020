import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class ItemCllHistory extends StatelessWidget {
  const ItemCllHistory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              textBodyMedium('محمد العامري',color: defaultColor,textAlign: TextAlign.start,fontSize: 22.sp),
              textBodyMedium('30 دقيقة',color: defaultHint,textAlign: TextAlign.start,fontSize: 20.sp),
              textBodyMedium('اليوم 15 يونيو, 15:35',color: defaultHint,textAlign: TextAlign.start,fontSize: 20.sp),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
