import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:boring/services/auth.dart';
import 'package:boring/screens/wrapper.dart';
import 'package:boring/models/user.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
    MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}