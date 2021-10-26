import 'package:conso_customer/screens/adsScreen/ads_notifier.dart';
import 'package:conso_customer/screens/adsScreen/slide_item.dart';
import 'package:conso_customer/screens/authScreen/login_screen.dart';
import 'package:conso_customer/shared/Helpers.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:conso_customer/extensions_lang.dart';


class AdsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdsNotifier(),
      builder: (context, child) {
        return  Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Stack(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: <Widget>[
                            PageView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: context.read<AdsNotifier>().pageController,
                              onPageChanged: context.watch<AdsNotifier>().onPageChanged,
                              itemCount: context.watch<AdsNotifier>().slideList.length,
                              itemBuilder: (ctx, i) => SlideItem(i),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PositionedDirectional(
                  bottom: 10 ,
                  end: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CirclePageIndicator(
                      itemCount: context.watch<AdsNotifier>().slideList.length,
                      currentPageNotifier: context.watch<AdsNotifier>().currentPageNotifier,
                      selectedDotColor: defaultColor,
                      dotColor: Colors.grey,
                      borderColor:defaultColor ,
                      borderWidth: 1,

                    ),
                  )) ,
              PositionedDirectional(
                  top: 10 ,
                  start: 10,
                  child: InkWell(
                    onTap: (){
                     // Helpers.bottomSheet(context: context, child:Container(height: 200 ,width: 500,) /*BottomSheetMessages()*/);

                      To(context, LoginScreen()) ;
                    },
                      child: Text('late'.t,style: defaultTextStyleWithShadow(),)),),
              PositionedDirectional(
                  bottom: 10 ,
                  start: 10,
                  child: Text('next'.t,style: defaultTextStyleWithShadow())),
            ],
          ),
        ) ;
      },

    );
  }

}
