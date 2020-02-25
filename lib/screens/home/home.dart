import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boring/screens/home/personal.dart';
import 'package:boring/screens/home/counting.dart';
import 'package:boring/screens/home/ranking.dart';

class Home extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  
  TabController controller;

  @override
  void initState(){
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return DefaultTabController(  
      length: 3,  
      initialIndex: 0, 
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
          Icons.bug_report,
          color: Colors.black,
          ),
          title: Text(
            "Boring",
            style: new TextStyle(
            color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[FirstTab(), SecondTab(), ThirdTab()], 
        ),
        bottomNavigationBar:  Material(
          color: Colors.white,
          child: TabBar(
            controller: controller,
            tabs: <Tab>[
              Tab(icon: Icon(Icons.account_box,color: Colors.black,)),
              Tab(icon: Icon(Icons.add_box,color: Colors.black,)),
              Tab(icon: Icon(Icons.poll,color: Colors.black,)),
            ],
          ),
        ),
      ),
    );
  } 
}

   



