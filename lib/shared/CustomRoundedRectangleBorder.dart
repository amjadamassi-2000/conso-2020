import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRoundedRectangleBorder extends ShapeBorder {

  final double borderWidth;
  final int type ;
  final BorderRadius borderRadius;

  const CustomRoundedRectangleBorder({
    this.borderWidth: 1.0,
    this.type: 0,
    this.borderRadius: BorderRadius.zero,
  }) : assert(borderRadius != null);

  @override
  EdgeInsetsGeometry get dimensions {
    return new EdgeInsets.all(borderWidth);
  }

  @override
  ShapeBorder scale(double t) {
    return new CustomRoundedRectangleBorder(
      borderWidth: borderWidth * (t),
      borderRadius: borderRadius * (t),
    );
  }

  @override
  ShapeBorder lerpFrom(ShapeBorder a, double t) {
    assert(t != null);
    if (a is CustomRoundedRectangleBorder) {
      return new CustomRoundedRectangleBorder(
        borderWidth: lerpDouble(a.borderWidth, borderWidth, t),
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder lerpTo(ShapeBorder b, double t) {
    assert(t != null);
    if (b is CustomRoundedRectangleBorder) {
      return new CustomRoundedRectangleBorder(
        borderWidth: lerpDouble(borderWidth, b.borderWidth, t),
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  Path getInnerPath(Rect rect, { TextDirection textDirection }) {
    return new Path()
      ..addRRect(borderRadius.resolve(textDirection).toRRect(rect).deflate(
          borderWidth));
  }

  @override
  Path getOuterPath(Rect rect, { TextDirection textDirection }) {
    return new Path()
      ..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  void paint(Canvas canvas, Rect rect, { TextDirection textDirection }) {
    rect = rect.deflate(borderWidth / 2.0);

    Paint paint;
     RRect borderRect = borderRadius.resolve(textDirection).toRRect(rect);


    paint = new Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = borderWidth;
    Path path = Path();

    // Moves starting point to the center of the screen
    if(type==0){
      paint.color =  Colors.blue ;
      path.addRect(borderRect.outerRect);
      path.moveTo(borderRect.outerRect.right, borderRect.outerRect.top) ;
      path.lineTo(borderRect.outerRect.right, 30) ;
      path.lineTo(borderRect.outerRect.right+15, 20) ;
      path.lineTo(borderRect.outerRect.right, 10) ;
    }else{
      paint.color =  Colors.grey ;
      path.addRect(borderRect.outerRect);
      path.moveTo(borderRect.outerRect.left, borderRect.outerRect.top) ;
      path.lineTo(borderRect.outerRect.left, 30) ;
      path.lineTo(borderRect.outerRect.left-15, 20) ;
      path.lineTo(borderRect.outerRect.left, 10) ;
    }


    // path.lineTo(borderRect.left-borderRect.width,  borderRect.bottom );
    // path.lineTo(borderRect.width ,borderRect.bottom );
    // path.lineTo(borderRect.width , borderRect.top);
    // path.lineTo(borderRect.brRadiusY ,0);
    // path.lineTo(0, 0);
    canvas.drawPath(path, paint);
   //  canvas.drawRRect(borderRect, paint);
  }
}