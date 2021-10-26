import 'package:conso_customer/items/item_plane_details.dart';
import 'package:conso_customer/screens/travelers_details_add.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/Spinner.dart';
import 'package:conso_customer/shared/components/cardFormArrow.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TravelersDetails extends StatefulWidget {
  const TravelersDetails({Key key}) : super(key: key);

  @override
  _TravelersDetailsState createState() => _TravelersDetailsState();
}

class _TravelersDetailsState extends State<TravelersDetails> with SingleTickerProviderStateMixin{


  TextEditingController discountCode = TextEditingController()..text = '';
 bool isFirst = true ;
 Widget BuildMyWidget2() {
   return Container(
     color: Colors.white,
     key: ValueKey<int>(1),
     child: Column(
       children: [
         Container(
           margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
           // padding: EdgeInsets.all(5),
           child: Column(
             children: [
               Row(
                 children: [
                   svgImage('bar_code'),
                   SizedBox(width: 10.w,),
                   textBody('أدخل كود الخصم',color: Colors.black),
                 ],
               ),
               SizedBox(height: 10.h,),
               Row(
                 children: [
                   Expanded(
                     flex: 3,
                     child: defaultTextFormDialog(
                         discountCode,
                         'discount_code'.t,
                         isBorder: true
                     ),
                   ),
                   SizedBox(width: 5.w,),
                   Expanded(
                     flex: 1,
                     child: defaultButton(
                       height: 30.h,
                       isFittedText: true,
                       isExpanded: false,
                       onPressed: () {

                       }, text: 'confirm'.t,),
                   ),
                 ],
               ),


             ],
           ),
         ),
         divider('Payment_method'.t),
         Spinner(names: ['احجز الآن ، ادفع لاحقاً ' ,'المحفظة' ,'البطاقات الائتمانية' ],
           onChange: (i){

           },) ,
         SizedBox(height: 20.h,),
         Padding(
           padding: EdgeInsets.symmetric(horizontal: 30.w),
           child: defaultButton(onPressed: () {


           }, text: 'reservation_confirmation'.t,),
         ),
       ]
       ,
     ),
   ) ;
 }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
      if(!isFirst){
        setState(() {
          isFirst = true ;
        });
        return false ;
      }
      return true ;
    },

      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: myAppBar('title'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10.h,),
              ItemPlanDetails() ,
              divider('travelers'.t) ,
              LayoutBuilder(builder: (context, constraints) {
                return AnimatedSize(
                  duration: Duration(milliseconds: 250),
                  vsync: this,
                  curve: Curves.easeInOutQuad,
                  child: AnimatedSwitcher(
                    duration:  Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(child: child, scale: animation);
                    },
                    child: isFirst? Container(
                      key: ValueKey<int>(0),
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyCardForm('Ahmed El-Zabout', (){

                          }) ,
                          SizedBox(height: 10.h,),
                          MyCardForm('المسافر 1 ( بالغ )', (){

                            To(context,TravelersDetailsAdd()) ;
                          }),
                          SizedBox(height: 20.h,) ,


                          defaultButton(onPressed: (){
                            setState(() {
                              isFirst = false ;
                            });
                          }, text: 'continue'.t),

                        ],
                      ),
                    ):BuildMyWidget2(),

                  ),
                );
              },) ,
           
              SizedBox(height: 20.h,),
            ],
          ),
        ),
      ),
    );
  }
}
