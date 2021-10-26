import 'package:conso_customer/items/itemCount.dart';
import 'package:conso_customer/items/itemRoom.dart';
import 'package:conso_customer/items/item_favorite_destinations.dart';
import 'package:conso_customer/modle/travelers.dart';
import 'package:conso_customer/screens/ServiceProvider/itemServiceProvider.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '';

class SelectDestination extends StatefulWidget {
  @override
  _SelectDestinationState createState() => _SelectDestinationState();
}

class _SelectDestinationState extends State<SelectDestination> {
  var _searchview = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
   //     padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 15.w, right: 15.w),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 15.w, right: 15.w) ,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: buildCloseButton(() {
                         Navigator.of(context).pop();
                        },
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: textBodyBigSkinny('Select_rooms_guests'.t, color: defaultColor)),
                  SizedBox(
                    height: 20.h,
                  ),
                  createSearchView(_searchview)


                ],
              ),
            ),
            SizedBox(height: 20.h,) ,
            Divider(color: defaultHint,height: 2,thickness: 2,) ,
            SizedBox(height: 20.h,) ,
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  return ItemFavoriteDestinations() ;
                }) ,
          ],
        ),
      ),
    );
  }

}
