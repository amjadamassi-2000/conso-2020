import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class ItemBillingRecord extends StatelessWidget {
  const ItemBillingRecord({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textBodyMedium('رمز الفاتورة: 121213',color: defaultColor,textAlign: TextAlign.start,fontSize: 18.sp),
              textBodyMedium('خدمة 1',color: defaultHint,textAlign: TextAlign.start,fontSize: 20.sp),
              textBodyMedium('خدمة 1',color: defaultHint,textAlign: TextAlign.start,fontSize: 20.sp),
              textBodyMedium('إجمالي السعر : 2121 ريال',color: defaultColor,textAlign: TextAlign.start,fontSize: 20.sp),
              textBodyMedium('اليوم 15 يونيو, 15:35',color: defaultHint,textAlign: TextAlign.start,fontSize: 20.sp),
              defaultButton(onPressed: (){}, text: 'في انتظار الدفع',isExpanded: false,
              height: 35.h,isBorder: true,)
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
