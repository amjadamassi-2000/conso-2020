import 'package:conso_customer/items/itemCount.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:conso_customer/extensions_lang.dart';

class ItemRome extends StatefulWidget {
  int index ;
   ItemRome(this.index);

  @override
  _ItemRomeState createState() => _ItemRomeState();
}

class _ItemRomeState extends State<ItemRome> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
            child: textBody('${'room'.t} ${widget.index+1}', color:defaultColor)),
        ItemCount(title: 'Adult'.t,) ,
        ItemCount(title: 'Child'.t,) ,

        SizedBox(height: 10.h,)
      ],
    );
  }
}
