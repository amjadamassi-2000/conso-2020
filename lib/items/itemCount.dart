import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class ItemCount extends StatefulWidget {
 String title  ;
   ItemCount({this.title});

  @override
  _ItemCountState createState() => _ItemCountState();
}

class _ItemCountState extends State<ItemCount> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            textBody(widget.title, color: Colors.black),
            Spacer(),
            InkWell(
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
                child: svgImage('add', size: 20.w)),
            /*   TextButton.icon(onPressed: (){
            setState(() {
              count++ ;
            });
          }, icon: Icon(Icons.add,color: defaultColor,size: 40),label: Container(),),
          */
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: textBodyMedium('${count.toString()}', color: defaultHint),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    if (count > 0) count--;
                  });
                },
                child: Container(
                    width: 20.w,
                    child: svgImage('remove', size: 20.w, width: 5.w))),
            // TextButton.icon(onPressed: (){
            //   setState(() {
            //    if(count>0)  count-- ;
            //   });
            // }, icon: Icon(Icons.remove ,color: defaultColor,size: 40,),label: Container(),),
          ],
        ),
        Divider(color: defaultHint /*,indent: 20.w,endIndent: 20.w,*/),
      ],
    );
  }
}
