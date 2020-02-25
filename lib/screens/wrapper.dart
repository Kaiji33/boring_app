import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:boring/models/user.dart';
import 'package:boring/screens/authenticate/sign_in.dart';
import 'package:boring/screens/home/home.dart';
import 'package:boring/services/database.dart';

bool flag = false;

class Wrapper extends StatefulWidget {
  
  @override
  WrapperState createState() => new WrapperState();
}

class WrapperState extends State<Wrapper> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setState(() {
      flag = true;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed ) {
      setState(() {
        flag = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return SignIn();
    }else{
      return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          UserData userData = snapshot.data;
          if (flag) {
            DatabaseService(uid: user.uid).updateUserData(userData.count+1, userData.name, userData.photo);
            flag = false;
          }
          return Home();
        }
      );
    }
  } // return either the Home or Authenticate widget
}