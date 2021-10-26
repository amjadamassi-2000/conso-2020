import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_screenutil/size_extension.dart';

class EditMyProfile extends StatefulWidget {
  const EditMyProfile({Key key}) : super(key: key);

  @override
  _EditMyProfileState createState() => _EditMyProfileState();
}

class _EditMyProfileState extends State<EditMyProfile> {
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
              defaultTextFormDialog(TextEditingController()..text = 'user@email.com', 'hint'),
              Divider(),
              textBody('email'.t,color: defaultColor),
              defaultTextFormDialog(TextEditingController()..text = '+966 0000 000 000', 'hint'),
            ],
          ),
        ),
      ),
    );
  }
}
