import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:rebeg/models/couter.dart';
import 'package:rebeg/models/itemslist.dart';
import 'package:rebeg/models/myUser.dart';
import 'package:rebeg/screens/authentication/authenticate.dart';
import 'package:rebeg/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print(Provider.of<MyUser>(context).uid);
    return Provider.of<MyUser>(context).uid == ''
        ? AuthenticateScreen()
        : Home();
  }
}
