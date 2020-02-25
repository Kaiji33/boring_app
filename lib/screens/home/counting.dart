import 'package:flutter/material.dart';
import 'package:boring/models/user.dart';
import 'package:boring/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SecondTab extends StatefulWidget {
  @override
  SecondTabState createState() => new SecondTabState();
}

class SecondTabState extends State<SecondTab> {

  @override
  Widget build(BuildContext context) {
  
    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;

          return Scaffold(
            backgroundColor: Colors.black,
            body: ListView(
              children: <Widget>[

                Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "The sum of times \n you've opened  this app \n for no reason: ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                      textAlign: TextAlign.center,
                    )
                ),

                Container(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(
                      userData.count.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                      textAlign: TextAlign.justify,
                    )
                )

              ],
            ),
          );
        }else{
          return Loading();
        }
      }
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
