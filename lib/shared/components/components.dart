import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:conso_customer/shared/network/remote/dio_helper.dart';
import 'package:conso_customer/shared/styles/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:provider/provider.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_navigate.dart';

SharedPreferences preferences;

void initApp() {
  DioHelper();
}

Future<void> initPref() async {
  preferences = await SharedPreferences.getInstance();
}

Future<bool> saveToken(String token) => preferences.setString('token', token);

Future<bool> removeToken() => preferences.remove('token');

String getToken() => preferences.getString('token');

List<BoxShadow> boxShadow ({int color=200}) => [
      BoxShadow(color: Colors.grey[color], offset: Offset(0, 0), blurRadius: 6),
    ];

get boxDecoration => BoxDecoration(

    borderRadius: BorderRadius.circular(
       10.r,
    ),
    border: Border.all(color: defaultBorder,width: 1),
   );







Widget buildCloseButton(Function function)=>  InkWell(
  onTap:function ,
    child: Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Icon(Icons.close,color: defaultColor,),
    )) ;



Widget buildSettingItem({@required title, @required function}) => Column(
      children: [
        SizedBox(
          height: 1.0,
        ),
        ListTile(
          tileColor: Colors.white,
          onTap: function,
          title: Text(
            title.toString(),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14.0,
          ),
        ),
      ],
    );

Widget customCheck(bool, Function onChange , {Color color = Colors.white}) => InkWell(
      onTap: onChange,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1,
              color: color,
            )),
        child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Visibility(
              visible: bool,
              child: Icon(
                Icons.check,
                size: 15.0,
                color: color,
              ),
              replacement: Icon(
                Icons.check,
                size: 15.0,
                color: Colors.transparent,
              ),
            )),
      ),
    );

Widget defaultTextForm(
  TextEditingController controller,
  String hint, {
  Widget icon,
  bool isPassword = false,
  Function validator,
  String defaultValidator,
  TextInputType type = TextInputType.text,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      //  color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
            border: InputBorder.none,
            hintText: hint,

            hintStyle: defaultTextStyleHint(),
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon ?? Container(),
                SizedBox(
                  width: 10.w,
                )
              ],
            ),
            //icon:icon ,
            prefixIconConstraints:
                BoxConstraints(minWidth: 30.w, minHeight: 30.w)),
        validator: validator ??
            (str) {
              return defaultValidator;
            },
        keyboardType: type,
      ),
    );


Widget defaultTextFormDialog(
    TextEditingController controller,
    String hint, {
      Function onTap ,
      Widget icon,
      bool isPassword = false,
      bool isBorder = false ,
      Function validator,
      String defaultValidator,
      TextAlign textAlign =TextAlign.start,
      TextInputType type = TextInputType.text,
      size
    }) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        border:isBorder? Border.all(color: defaultBorder):null
        //  color: Colors.white,
      ),
      //padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: TextFormField(
        onTap:onTap ,
        showCursor:onTap==null,
        readOnly: onTap!=null ,
        controller: controller,
        obscureText: isPassword,
        textAlign:textAlign ,

        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: defaultTextStyleHintDialog(size: size),
            prefixIcon:icon!=null? Padding(
              padding:  EdgeInsetsDirectional.only(start: 10.w ,end: 5.w),
              child: icon,
            ): null ,
            // prefixIcon: Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     // icon ?? Container(),
            //     // SizedBox(
            //     //   width: 10.w,
            //     // )
            //   ],
            // ),
            //icon:icon ,
            prefixIconConstraints:icon!=null? BoxConstraints(minWidth: 30.w, minHeight: 25.w,):null
        ),
        validator: validator ??
                (str) {
              return defaultValidator;
            },
        keyboardType: type,
      ),
    );


Widget textBodyMedium(String text,
        {isBold = false,
        double fontSize,
        Color color = Colors.white,
        FontWeight fontWeight ,
        TextAlign textAlign = TextAlign.center}) =>
    Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 22.sp,
        color: color,
        fontWeight: fontWeight==null? isBold ? FontWeight.w900 : FontWeight.w600:fontWeight,
      ),
    );

Widget textBodyBigSkinny(String text,
    {isBold = false,
      double fontSize,
      Color color = defaultColor,
      TextAlign textAlign = TextAlign.center}) =>
    textBodyMedium(text,color:color ,fontWeight: FontWeight.w600, fontSize: fontSize ?? 20.sp ,isBold: isBold  ,textAlign: textAlign );

Widget textBody(String text,
        {isBold = false,
        Color color = Colors.white,
          double fontSize ,
        TextAlign textAlign = TextAlign.start}) =>
    Text(
      text,
      textAlign: textAlign,
      /*overflow: TextOverflow.ellipsis,*/
      style: TextStyle(
        fontSize:fontSize?? 15.sp,
        color: color,
        fontWeight: isBold ? FontWeight.w900 : FontWeight.w600,
      ),
    );

Widget textDetails(String text,
        {isBold = false,
        int maxline = 2,
        isLimit = true  ,
        Color color = Colors.white,
          double fontSize,
        TextAlign textAlign = TextAlign.center}) =>
    Text(
      text,
      textAlign: textAlign,
      maxLines:isLimit?maxline :null ,
      softWrap: true,
      overflow:isLimit?TextOverflow.ellipsis :null ,
      style: TextStyle(
        fontSize: fontSize??12.sp,
        color: color,
        fontWeight: isBold ? FontWeight.w900 : FontWeight.w600,
        textBaseline: TextBaseline.alphabetic,
      ),
    );

Widget ratingBar(double initialRating, {Function onRatingUpdate ,double itemSize = 18 ,Function customDesign}) =>
    RatingBar.builder(
      initialRating: initialRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      //itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
      itemSize: itemSize,
      itemBuilder: (context, i) =>customDesign ==null? Icon(
        Icons.star,
        color: defaultColor,
      ):customDesign(i),
      onRatingUpdate: onRatingUpdate,
    );

Widget captionText(String text) => Text(
      text,
      style: TextStyle(
        fontSize: 16.0,
      ),
    );

Widget detailsText(String text) => Text(
      text,
      style: TextStyle(
        fontSize: 20.sp,
      ),
    );

Future To(BuildContext context, Widget widget) async {
  return await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => widget));
}

void buildProgress({
  context,
  text,
  bool error = false,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (!error) CircularProgressIndicator(),
                if (!error)
                  SizedBox(
                    width: 20.0,
                  ),
                Expanded(
                  child: Text(
                    text,
                  ),
                ),
              ],
            ),
            if (error)
              SizedBox(
                height: 20.0,
              ),
            if (error)
              defaultButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'cancel',
              )
          ],
        ),
      ),
    );

Widget svgImage(
  icon, {
  Color color,
  double size,
  double width,
}) =>
    SvgPicture.asset(
      'assets/images/$icon.svg',
      color: color,
      height: size,
      width:width?? size,

    );

Widget myAppBar(title , {actions}) => AppBar(
      centerTitle: true,
      actions: actions,
      title: Text(
        title,
        style: defaultTextStyleTitle(),
      ),
    );

Widget createSearchView(TextEditingController controller) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(width: 1.0 ,color: defaultHint) ),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              // fillColor: defaultHint3,
              // filled: true,
              border: InputBorder.none,
              hintText: 'hintSearch'.t,

              /*suffixIcon: Icon(Icons.search, color: defaultColor)*/
              hintStyle: TextStyle(color: defaultHint, fontSize: 15.sp,),
            ),
            textAlign: TextAlign.start,
          ),
        ),
        svgImage('mark' , size: 25.h)
      ],
    ),
  );
}

Widget imageNet(String url)=>  CachedNetworkImage(imageUrl: url,
  placeholder: (context, url) => SpinKitFadingCube(
    color: defaultColor,
    size: 50.0,
  ),
  fit:BoxFit.cover ,);
Widget imageCircle(image, {double radius, bool isOnLine = true ,}) {

 double size= radius !=null? radius*2:null ;
 double sizePoint= radius !=null? radius/2:null ;
  return Container(
    child: Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          maxRadius: radius ?? 30.r,
          child:ClipOval(
              clipBehavior: Clip.hardEdge,
              child: CachedNetworkImage(imageUrl: image,
                  height:size?? 60.r,
                  width:size?? 60.r,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SpinKitDoubleBounce(
                    color: defaultColor,
                    size: 50.0,
                  )) ,
          /*backgroundImage: NetworkImage(
              *//* history.driver!=null? history.driver.avatar:*//*
              Image,),*/
          )),
        PositionedDirectional(
          bottom: 0,
          end: 0,
          child: Container(
            height: sizePoint??15.w,
            width: sizePoint??15.w,
            decoration: BoxDecoration(
              //  borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white, width: 2),
              color: isOnLine ? Colors.green : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    ),
  );
}

void showToast({
  @required text,
  @required error,
}) =>
    Fluttertoast.showToast(
      msg: text.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: error ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );

Widget divider(text ,{bool isShowBtn = false ,Function onTap}) => Container(
  margin: EdgeInsets.symmetric(vertical: 10.h),
  padding: EdgeInsets.symmetric(vertical: 10.h),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsetsDirectional.only(start: 20.w , end: 10.w),
        child: Row(
          children: [
            textBody(text, color: defaultHint),
            Spacer(),
            Visibility(
                visible: isShowBtn,
                child: InkWell(
                    onTap:onTap ,
                    child: textBody('view_all'.t, color: defaultColor))),
          ],
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Divider(
        height: 1.h,
        //  color: defaultHint,
        thickness: 1,
      ),
    ],
  ),
);

Widget buildRowSearch({Function onFilter ,Function onHelp ,Function onMap , }){
  return  Row(
    mainAxisSize: MainAxisSize.max,
    children: [
      Expanded(
        child: defaultButton(
          // fontSize: 20.sp,
            isShadow: false,
            isExpanded: false,
            toUpper: false,
            isFittedText: true,
            iconEnd: true,
            icon: svgImage('funnel',color: Colors.white),
            onPressed:onFilter,
            text:'filter'.t ,
            height: 40.h),
      ),
      SizedBox(width: 10.w,),
      Expanded(
        child: defaultButton(
          // fontSize: 20.sp,
            isShadow: false,
            isExpanded: false,
            toUpper: false,
            iconEnd: true,
            isFittedText: true,
            onPressed:onHelp,
            icon: svgImage('help',color: Colors.white),
            text:'help'.t ,
            height: 40.h),
      ),
      SizedBox(width: 10.w,),
      Expanded(
        child: defaultButton(
          // fontSize: 20.sp,
            isShadow: false,
            isExpanded: false,
            toUpper: false,
            isFittedText: true,
            iconEnd: true,
            onPressed:onMap,
            icon: svgImage('map',color: Colors.white),
            text:'map'.t ,
            height: 40.h),
      ),
    ],
  ) ;
}






class FlutterSliderCustom extends StatefulWidget {
  Function(int handlerIndex, dynamic lowerValue, dynamic upperValue) onDragging ;

   FlutterSliderCustom({Key key, this.onDragging}) : super(key: key);

  @override
  _FlutterSliderCustomState createState() => _FlutterSliderCustomState();
}

class _FlutterSliderCustomState extends State<FlutterSliderCustom> {
  double _lowerValue = 50;
  double _upperValue = 180;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100.h,
      child: FlutterSlider(
        values: [_lowerValue, _upperValue],
        max: 200,
        min: 50,

        maximumDistance: 300,
        rangeSlider: true,
        rtl: true,
        handlerHeight: 20.w,
        handlerWidth: 20.w,
        rightHandler: getThumb,
        handler: getThumb,

        tooltip: FlutterSliderTooltip(
          alwaysShowTooltip: true,


        ),
        handlerAnimation: FlutterSliderHandlerAnimation(
            curve: Curves.elasticOut,
            reverseCurve: null,
            duration: Duration(milliseconds: 700),
            scale: 1.4),
        onDragging: (handlerIndex, lowerValue, upperValue) {
          _lowerValue = lowerValue;
          _upperValue = upperValue;
          widget.onDragging(handlerIndex,lowerValue,upperValue) ;
          setState(() {});
        },
      ),
    );
  }


  FlutterSliderHandler get getThumb => FlutterSliderHandler(
    decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(50)
    ),
    child: Icon(
      Icons.circle,
      color: Colors.white,
      size: 18,
    ),
  );
}



/*
Widget defaultButton({
  Color background = defaultColor,
  Color textColor = Colors.white,
  double fontSize,
  double radius,
  Widget icon,
  double height,
  bool isExpanded = true,
  @required Function onPressed,
  @required String text,
  bool isBorder = false,
  bool isShadow = true,
  bool toUpper = true,
}) => Container(
      width: isExpanded ? double.infinity : null,
      height: height ?? 50.h,
      decoration: BoxDecoration(
          color: isBorder ? Colors.white : background,
          borderRadius: BorderRadius.circular(
            radius ?? 10.r,
          ),
          border: isBorder ? Border.all(color: background) : null,
          boxShadow:isShadow? [
             BoxShadow(color: Colors.black38, offset: Offset(2, 2), blurRadius: 2),
          ]:null
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation:MaterialStateProperty.all<double>(0) ,
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Colors.white.withOpacity(0.20);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.white.withOpacity(0.20);
              return null; // Defer to the widget's default.
            },
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null ? icon : Container(),
            icon != null
                ? SizedBox(
                    width: 10.w,
                  )
                : Container(),
            Text(
              toUpper ? text.toUpperCase() : text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize ?? 15.sp,
                color: isBorder ? background :textColor ,
              ),
            ),
          ],
        ),
      ),
    );
*/
