import 'package:flutter/material.dart';
import 'package:boring/services/auth.dart';
import 'package:boring/models/user.dart';
import 'package:provider/provider.dart';

class FirstTab extends StatefulWidget {
  @override
    FirstTabState createState() => FirstTabState();
}

class FirstTabState extends State<FirstTab> {
  AuthService _auth = AuthService();
  String uid = '';
  getUid() {}

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child:new ClipOval(
                  child: new SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: new Image.network(
                      user.photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Text(
                    'User: ' + user.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
              ),

              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Rank: to be completed",
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  ),
                )
              ),

              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("Logout", style: TextStyle(color: Colors.white),),
                        onPressed: () async {
                          await _auth.signOut();
                        },
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



