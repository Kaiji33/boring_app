import 'package:flutter/material.dart';
import 'package:boring/services/rank.dart';


class ThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    @override

    Widget textContainer = Container(
      padding: const EdgeInsets.all(20.0),
      child:Text(
        "The most boring people of the world !",
        style: TextStyle(
          color:Colors.white,
          fontSize: 20
        ),
        textAlign: TextAlign.center,
      )
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
            children: <Widget>[
              textContainer,
              getRank(),
          ],
        ),
      ),
    );
  } 
}

