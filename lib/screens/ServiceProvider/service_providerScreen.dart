
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/AppExpansionTile.dart';
import 'package:conso_customer/shared/components/components.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conso_customer/extensions_lang.dart';

import 'service_notifier.dart';
import 'itemServiceProvider.dart';
class ServiceProviderScreen extends StatefulWidget {
  @override
  _ServiceProviderScreenState createState() => _ServiceProviderScreenState();
}

class _ServiceProviderScreenState extends State<ServiceProviderScreen> {
  var _searchview = new TextEditingController();
  List filter = ['Top_Rating'.t , 'Price_from_low_to_high'.t, 'Price_from_high_to_low'.t, 'Newer_Consultants'.t, 'Only_Consultants_Available'.t] ;
  bool isExpanded = false;
  final GlobalKey<AppExpansionTileState> expansionTile = new GlobalKey();
  ServiceNotifier home  ;
  ServiceNotifier homeWithListen  ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    home = Provider.of<ServiceNotifier>(context,listen: false) ;
  }
  @override
  Widget build(BuildContext context) {
    homeWithListen = Provider.of<ServiceNotifier>(context) ;
    return Scaffold(
      appBar: myAppBar(home.name),
      body: ListView(
        children: [
          _createSearchView(),
          AppExpansionTile(
            key: expansionTile,
            trailing: Icon(
              Icons.filter_alt_outlined,
              color: defaultHint,
            ),


            leading:Text(
              homeWithListen.selectedFilter,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),

            backgroundColor: Colors.yellow[50],

            // maintainState:isExpanded ,
            initiallyExpanded:isExpanded ,
            // expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...filter.map((e) => InkWell(
                onTap: (){
                  home.setSelectedFilter(e) ;
                   expansionTile.currentState.collapse();

                },
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  width: double.infinity,
                    child: Text(e)),
              )).toList()
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     'Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffee species.',
              //     style: TextStyle(fontSize: 15),
              //     maxLines: 3,
              //     softWrap: true,
              //     textAlign: TextAlign.start,
              //   ),
              // ),

            ],
          ),

       /* homeWithListen.isLauding ? CircularProgressIndicator() :*/
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            return itemServiceProviders() ;
          })


        ],
      ),

    );
  }

  Widget _createSearchView() {
    return Container(
      // decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: TextField(
        controller: _searchview,
        decoration: InputDecoration(
          fillColor: defaultHint3,
          filled: true,
          border: InputBorder.none,
          hintText: "Search",
          prefixIcon: Icon(Icons.search, color: defaultColor),
          hintStyle: TextStyle(color: defaultColor, fontSize: 20.sp),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
