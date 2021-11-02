import 'package:conso_customer/Dialogs/TutorialOverlay.dart';
import 'package:conso_customer/Dialogs/flight_dialog.dart';
import 'package:conso_customer/Dialogs/hotels_dialog.dart';
import 'package:conso_customer/items/item_popular_hotels.dart';
import 'package:conso_customer/modle/base_respons.dart';
import 'package:conso_customer/modle/User.dart';
import 'package:conso_customer/modle/offer.dart';
import 'package:conso_customer/screens/ServiceProvider/itemServiceProviderV2.dart';
import 'package:conso_customer/screens/ServiceProvider/service_notifier.dart';
import 'package:conso_customer/screens/ServiceProvider/service_providerScreen.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/AppExpansionTile.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/custom_navigate.dart';
import 'package:conso_customer/shared/network/remote/WebSarvice.dart';
import 'package:conso_customer/shared/network/remote/dio_helper.dart';
import 'package:conso_customer/shared/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'NavDrawer.dart';
import 'home_notifier.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _searchview = new TextEditingController();
  List filter = [
    'Top_Rating'.t,
    'Price_from_low_to_high'.t,
    'Price_from_high_to_low'.t,
    'Newer_Consultants'.t,
    'Only_Consultants_Available'.t
  ];
  bool isExpanded = false;
  final GlobalKey<AppExpansionTileState> expansionTile =  GlobalKey();
  HomeNotifier home;
  HomeNotifier homeWithListen;
   // API =======================
  Future getOffers;

  @override
  void initState() {
    super.initState();
    home = Provider.of<HomeNotifier>(context, listen: false);


    // API =======================
    getOffers = getListData(getAds,'data', fun: (json) {
    return Offer.fromJson(json);
    },);


  }



  void _showOverlay(BuildContext context) {
    Navigator.of(context).push(TutorialOverlay());
  }





  @override
  Widget build(BuildContext context) {
    homeWithListen = Provider.of<HomeNotifier>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar(home.name),
      endDrawer: NavDrawer(),
      body: ListView(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20.h),
              width: MediaQuery.of(context).size.width * 0.60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Row(
                    children: [
                      Expanded(
                          child: buildView('Hotels', 'Hotels'.t, () {
                        showHotelsDialog(context);
                        // _showOverlay(context);
                      })
                      ),

                      Expanded(
                          child: buildView('Flight', 'Flight'.t, () {
                        showFlightDialog(context);
                      })
                      ),
                    ],
                  ),



                  buildView('Bookadvisor', 'Book_advisor'.t, () {}),
                  // buildView()
                ],
              ),
            ),
          ),
          divider('Offers'.t),
          listAds(),

          divider('Popular_Hotels'.t),
          listPopularHotels(),

          divider('Top_destinations'.t),
          listTopDestinations(),

          divider('Consultants'.t, isShowBtn: true, onTap: () {
            CustomNavigate<ServiceNotifier>().navigateTo(
                context, ServiceProviderScreen(),
                create: (context) => ServiceNotifier());
          }),
          listConsultants(),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }

  // Offers ====================================================
  Widget listAds() => FutureBuilder(
    future:  getOffers,
    builder: (context, snapshot) {
      if(snapshot.hasData){
       List<dynamic> offers =snapshot.data ;

        return Container(
          height: 100.h,
          child: ListView.builder(
              itemCount: offers.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  clipBehavior: Clip.hardEdge,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: imageNet(
                      offers[index].image),
                );
              }),
        );
      }else{

      }
      return SpinKitFadingCube(
        color: defaultColor,
        size: 50.0,
      ) ;

    }
  );




  Widget buildView(icon, text, Function function) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: EdgeInsets.all(5.w),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(width: 1.w, color: defaultColor)),
        child: Column(
          children: [svgImage(icon), textBody(text, color: defaultColor)],
        ),
      ),
    );
  }

  Widget listPopularHotels() => Container(
        height: 150.h,
        child: ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: false,
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return ItemPopularHotels();
            }),
      );

  Widget listTopDestinations() => Container(
        height: 100.h,
        child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: boxShadow(),
                      borderRadius: BorderRadius.circular(10.r)),
                  width: 100.h,
                  child: Container(
                    child: Stack(
                      children: [
                        Positioned.fill(
                            child: imageNet(
                                'https://miro.medium.com/max/12000/1*PgIo7r6qQXem8BmWd-vksQ.jpeg')),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              colors: [
                                Colors.black87,
                                Colors.transparent,
                                Colors.transparent
                              ],
                              begin: AlignmentDirectional.bottomEnd,
                              end: AlignmentDirectional.topStart,
                            )),
                          ),
                        ),
                        PositionedDirectional(
                            bottom: 10.h, end: 10.h, child: textBody('جدة'))
                      ],
                    ),
                  ));
            }),
      );

  Widget listConsultants() => Container(
        height: 250.h,
        child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return itemServiceProvidersV2();
            }),
      );
}
