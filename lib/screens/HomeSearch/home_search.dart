import 'package:conso_customer/items/item_plane.dart';
import 'package:conso_customer/items/item_popular_hotels.dart';
import 'package:conso_customer/screens/HomeSearch/NavDrawerHotel.dart';
import 'package:conso_customer/screens/HomeSearch/NavDrawerPlan.dart';
import 'package:conso_customer/screens/HomeSearch/home_search_notifier.dart';
import 'package:conso_customer/screens/adsScreen/ads_notifier.dart';
import 'package:conso_customer/screens/adsScreen/slide_item.dart';
import 'package:conso_customer/screens/offer_details.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/ScrollColumnExpandable.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/default_button.dart';
import 'package:conso_customer/shared/pinCodeCustom/pin_code_fields.dart';
import 'package:conso_customer/shared/pinCodeCustom/pin_theme.dart';
import 'package:conso_customer/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

import 'package:provider/provider.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/size_extension.dart';

import '../../app_notifier.dart';

class HomeSearch extends StatefulWidget {
  String title ;
  bool isPlan ;

  HomeSearch({this.title ,this.isPlan = true});

  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var _searchview = new TextEditingController();

  HomeSearchNotifier homeSearchNotifier ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeSearchNotifier = Provider.of<HomeSearchNotifier>(context,listen: false) ;

  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    homeSearchNotifier = Provider.of<HomeSearchNotifier>(context) ;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar:AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
         leading: BackButton(onPressed: (){
           Navigator.pop(context) ;
         },),
         actions: [
          Center(child: Padding(
            padding:  EdgeInsetsDirectional.only(end: 15.w),
            child: textBody('59 نتيجة'),
          )) ,
        ],
        title: Text(widget.title??'',
          style: defaultTextStyleTitle(),
        ),
      ),
      drawer:widget.isPlan? NavDrawerSearchPlan():NavDrawerSearchHotel(),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(height: 15.h,) ,
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: createSearchView(_searchview),
              ),
              SizedBox(height: 15.h,) ,
             widget.isPlan? buildListPlan() :buildListHotel(),
            ],
          ),

          Positioned(
            bottom: 15.h,
            left: 15.h,
            right: 15.h,
            child: buildRowSearch(onFilter: (){
              _key.currentState.openDrawer() ;
            }),
          ),

        ],
      ),
    );
  }
  Widget buildListHotel(){
   return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return InkWell(
              onTap: (){
                To(context, OfferDetails()) ;
              },
              child: ItemPopularHotels());
        });
  }
  Widget buildListPlan(){
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return InkWell(
              onTap: (){
                To(context, OfferDetails()) ;
              },
              child: ItemPlan());
        });
  }
}
