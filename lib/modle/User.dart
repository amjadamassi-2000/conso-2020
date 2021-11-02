// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.mobile,
        this.type,
        this.gender,
        this.dateOfBirth,
        this.countryId,
        this.avatar,
        this.pastExperience,
        this.chatAvailable,
        this.chatPrice,
        this.callAvailable,
        this.callPrice,
        this.ratingAverage,
        this.ratingCount,
        this.notificationStatus,
        this.status,
        this.accessToken,
    });

    int id;
    String firstName;
    String lastName;
    String email;
    String mobile;
    String type;
    dynamic gender;
    dynamic dateOfBirth;
    dynamic countryId;
    String avatar;
    dynamic pastExperience;
    String chatAvailable;
    dynamic chatPrice;
    String callAvailable;
    dynamic callPrice;
    String ratingAverage;
    String ratingCount;
    String notificationStatus;
    String status;
    String accessToken;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        mobile: json["mobile"],
        type: json["type"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        countryId: json["country_id"],
        avatar: json["avatar"],
        pastExperience: json["past_experience"],
        chatAvailable: json["chat_available"],
        chatPrice: json["chat_price"],
        callAvailable: json["call_available"],
        callPrice: json["call_price"],
        ratingAverage: json["rating_average"],
        ratingCount: json["rating_count"],
        notificationStatus: json["notification_status"],
        status: json["status"],
        accessToken: json["access_token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile": mobile,
        "type": type,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "country_id": countryId,
        "avatar": avatar,
        "past_experience": pastExperience,
        "chat_available": chatAvailable,
        "chat_price": chatPrice,
        "call_available": callAvailable,
        "call_price": callPrice,
        "rating_average": ratingAverage,
        "rating_count": ratingCount,
        "notification_status": notificationStatus,
        "status": status,
        "access_token": accessToken,
    };
}
