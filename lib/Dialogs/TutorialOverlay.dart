import 'dart:async';
import 'dart:math';

import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TutorialOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.9);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;




  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return  Center(
      child: Logo(),
    );
  }



  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}


class Logo extends StatefulWidget {





  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  bool _showFrontSide = false;
  bool _flipXAxis = true;
  BuildContext context ;
  Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    timer= Timer.periodic(Duration(milliseconds:1000 , ), (timer) {
      _switchCard() ;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel() ;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          constraints: BoxConstraints.tight(Size.square(200.0)),
          child: _buildFlipAnimation()),
    );
  }





  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: _switchCard,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget, ...list]),
        child: _showFrontSide ? _buildFront() : _buildRear(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value = isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        print('$value  $tilt') ;

        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          child:value <= 3.141592653589793/2? widget :Container(),
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      widget: SvgPicture.asset('assets/images/logo_ar.svg'),
      key: ValueKey(true),
      backgroundColor: Colors.black26,
      faceName: "Front",
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          child: FlutterLogo(),
        ),
      ),
    );
  }

  Widget _buildRear() {
    return __buildLayout(
      widget: SvgPicture.asset('assets/images/logo_en.svg'),
      key: ValueKey(false),
    //  backgroundColor: Colors.blue.shade700,
      faceName: "Rear",
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          child: Center(child: Text("Flutter", style: TextStyle(fontSize: 50.0))),
        ),
      ),
    );
  }

  Widget __buildLayout({Key key, Widget child, String faceName, Color backgroundColor ,Widget widget}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
      //  color: Colors.black.withOpacity(0.8),
      ),
      child: Center(
        child:widget,
      ),
    );}


}

// Example application:


