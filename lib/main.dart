import 'package:flutter/material.dart';
import 'package:rebeg/models/couter.dart';
import 'package:rebeg/models/itemslist.dart';
import 'package:rebeg/models/myUser.dart';
import 'package:rebeg/responsives/mobile_screen_layout.dart';
import 'package:rebeg/responsives/responsive_layouts.dart';
import 'package:rebeg/responsives/web_screen_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rebeg/screens/authentication/authenticate.dart';
import 'package:rebeg/screens/home/home.dart';
import 'package:rebeg/services/authServices.dart';
import 'package:rebeg/wrapper.dart';
import 'firebase_options.dart';
import 'services/authServices.dart';
import 'package:provider/provider.dart';

// import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>(create: (context) => Counter()),
        ChangeNotifierProvider<CartItems>(
          create: (context) => CartItems(),
        ),
        ChangeNotifierProvider<MyUser>(create: (context) => MyUser()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
