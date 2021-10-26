import 'package:conso_customer/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:conso_customer/extensions_lang.dart';

class EditMyWallet extends StatefulWidget {
  const EditMyWallet({Key key}) : super(key: key);

  @override
  _EditMyWalletState createState() => _EditMyWalletState();
}

class _EditMyWalletState extends State<EditMyWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('edit'.t),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
