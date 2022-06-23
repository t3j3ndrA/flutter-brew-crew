import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:rebeg/models/myUser.dart';
import 'package:rebeg/services/authServices.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  Authenticate authenticateServices = Authenticate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: Text("Brew crew!"),
        actions: [
          IconButton(
            onPressed: () async {
              Provider.of<MyUser>(context, listen: false)
                  .updateUid(await authenticateServices.signOut());
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ElevatedButton(
          child: Text("Singin Anon"),
          onPressed: () async {
            // MyUser loggedInUser = await Authenticate().signInAnon();
            Provider.of<MyUser>(context, listen: false)
                .updateUid(await authenticateServices.signInAnon());
          }),
    );
  }
}
