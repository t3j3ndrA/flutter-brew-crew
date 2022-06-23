import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:rebeg/models/myUser.dart';
import 'package:rebeg/services/authServices.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Authenticate authenticateServices = Authenticate();
  String email = '', password = '', error = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Brew Crew Sign In"),
          backgroundColor: Colors.brown[500],
          actions: [
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text("Register"),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
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
                      Map<String, dynamic> result =
                          await authenticateServices.signInWithEmailAndPassword(
                              email: email, password: password);
                      if (result['success']) {
                        Provider.of<MyUser>(context, listen: false)
                            .updateUid(result['uid']);
                      } else {
                        setState((() => error = result['message']));
                      }
                    }
                  },
                  child: Text('Sign In',
                      style: TextStyle(
                        color: Colors.white,
                      ))),
              SizedBox(
                height: 35,
              ),
              Text('${error}',
                  style: TextStyle(color: Colors.red[600], fontSize: 12)),
            ]),
          ),
        ));
  }
}
