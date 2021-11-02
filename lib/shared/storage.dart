import 'package:conso_customer/modle/User.dart';
import 'package:get_storage/get_storage.dart';


  // static void setLang(String lang) {
  //   GetStorage().write("lang", lang);
  // }
  //
  // static void setToken(String token) {
  //   GetStorage().write("token", token);
  // }
  //

   String getToken() {
    return GetStorage().read("token");
  }



  //
  // static void setUserToken(String token) {
  //   GetStorage().write("user_token", token);
  // }
  //




   String getUserToken() {
    return getUser()!=null ? getUser().accessToken : '';
  }








  //
  // static void setSetting(Setting settings) {
  //   GetStorage().write("settings", settings.toJson());
  // }
  //
  // static void setIsLogin(bool isLogin) {
  //   GetStorage().write("isLogin", isLogin);
  // }
  //
  // static bool IsLogin() {
  //   return GetStorage().hasData("isLogin")
  //       ? GetStorage().read("isLogin")
  //       : false;
  // }
  //
  // static Setting getSettings() {
  //   return Setting.fromJson(GetStorage().read("settings"));
  // }
  //
  // static void removeUser() {
  //   GetStorage().remove("user");
  // }
  //


    void setUser(User user) {
     GetStorage().write("user", user.toJson());
   }



  //
   String getlang() {
    return GetStorage().hasData("lang")
        ? GetStorage().read("lang")
        :'ar';
  }
  //
    User getUser() {
     try{
       return User.fromJson(GetStorage().read("user"));
     }catch(e){
       return null ;
     }
}




removeUser(){
  GetStorage().remove("user");
}