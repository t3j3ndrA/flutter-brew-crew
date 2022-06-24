import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:rebeg/models/brewsdata.dart';
import 'package:rebeg/models/myUser.dart';
import 'package:rebeg/services/authServices.dart';
import 'package:rebeg/services/database.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _SignInState();
}

class _SignInState extends State<Register> {
  Authenticate authenticateServices = Authenticate();
  String email = '', password = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text("Brew Crew Sign In"),
          backgroundColor: Colors.brown[500],
          actions: [
            TextButton.icon(
              icon: Icon(Icons.person),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              label: Text("Sign In"),
              onPressed: () {
                Provider.of<MyUser>(context, listen: false)
                    .toggelBetweenSignInAndRegistrationPage();
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: ((value) =>
                    value != '' ? null : 'Email cannot be empty!'),
                decoration: InputDecoration(
                    label: Text('Email'),
                    labelStyle: TextStyle(color: Colors.brown[400])),
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: ((value) =>
                    value!.length > 6 ? null : 'Use min 6 char password'),
                decoration: InputDecoration(
                    label: Text('Password'),
                    labelStyle: TextStyle(color: Colors.brown[400])),
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pinkAccent),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Map result = await authenticateServices
                          .registerUserWithEmailAndPassword(
                              email: email, password: password);
                      print(result.toString());
                      if (result['success'] == true) {
                        Provider.of<MyUser>(context, listen: false)
                            .updateUid(result['uid']);
                        await DatabaseServices().addData(
                            brewData: BrewData(
                                sugar: '0',
                                name: 'new Crew Member',
                                strength: 100),
                            uid: Provider.of<MyUser>(context, listen: false)
                                .uid);
                      } else {
                        setState(() {
                          error = result['message'];
                        });
                      }
                    }
                  },
                  child: Text('Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                      ))),
              Text('${error}',
                  style: TextStyle(color: Colors.red[600], fontSize: 12)),
            ]),
          ),
        ));
  }
}



// Container(
//         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
//         child: ElevatedButton(
//             child: Text("Singin Anon"),
//             onPressed: () async {
//               // MyUser loggedInUser = await Authenticate().signInAnon();

//               Provider.of<MyUser>(context, listen: false)
//                   .updateUid(await authenticateServices.signInAnon());
//             }),
//       ),