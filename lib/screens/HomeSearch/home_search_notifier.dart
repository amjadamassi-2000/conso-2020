import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
class HomeSearchNotifier with ChangeNotifier {

  String name  = 'Domestic_Tourism'.t ;
  String selectedFilter = 'Top_Rated_Specialists'.t ;

  bool isLauding= false ;

  setIsLauding(bool isLod){
    isLauding = isLod ;
    notifyListeners() ;
  }
    setSelectedFilter(value){
    selectedFilter =  value.toString() ;
    notifyListeners() ;
  }
}