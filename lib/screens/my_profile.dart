import 'dart:io';

import 'package:conso_customer/Dialogs/change_password.dart';
import 'package:conso_customer/modle/User.dart';
import 'package:conso_customer/modle/base_respons.dart';
import 'package:conso_customer/screens/authScreen/login_screen.dart';
import 'package:conso_customer/screens/edit_my_profile.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/network/remote/WebSarvice.dart';
import 'package:conso_customer/shared/network/remote/dio_helper.dart';
import 'package:conso_customer/shared/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  User user = getUser();
  File _pickedImage;




  @override
  void initState() {
    super.initState() ;
    user = getUser() ;
  }



  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    sendUserImageProfile();
  }

  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }


  sendUserImageProfile() async {
    try {
      String fileName = _pickedImage.path.split('/').last;
      Response response = await getResponse(userImageProfile, data: {
        'avatar' :  await MultipartFile.fromFile(_pickedImage.path,filename: fileName),

      });
      var res = BaseResponse.fromJson(response.data,
        keyObject: 'user',
        fun: (json) {
          return User.fromJson(json) ;
        },
      );

      if (res.status) {
        setUser(res.object) ;
      } else {
        showDialogWithMessage(context, res.message);
      }
    } catch (error) {
      print(error);
      showDialogWithMessage(context,"Something went wrong..!");
    }
  }










  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('MyProfile'.t, actions: [
        IconButton(
            onPressed: () async {
             await To(context, EditMyProfile());
             setState(() {
               user = getUser();
             });
            },
            icon: svgImage('pen', color: Colors.white))
      ]),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: ClipOval(
                            child: user.avatar == null
                                ? Container(
                                    height: 120.w,
                                    width: 120.w,
                                    color: defaultColor,
                                    child: Center(
                                        child: svgImage('user',
                                            size: 70, color: Colors.white)),
                                  )
                                : CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.grey,
                                    child: CircleAvatar(
                                      radius: 65,
                                      backgroundColor: Colors.white,
                                      backgroundImage:  _pickedImage!=null ? FileImage(_pickedImage) :NetworkImage(user.avatar)
                                    //  FileImage(_pickedImage)
                                      ,
                                    ),
                                  ),
                          ),
                        ),
                        Builder(
                          builder: (ctx) => InkWell(
                              onTap: () {
                                Scaffold.of(ctx).showBottomSheet<void>(
                                  (BuildContext context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(25.r),
                                          topLeft: Radius.circular(25.r),
                                        ),
                                        color: Colors.grey.shade200,
                                      ),
                                      height: 200,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.image,
                                                  size: 30,
                                                ),
                                                onPressed: () {
                                                  _pickImageGallery();
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              textBody('Gallery',
                                                  color: defaultColor),
                                            ],
                                            mainAxisSize: MainAxisSize.min,
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.camera,
                                                  size: 30,
                                                ),
                                                onPressed: () {
                                                  _pickImageCamera();
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              textBody('Camera',
                                                  color: defaultColor),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: svgImage('add_btn')),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                      child: textBodyMedium(
                          "${user.firstName} ${user.lastName}",
                          color: defaultColor)),
                  SizedBox(
                    height: 30.h,
                  ),
                  buildRow('email'.t, '${user.email}'),
                  Divider(),
                  buildRow('mobile'.t, '${user.mobile}'),
                  Divider(),
                  InkWell(
                    onTap: () {
                      showChangePassword(context);
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.w),
                        child:
                            textBody('change_Password'.t, color: defaultColor)),
                  ),
                  Divider(),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.w),
                      child: Row(
                        children: [
                          textBody('Change_language'.t, color: defaultColor),
                          Spacer(),
                          textBody('العربية', color: defaultColor),
                        ],
                      )),
                  Divider(),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textBody('Notifications'.t,
                              color: defaultColor, fontSize: 15.sp),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              textBody('Change_language'.t,
                                  color: defaultColor),
                              Spacer(),
                              Switch(
                                value: false,
                                onChanged: (value) {
                                  setState(() {
                                    // isSwitched = value;
                                    // print(isSwitched);
                                  });
                                },
                                // activeTrackColor: Colors.yellow,
                                // activeColor: Colors.orangeAccent,
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: InkWell(
              onTap: () {
                To(context, LoginScreen());

                removeUser();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  textBodyMedium('logout'.t, color: defaultColor),
                  SizedBox(
                    width: 10.w,
                  ),
                  svgImage('logout')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  buildRow(title, value) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textBodyMedium(title, color: defaultHint, fontSize: 14.sp),
          textBodyMedium(value, color: defaultColor),
        ],
      ),
    );
  }
}
