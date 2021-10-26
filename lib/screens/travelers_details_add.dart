import 'package:conso_customer/items/item_plane_details.dart';
import 'package:conso_customer/shared/colors/colors_common.dart';
import 'package:conso_customer/shared/components/cardFormArrow.dart';
import 'package:conso_customer/shared/components/components.dart';
import 'package:conso_customer/shared/components/defaultButton.dart';
import 'package:conso_customer/shared/components/my_form_clickable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:conso_customer/extensions_lang.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TravelersDetailsAdd extends StatefulWidget {
  const TravelersDetailsAdd({Key key}) : super(key: key);

  @override
  _TravelersDetailsAddState createState() => _TravelersDetailsAddState();
}

class _TravelersDetailsAddState extends State<TravelersDetailsAdd> {
  TextEditingController firstName = TextEditingController()
    ..text = '';
  TextEditingController lastName = TextEditingController()
    ..text = '';
  TextEditingController mobile = TextEditingController()
    ..text = '';
  TextEditingController email = TextEditingController()
    ..text = '';
  TextEditingController birthDate = TextEditingController()..text = '';
  TextEditingController passportNumber = TextEditingController()..text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar('title'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10.h,),
            divider('Personal_details'.t),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              // padding: EdgeInsets.all(5),
              clipBehavior: Clip.hardEdge,
              decoration: boxDecoration,
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                            child: defaultTextFormDialog(
                                firstName, 'fitsName'.t,
                                icon: svgImage('user'))),
                        VerticalDivider(
                          thickness: 1,
                          width: 1,
                          color: defaultBorder,
                        ),
                        Expanded(
                            child: defaultTextFormDialog(
                              lastName,
                              'lastName'.t,
                            )),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: defaultBorder,
                  ),
                  defaultTextFormDialog(
                      mobile, 'mobile'.t,
                      icon: svgImage('phone')),

                  Divider(
                    thickness: 1,
                    height: 1,
                    color: defaultBorder,
                  ),
                  defaultTextFormDialog(
                      email, 'email'.t,
                      icon: svgImage('email', color: defaultHint)),

                  Divider(
                    thickness: 1,
                    height: 1,
                    color: defaultBorder,
                  ),
                  defaultTextFormDialog(
                      birthDate,
                      'date_birth'.t,
                      icon: svgImage('calendar-day'),
                      onTap: () {
                        //   To(context, ChooseCategoryPassengers());
                      }),


                ],
              ),
            ),
            divider('documents'.t),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  MyFormClickable(hint: 'الجنسية'.t,textEditingController:passportNumber ,),
                  SizedBox(height: 10.h,) ,
                  defaultTextFormDialog(passportNumber, 'Passport_number'.t,isBorder: true),

                  // SizedBox(height: 10.h,) ,
                  // Row(
                  //   children: [
                  //   ],
                  // ) ,
                  SizedBox(height: 10.h,) ,
                  MyFormClickable(hint: 'Passport_number'.t,textEditingController:passportNumber ,),
                  SizedBox(height: 10.h,) ,
                  MyCardForm('name', (){},isSwitch: false,),
                  SizedBox(height: 10.h,) ,
                  Container(
                    decoration: boxDecoration,
                    child: Column(
                      children: [
                        defaultTextFormDialog(
                            birthDate,
                            'date_birth'.t,
                            icon: svgImage('calendar-day'),
                            onTap: () {
                              //   To(context, ChooseCategoryPassengers());
                            }),
                        Divider(
                          thickness: 1,
                          height: 1,
                          color: defaultBorder,
                        ),
                        defaultTextFormDialog(
                            birthDate,
                            'date_birth'.t,
                            icon: svgImage('calendar-day'),
                            onTap: () {
                              //   To(context, ChooseCategoryPassengers());
                            }),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,) ,
                  defaultButton(onPressed: (){}, text: 'Add_traveler'.t),
                  SizedBox(height: 10.h,) ,
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
