import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './FirstPage.dart' as first;
import './SecondPage.dart' as second;
import './ThirdPage.dart' as third;




class  Home extends StatefulWidget {
  const Home({
    Key key,
    @required this.user
  }): super(key:key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController controller;
  @override
  void initState(){
    super.initState();
    controller=new TabController(vsync: this, length: 3);
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
            title: Text('Home ${widget.user.email}'),
            backgroundColor: Colors.deepOrange,
            bottom: new TabBar(
                controller: controller,
                tabs: <Tab>[
                  new Tab(icon: new Icon(Icons.arrow_forward)),
                  new Tab(icon: new Icon(Icons.arrow_downward)),
                  new Tab(icon: new Icon(Icons.arrow_back)),
                ]
            )
        ),
        body: new TabBarView(
            controller: controller,
            children: <Widget>[
              new first.First(),
              new second.Second(),
              new third.Third()
            ]
        )
    );
  }
}
