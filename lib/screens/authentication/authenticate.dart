import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:rebeg/models/myUser.dart';
import 'package:rebeg/screens/authentication/register.dart';
import 'package:rebeg/screens/authentication/singIn.dart';

class AuthenticateScreen extends StatelessWidget {
  const AuthenticateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<MyUser>(context).showSignIn == true
        ? SignIn()
        : Register();
  }
}
