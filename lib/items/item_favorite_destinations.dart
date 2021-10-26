import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/size_extension.dart';

class ItemFavoriteDestinations extends StatefulWidget {
  const ItemFavoriteDestinations() ;

  @override
  _ItemFavoriteDestinationsState createState() => _ItemFavoriteDestinationsState();
}

class _ItemFavoriteDestinationsState extends State<ItemFavoriteDestinations> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        clipBehavior: Clip.hardEdge,

        height: 120.h,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: boxShadow(),
            borderRadius: BorderRadius.circular(10.r)),
        width: MediaQuery.of(context).size.width * 0.90,
        child: Row(
          children: [
            Expanded(
                flex: 45,
                child: Container(
                  height: double.infinity,
                  child: imageNet(
                    'https://www.turkpress.co/sites/default/files/styles/420x237/public/field/image/59_b.jpg?itok=2InLpU15',
                  ),
                )),
            SizedBox(
              width: 20.w,
            ),
            Flexible(
              flex: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  textBody('فندق الريف الملز انترناشملز انترناشملز انترناشملز انترناشيونال',
                      color: defaultColor),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      svgImage('mark'),
                      SizedBox(
                        width: 10.w,
                      ),
                      Flexible(
                          child: textDetails(
                              'فندق الريف الملز انترناشيونايف الملز انترناشيونايف الملز انترناشيونايف الملز انترناشيونايف الملز انترناشيونالفن ',
                              maxline: 1,
                              color: defaultColor ,textAlign: TextAlign.start)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ));
  }
}
