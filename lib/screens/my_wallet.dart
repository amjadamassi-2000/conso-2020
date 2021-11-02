import 'package:conso_customer/Dialogs/added_value.dart';
import 'package:conso_customer/screens/edit_my_wallet.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/size_extension.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({Key key}) : super(key: key);

  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('MyWallet'.t,actions: [IconButton(onPressed: (){
        To(context, EditMyWallet());
      }, icon: svgImage('pen',color: Colors.white))]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(15.r),
              margin: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: defaultColor ,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.h,),
                  textBody('الرصيد الحالي',fontSize: 18.sp,isBold: true),
                  SizedBox(height: 5.h,),
                  textBodyMedium('150 ريال',fontSize: 40.sp,isBold: true),
                  SizedBox(height: 5.h,),
                  DefaultButton(onPressed: (){
                    showAddBalanceDialog(context) ;
                  }, text: 'add_credit'.t,
                  isBorder: true,
                  isShadow: false,
                  isExpanded: false,
                    radius:5.r ,
                    height: 32.h,
                    icon: svgImage('plusIcon'),
                  background: Colors.white,
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    svgImage('updated'),
                    SizedBox(width: 5.w,) ,
                    textBody('AutoFill'.t) ,

                  ],)
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Divider(),
            textBodyBigSkinny('طرق الدفع'),
            SizedBox(height: 10.h,),
            buildRow('بطاقة الفيزا', 'visa', '470************'),
            buildRow('بطاقة مدى', 'mada', '470************'),
            buildRow('أبل باي', 'applepay', '470************'),

          ],
        ),
      ),

    );
  }

  buildRow(name,image , number){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.r),

      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.r),

            color: Color(0xfff7F5F7),
            child: Row(
              children: [
                svgImage(image),
                SizedBox(width: 5.w,),
                textBody(name,color: defaultColor),
                Spacer(),
                textBody(number,color: defaultColor)
              ],
            ),
          ),
          Divider(height: 1,)
        ],
      ),
    );
  }
}
