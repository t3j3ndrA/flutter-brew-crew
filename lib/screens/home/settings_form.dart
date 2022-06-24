import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:rebeg/models/myUser.dart';
import 'package:rebeg/models/myuserdata.dart';
import 'package:rebeg/services/database.dart';

class SettingsForm extends StatefulWidget {
  SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey();
  final List<String> dropDownItemsList = ['1', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    final myUserData = Provider.of<MyUserData>(context);
    final myUser = Provider.of<MyUser>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: myUserData.name,
            validator: ((value) =>
                value != '' ? null : 'Name cannot be empty!'),
            decoration: InputDecoration(
                label: Text('Name'),
                labelStyle: TextStyle(color: Colors.brown[400])),
            onChanged: (val) {
              myUserData.name = val;
            },
          ),
          SizedBox(height: 30),
          DropdownButtonFormField(
              hint: Text('Select Sugar intake :'),
              items: dropDownItemsList.map((e) {
                return DropdownMenuItem(value: e, child: Text('${e} sugars'));
              }).toList(),
              onChanged: (val) {
                setState(() {
                  myUserData.sugars = val as String;
                });
              }),
          SizedBox(height: 30),
          Slider(
            value: (myUserData.strength).toDouble(),
            label: 'Coffee Strength : ${myUserData.strength}',
            activeColor: Colors.brown[myUserData.strength],
            inactiveColor: Colors.grey[200],
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (val) {
              setState(() {
                myUserData.strength = val.round();
              });
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
              onPressed: () async {
                // print(myUserData.name);
                // print(myUserData.strength);
                // print(myUserData.sugars);
                DatabaseServices().updateMyUserDataFromSettingsForm(
                    myUserData: myUserData, uid: myUser.uid);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
              ),
              child: Text('Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}
