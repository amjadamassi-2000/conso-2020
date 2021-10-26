import 'package:conso_customer/items/item_billing_record.dart';
import 'package:conso_customer/items/item_call_history.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:conso_customer/extensions_lang.dart';

class BillingRecord extends StatefulWidget {
  const BillingRecord({Key key}) : super(key: key);

  @override
  _BillingRecordState createState() => _BillingRecordState();
}

class _BillingRecordState extends State<BillingRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Billing_record'.t),
      body: ListView.builder(
        itemCount: 10,
        // shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ItemBillingRecord();
      },),
    );
  }
}
