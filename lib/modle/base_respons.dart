// To parse this JSON data, do
//
//     final baseRespons = baseResponsFromJson(jsonString);

import 'dart:convert';

//BaseRespons baseResponsFromJson(String str) => BaseRespons.fromJson(json.decode(str));

//String baseResponsToJson(BaseResponse data) => json.encode(data.toJson());

class BaseResponse {
    BaseResponse({
        this.status,
        this.code,
        this.message,
        this.object,
        this.arrayObject,
    });

    bool status;
    int code;
    String message;
    dynamic object;
    List<dynamic> arrayObject;

    factory BaseResponse.fromJson( Map<String, dynamic> json , {String keyObject='' ,keyArray = '', dynamic Function(Map<String, dynamic> json) fun }) => BaseResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        object: json[keyObject]!=null? fun(json[keyObject]):null,
        arrayObject: json[keyArray]!=null?List<dynamic>.from(json[keyArray].map((x) =>fun(x) )):null,
    );

//    Map<String, dynamic> toJson() => {
//        "status": status,
//        "code": code,
//        "message": message,
//    };
}
