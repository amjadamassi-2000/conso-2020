import 'dart:developer';
import 'package:conso_customer/modle/base_respons.dart';
import 'package:conso_customer/modle/offer.dart';
import 'package:conso_customer/shared/network/remote/WebSarvice.dart';
import 'package:conso_customer/shared/storage.dart';
import 'package:dio/dio.dart';

enum DioType {
  post , get
}
Dio dio;
DioHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: domain,
        headers: {
          'Accept':'application/json',
        },
      ),
    );
  }

   Future<Response> getResponse(String path,{Map<String,dynamic> data ,DioType dioType = DioType.post}) async {
    String token = getUserToken();

      dio.options.headers = {
        'Authorization' : 'Bearer $token',
        "fcmToken": 'fcm_token',
        'Accept': 'application/json',
        'Accept-Language':'en',
      };


    try {
      if(dioType==DioType.post){
        Response response = await dio.post(
          path,
          data:data!=null?  FormData.fromMap(data):[],
        );
        log(response.toString()) ;
        return response;
      }
      else{
         Response response = await dio.get(
          path,
        );
         log(response.toString());

         return response ;
      }
    } on DioError catch (e) {
      log(e.response.toString());
      return null ;
    }

  }


Future getData(String url , String type) async {
  //await WebService.showLoading() ;
  try{
     Response response = await dio.get(
      url,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${getUserToken()}',
          'Accept': 'application/json',
          'Accept-Language': getlang(),
        },
      ),
    );

    if (response.data['status']) {
      // List<Address> shifts=  List<Address>.from(response.data['shifts'].map((x) => Shift.fromJson(x)));
      //  await Future.delayed(Duration(milliseconds: 500), () {});
      return response.data[type];
    }else{
      //WebService.showDialogWithMessage(response.data['message']) ;
      return "";
    }
  }  on DioError catch (e) {
    print(e.error.toString());
  //  print(e.request.toString());
    print(e.message.toString());
    print(e.response.toString());
    print(e.type.toString());

    throw '';
  }
}



Future getListData(String url,String key, {dynamic Function(Map<String, dynamic> json) fun}) async {
  try {
    Response response = await getResponse(url, dioType:DioType.get,);
    var res = BaseResponse.fromJson(response.data , keyArray: key , fun: fun);
    if (res.status) {
      return res.arrayObject ;
    } else {
    //  showDialogWithMessage(context, res.message);
    }
  } catch (error) {
  //  stopLoading();
    print(error);
    //showDialogWithMessage(context,error.message);
  }
}