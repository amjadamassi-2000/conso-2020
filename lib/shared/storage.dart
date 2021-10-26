import 'package:get_storage/get_storage.dart';

class MyStorage {
  // static void setLang(String lang) {
  //   GetStorage().write("lang", lang);
  // }
  //
  // static void setToken(String token) {
  //   GetStorage().write("token", token);
  // }
  //
  static String getToken() {
    return GetStorage().read("token");
  }
  //
  // static void setUserToken(String token) {
  //   GetStorage().write("user_token", token);
  // }
  //
  static String getUserToken() {
    return GetStorage().read("user_token");
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
  // static void setUser(User user) {
  //   GetStorage().write("user", user.toJson());
  //   // GetStorage().writeInMemory("user", user);
  // }
  //
  static String getlang() {
    return GetStorage().hasData("lang")
        ? GetStorage().read("lang")
        :'ar';
  }
  //
  // static User getUser() {
  //   return User.fromJson(GetStorage().read("user"));
  //   return GetStorage().read<User>("user");
  // }
}
