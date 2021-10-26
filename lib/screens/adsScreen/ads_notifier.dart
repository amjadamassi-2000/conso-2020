import 'package:flutter/material.dart';

class AdsNotifier with ChangeNotifier {


  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  AdsNotifier();
  final currentPageNotifier = ValueNotifier<int>(0);
  List<String> slideList = ['ddd' ,'dsdsd'];
  onPageChanged(int index) {

    currentPage = index;
    currentPageNotifier.value = index ;
  }

}