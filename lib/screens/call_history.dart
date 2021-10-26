import 'package:conso_customer/items/item_call_history.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:conso_customer/extensions_lang.dart';

class CallHistory extends StatefulWidget {
  const CallHistory({Key key}) : super(key: key);

  @override
  _CallHistoryState createState() => _CallHistoryState();
}

class _CallHistoryState extends State<CallHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('call_log'.t),
      body: ListView.builder(
        itemCount: 10,
        // shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ItemCllHistory();
      },),
    );
  }
}
