import 'package:conso_customer/screens/hotel_details.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/size_extension.dart';

class ItemPopularHotels extends StatefulWidget {
  const ItemPopularHotels() ;

  @override
  _ItemPopularHotelsState createState() => _ItemPopularHotelsState();
}

class _ItemPopularHotelsState extends State<ItemPopularHotels> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        To(context, HotelDetails()) ;
      },
      child: Container(
        height: 120.h,
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: boxShadow(),
              borderRadius: BorderRadius.circular(10.r)),
          width: MediaQuery.of(context).size.width * 0.90,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 45,
                  child: Container(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: imageNet(
                            'https://miro.medium.com/max/12000/1*PgIo7r6qQXem8BmWd-vksQ.jpeg',
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                                gradient:LinearGradient(
                                  colors: [Colors.black87 , Colors.transparent, Colors.transparent],
                                  begin: AlignmentDirectional.bottomEnd,
                                  end: AlignmentDirectional.topStart,
                                )
                            ),
                          ),
                        ) ,
                        PositionedDirectional(
                            bottom: 10.h,
                            end: 10.h,
                            child: textBody('456 ريال'))
                      ],
                    ),
                  )),
              SizedBox(
                width: 20.w,
              ),
              Flexible(
                flex: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textBody(
                        'فندق الريف الملز انترناشملز انترناشملز انترناشملز انترناشيونال',
                        color: defaultColor),
                    Row(
                      children: [
                        ratingBar(0),
                        textBody('[1650 تقييم]', color: defaultHint)
                      ],
                    ),
                    Row(
                      children: [
                        svgImage('mark'),
                        SizedBox(
                          width: 10.w,
                        ),
                        Flexible(
                            child: textDetails(
                                'فندق الريف الملز انترناشيونايف الملز انترناشيونايف الملز انترناشيونايف الملز انترناشيونايف الملز انترناشيونالفن ',
                                maxline: 1,
                                color: defaultColor)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
            ],
          )),
    );
  }
}
