import 'dart:async';
import 'dart:math';
import 'package:conso_customer/Dialogs/bottom_sheet_message.dart';
import 'package:conso_customer/screens/Home/HomeScreen.dart';
import 'package:conso_customer/screens/Home/home_notifier.dart';
import 'package:conso_customer/screens/adsScreen/ads_notifier.dart';
import 'package:conso_customer/screens/authScreen/login_screen.dart';
import 'package:conso_customer/screens/authScreen/change_password.dart';
import 'package:conso_customer/screens/authScreen/forgot_password.dart';
import 'package:conso_customer/screens/authScreen/restore_password.dart';
import 'package:conso_customer/screens/authScreen/sign_up_screen.dart';
import 'package:conso_customer/screens/authScreen/success_screen.dart';
import 'package:conso_customer/shared/Helpers.dart';
import 'package:conso_customer/shared/components/custom_navigate.dart';
import 'package:conso_customer/shared/storage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:conso_customer/screens/adsScreen/ads_screen.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/fcm/PushNotificationService.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'app_notifier.dart';
import 'shared/components/components.dart';
import 'package:flutter_screenutil/size_extension.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  initApp();

  //PushNotificationService().initialise() ;
  await GetStorage.init();
  //GetIt locator = GetIt.instance;
 // locator.registerLazySingleton(() => PushNotificationService());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AppNotifier()),
      ],
        child: EasyLocalization(
          path: 'assets/locales',
          supportedLocales: [Locale('ar', 'SA'), Locale('en', 'UK')],
        // child: DevicePreview(builder: (_) => MyApp()),
          child: MyApp(),
        ),

    ),
  );
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Offset _offset = Offset.zero;




  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor:defaultColor, // Color for Android
        statusBarBrightness:
        Brightness.light , // Dark == white status bar -- for IOS.
        statusBarIconBrightness: Brightness.light
    ));
    return ScreenUtilInit(
      builder: () {
        return  MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
            locale: Locale('ar') ,



            theme: ThemeData(
            appBarTheme: AppBarTheme(
              textTheme: TextTheme(headline6:TextStyle(color: Colors.white ,fontSize: 18, fontFamily: 'Cairo',fontWeight: FontWeight.w800 )  ),
              iconTheme: IconThemeData(color: Colors.white),
              brightness: Brightness.dark,
            ),
            scaffoldBackgroundColor: Colors.white ,
            primaryColorLight:defaultColor,
            fontFamily: 'Cairo',

            primaryColorDark:defaultColor ,
            primarySwatch: Colors.lightBlue,
            primaryColor:defaultColor,

            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),





          home:



          MaterialApp(

            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: Locale('ar') /*context.locale*/,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                textTheme: TextTheme(headline6:TextStyle(color: Colors.white ,fontSize: 18, fontFamily: 'Cairo',fontWeight: FontWeight.w800 )  ),
                iconTheme: IconThemeData(color: Colors.white),
                brightness: Brightness.dark,
              ),
              scaffoldBackgroundColor: Colors.white ,
              primaryColorLight:defaultColor,
              fontFamily: 'Cairo',

              primaryColorDark:defaultColor ,
              primarySwatch: Colors.lightBlue,
              primaryColor:defaultColor,

              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: SplashScreen(),
            builder: (context, child) {
              return Stack(
                children: [
                  child,
                  AnimatedPositioned(
                    left: _offset.dx,
                    top: _offset.dy,
                    duration: Duration(milliseconds: 200),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _offset = Offset((MediaQuery.of(context).size.width/2 )- 30.w, MediaQuery.of(context).size.height-50);
                        });
                        Future.delayed(Duration(milliseconds: 250),(){
                          Helpers.bottomSheet(context: context, child: BottomSheetMessages());
                        }
                        );
                      },

                      onPanUpdate: (d) {
                        print('d.delta.dx ${d.delta.dx}  d.delta.dy ${d.delta.dy}');
                        setState( () => _offset += Offset(d.delta.dx, d.delta.dy) );
                      },

                      child: Container(
                        height: 50.w,
                        width: 50.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightBlue,
                        ),
                        child: Center(
                            child: Icon(Icons.chat,color: Colors.white,)
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ) ;
      },
    );
  }
}

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  BuildContext context ;
  bool _showFrontSide;
  bool _flipXAxis;

  @override
  void initState() {
    super.initState();
    _showFrontSide = true;
    _flipXAxis = true;
    Timer(Duration(milliseconds:1500 , ) ,(){
      print("run Duration") ;
      _switchCard() ;
    });
    Timer(Duration(milliseconds:3000 , ) ,(){
      print("run Duration") ;
     // navigateAndFinish(context , HomeScreen() ,notifier: HomeNotifier()) ;
      if(getUser()!=null){
        CustomNavigate<HomeNotifier>().navigateAndFinish(context,  HomeScreen(), create: (_) =>HomeNotifier());
      }else{
        CustomNavigate<AdsNotifier>().navigateAndFinish(context,  AdsScreen(), create: (_) =>AdsNotifier());

      }

    //  CustomNavigate<HomeNotifier>().navigateAndFinish(context,  HomeScreen(), create: (context) =>HomeNotifier());
    });
    //print(Mypref.getUser().toJson().toString());

    // var initializationSettingsAndroid = new AndroidInitializationSettings('@mipmap/ic_launcher');
    // var initializationSettingsIOS = new IOSInitializationSettings();
    // var initializationSettings = new InitializationSettings(
    //     android: initializationSettingsAndroid,iOS:  initializationSettingsIOS);
    //
    // flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    // flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
    // getMessage();
    // settings();
    // startTime() ;

  }

  @override
  Widget build(BuildContext context) {
    this.context = context ;
    return Scaffold(
      backgroundColor: defaultColor,
      body:
      Center(
        child: Container(
            constraints: BoxConstraints.tight(Size.square(200.0)),
            child: _buildFlipAnimation()),
      ),
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
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      widget: SvgPicture.asset('assets/images/logo_ar.svg'),
      key: ValueKey(true),
      backgroundColor: Colors.blue,
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
      backgroundColor: Colors.blue.shade700,
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
       color: defaultColor,
      ),
      child: Center(
        child:widget,
      ),
    );}

  // void getMessage() async{
  //   String string = await _firebaseMessaging.getToken();
  //   print(string) ;
  //   Storage.setToken(string) ;
  //   _firebaseMessaging.configure(
  //       onMessage: (Map<String, dynamic> message) async {
  //         print('received message $message');
  //         showNotification(1234, '${message["notification"]["body"]}','${message["notification"]["body"]}');
  //         if(message["notification"]["data"]['msgType'].toString()=="0"){
  //           Mypref.removeUser() ;
  //           Mypref.setIsLogin(false);
  //           Get.offAll(login_screen());
  //         }else if(message["notification"]["data"]['msgType'].toString()=="3"){
  //           actionPost(WebService.get_user_info, {}).then((value){
  //             if(value!=null){
  //               User user = User.fromJson(value['user']);
  //               Mypref.setUser(user);
  //               Mypref.setUserToken(value['access_token']);
  //             }
  //           }) ;
  //         }
  //         // setState(() => _message = message["notification"]["body"]);
  //       }, onResume: (Map<String, dynamic> message) async {
  //     print('on resume $message');
  //     //  setState(() => _message = message["notification"]["body"]);
  //   }, onLaunch: (Map<String, dynamic> message) async {
  //     print('on launch $message');
  //     // setState(() => _message = message["notification"]["body"]);
  //   });
  //
  // }
  // Future settings() async {
  //   try {
  //     var response = await AppShared.getDio().get(
  //       WebService.get_setting,
  //       options: Options(
  //         headers: {
  //           'Accept-Language': Mypref.getlang(),
  //         },
  //       ),
  //     );
  //     print('usetfromSherd ${response.data.toString()}');
  //     if (response.data['status']) {
  //       Setting user = Setting.fromJson(response.data['settings']);
  //       Mypref.setSetting(user);
  //       // Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       //     builder: (BuildContext context) => MapSample()));
  //     }else{
  //       WebService.showDialogWithMessage(response.data['message']) ;
  //     }
  //   } on Exception catch (_) {
  //     // WebService.hideLoading() ;
  //     print('never reached');
  //   }
  //
  //
  //
  //
  //
  //   //Mypref.getUser().then((value) => print('usetFromBox ${value.toJson()}' ) );
  //
  //   // return user;
  // }
}
