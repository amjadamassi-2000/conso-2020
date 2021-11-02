import 'package:conso_customer/modle/User.dart';
import 'package:conso_customer/modle/base_respons.dart';
import 'package:conso_customer/my_widgets/custom_botton.dart';
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

import 'my_profile.dart';

class EditMyProfile extends StatefulWidget {

  @override
  _EditMyProfileState createState() => _EditMyProfileState();
}

class _EditMyProfileState extends State<EditMyProfile> {


  TextEditingController editEmailController = TextEditingController()..text = '';
  TextEditingController editFNameController = TextEditingController()..text = '';
  TextEditingController editLNameController = TextEditingController()..text = '';




  editUserProfile(startLoading, stopLoading, btnState) async {
    FocusScope.of(context).unfocus();
      try {
        startLoading();
        Response response = await getResponse(userEditProfile, data: {
          "mobile" : getUser().mobile,
          'email': editEmailController.text,
          'first_name': editFNameController.text,
          "last_name": editLNameController.text,
          'notification_status': 1,
        });
        var res = BaseResponse.fromJson(
          response.data,
          keyObject: 'user',
          fun: (json) {
           return User.fromJson(json) ;
          },
        );
        if (res.status) {
          setUser(res.object) ;
          Navigator.pop(context) ;
          //To(context, MyProfile());
        } else {
          showDialogWithMessage(context, res.message);
        }
      } catch (error) {
        stopLoading();
        print(error);
        showDialogWithMessage(context,"Something went wrong..!");
      }
      stopLoading();
    }







  @override
  void initState() {
    super.initState();
    updateData() ;
  }



  updateData(){
    editEmailController.text = getUser().email;
    editFNameController.text = getUser().firstName;
    editLNameController.text = getUser().lastName;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('edit'.t),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              textBodyMedium('Account_Information'.t,color: defaultColor,textAlign: TextAlign.start),
              SizedBox(height: 20.h,),



              textBody('email'.t,color: defaultColor),
              defaultTextFormDialog(
                  editEmailController, 'hint'
              ),
              Divider(),

              textBody('first_name'.t,color: defaultColor),
              defaultTextFormDialog(
                  editFNameController, 'hint'),
              Divider(),

              textBody('last_name'.t,color: defaultColor),
              defaultTextFormDialog(
                 editLNameController, 'hint'),
              Divider(),

             SizedBox(
               height: 100,
             ),

              CustomBtnComponent(
                  text: ' حفظ التغيرات ',
                  onTap: (startLoading, stopLoading, btnState) {
                    editUserProfile(startLoading, stopLoading, btnState);
                  }),



            ],
          ),
        ),
      ),
    );
  }
}
