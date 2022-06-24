import 'package:flutter/material.dart';
import 'package:rebeg/models/brewsdata.dart';
import 'package:rebeg/models/couter.dart';
import 'package:rebeg/models/itemslist.dart';
import 'package:rebeg/models/myUser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rebeg/models/myuserdata.dart';
import 'package:rebeg/screens/authentication/authenticate.dart';
import 'package:rebeg/screens/home/home.dart';
import 'package:rebeg/services/authServices.dart';
import 'package:rebeg/services/database.dart';
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
  DatabaseServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyUser>(create: (context) => MyUser()),
        ChangeNotifierProvider<AllBrewsData>(
          create: (context) => AllBrewsData(),
        ),
        ChangeNotifierProvider(create: (context) => MyUserData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
