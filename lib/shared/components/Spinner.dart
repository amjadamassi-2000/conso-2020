import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Spinner extends StatefulWidget {
  List<String> names  ;
  Function onChange ;
   Spinner({Key key,this.names , this.onChange}) : super(key: key);

  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> {
  int selectIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.names.length,
      itemBuilder: (context, index) {

      return ListTile(
        onTap: (){
          setState(() {
            selectIndex = index;
           if(widget.onChange!=null) widget.onChange(index);
          });
        },
        title: Text(widget.names[index]),
        leading: customCheck(index ==selectIndex,(){

        },color: defaultColor)
      );
    },);
  }
}
