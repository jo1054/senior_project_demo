import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class First extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new FirstState();
  }
}


class FirstState extends State<First> with SingleTickerProviderStateMixin {

  final TextEditingController _hightController=new TextEditingController();
  final TextEditingController _weightController=new TextEditingController();
  final TextEditingController _ageController=new TextEditingController();

  int _weightRadioValue=0;
  int _activityRadioValue=0;
  int _ageRadioValue=0;
  int _hightRadioValue=0;
  int _genderRadioValue=0;

  double weightmultiplier=1.0;
  double hightmultiplier=0.01;
  double activitymultiplier=0.01;
  double gendermultiplier=0.01;
  int bmiResult=0;
  int protien =0;
  int carbs = 0;
  int fat =0;
  String info="";
  String info2="";
  String info3="";
  String info4="";
  Color stateColor=Colors.white;

  AnimationController animController;
  Animation<double> animation;

  @override
  void initState(){
    super.initState();

    animController=AnimationController(
        duration: Duration(milliseconds: 1000),
        vsync: this
    );

    animation = Tween(begin: 0.0,end: 0.97).animate(animController)
      ..addListener(() {setState(() {});});

    animController.forward();
  }

  @override
  void dispose(){
    super.dispose();
    animController.dispose();
  }


  @override
  Widget build(BuildContext context) {

//////////vars//////////

    final background = Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backgroundd.jpg"),
              fit: BoxFit.cover)),
    );

    final greenOpacity = Container(color: Color(0xf2f3f3),);

    final logo =FadeTransition(
      opacity: animation,
      child: new ScaleTransition(
          scale: animation,
          child: new Image.asset("assets/images/logo2.png", width: 105.5, height: 105.5)),
    );

    final formula= new FadeTransition(
        opacity: animation,
        child: new SlideTransition(
          position: Tween<Offset>(begin: Offset(0.0, -0.8),end: Offset.zero).animate(animController),
          child: new Container(
              child: new Column(
                  children: <Widget>[
                    new TextField(
                      keyboardType: TextInputType.number,
                      style: textStyle.copyWith(fontSize: 16.0,fontStyle: FontStyle.normal),
                      controller: _ageController ,
                      cursorColor: Colors.black,
                      decoration: new InputDecoration(
                        labelText: "Age",
                        labelStyle: textStyle.copyWith(fontSize: 19.0,fontStyle: FontStyle.normal),
                        hintText: "Enter your age",
                        hintStyle: new TextStyle(color: Colors.black),
                        icon: new Icon(Icons.line_weight,color: Colors.black,),
                      ),
                    ),
                    new TextField(
                      keyboardType: TextInputType.number,
                      style: textStyle.copyWith(fontSize: 16.0,fontStyle: FontStyle.normal),
                      controller: _weightController ,
                      cursorColor: Colors.black,
                      decoration: new InputDecoration(
                        labelText: "Weight",
                        labelStyle: textStyle.copyWith(fontSize: 19.0,fontStyle: FontStyle.normal),
                        hintText: "Enter your weight",
                        hintStyle: new TextStyle(color: Colors.black),
                        icon: new Icon(Icons.accessibility_new,color: Colors.black),
                      ),
                    ),
                    new Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio(
                            value: 0,
                            groupValue: _weightRadioValue,
                            onChanged: handleWeightRadioValueChange,
                          ),
                          new Text("KG",style: new TextStyle(fontSize: 17.0),),
                          new Radio(
                            value: 1,
                            groupValue: _weightRadioValue,
                            onChanged: handleWeightRadioValueChange,
                          ),
                          new Text("POUNDS",style: new TextStyle(fontSize: 17.0),),

                        ]
                    ),

                    new TextField(
                      keyboardType: TextInputType.number,
                      style: textStyle.copyWith(fontSize: 16.0,fontStyle: FontStyle.normal),
                      controller: _hightController ,
                      cursorColor: Colors.black,

                      decoration: new InputDecoration(
                        labelText: "Hight",
                        labelStyle: textStyle.copyWith(fontSize: 19.0,fontStyle: FontStyle.normal),
                        hintText: "Enter your hight",
                        hintStyle: new TextStyle(color: Colors.black),
                        icon: new Icon(Icons.line_weight,color: Colors.black,),
                      ),
                    ),
                    new Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio<int>(
                              value: 0,
                              groupValue: _hightRadioValue,
                              onChanged: handleHightRadioValueChange
                          ),
                          new Text("CM",style: new TextStyle(fontSize: 17.0),),
                          new Radio<int>(
                              value: 1,
                              groupValue: _hightRadioValue,
                              onChanged: handleHightRadioValueChange
                          ),
                          new Text("meters",style: new TextStyle(fontSize: 17.0),),

                        ]
                    ),

                    new Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio<int>(
                              value: 0,
                              groupValue: _genderRadioValue,
                              onChanged: handleGenderRadioValueChange
                          ),
                          new Text("Male",style: new TextStyle(fontSize: 17.0),),
                          new Radio<int>(
                              value: 1,
                              groupValue: _genderRadioValue,
                              onChanged: handleGenderRadioValueChange
                          ),
                          new Text("Female",style: new TextStyle(fontSize: 17.0),),

                        ]
                    ),
                    new Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: <Widget>[

                          new Radio<int>(
                              value: 1,
                              groupValue: _activityRadioValue,
                              onChanged: handleActivityRadioValueChange
                          ),
                          new Text("Sedentary",style: new TextStyle(fontSize: 17.0),),
                          new Radio<int>(
                              value: 2,
                              groupValue: _activityRadioValue,
                              onChanged: handleActivityRadioValueChange
                          ),
                          new Text("Light activity",style: new TextStyle(fontSize: 17.0),),

                        ]
                    ),
                    new Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: <Widget>[

                          new Radio<int>(
                              value: 3,
                              groupValue: _activityRadioValue,
                              onChanged: handleActivityRadioValueChange
                          ),
                          new Text("Moderate activity",style: new TextStyle(fontSize: 17.0),),
                          new Radio<int>(
                              value: 4,
                              groupValue: _activityRadioValue,
                              onChanged: handleActivityRadioValueChange
                          ),
                          new Text("Very active",style: new TextStyle(fontSize: 17.0),),

                        ]
                    ),
                  ]
              )
          ),
        )
    );

    final result = new Text(bmiResult==0? '$info' : '$info'+' $bmiResult' +'$info2 ' + ' $protien'+'$info3'+'$fat'+'$info4'+'$carbs',textAlign: TextAlign.center,
      style: textStyle.copyWith(fontSize: 20.0,fontStyle: FontStyle.italic),);

    final analysis = new Text(bmiResult >=10 ? state(bmiResult) : "" ,textAlign: TextAlign.center,
      style: textStyle.copyWith(fontSize: 22.0,fontStyle: FontStyle.italic,color: stateColor,fontWeight: FontWeight.w100),);

    final sperator = FadeTransition(
      opacity: animation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(width: 20.0,height: 1.7,color: Colors.white),
          Padding(padding: EdgeInsets.symmetric(horizontal: 7.0),
              child: Text("Copyright © 2018 fitness corp,  All rights reserved", style: textStyle.copyWith(fontSize: 12.5),)),
        ],
      ),
    );

/////////////////////////////


    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          background,
          greenOpacity,
          ListView(
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top:70.2),),
                        Opacity(child: logo,opacity: .95,),
                        Padding(padding: EdgeInsets.only(top:50.2),),
                        formula,
                        Padding(padding: EdgeInsets.only(top:50.2),),
                        button("CALCULATE", calculateBMI),
                        Padding(padding: EdgeInsets.only(top:40.2),),
                        result,
                        analysis,
                        Padding(padding: EdgeInsets.only(top:25.2),),
                        sperator

                      ],
                    ),
                  ),
                ),
              ]
          )
        ],
      ),
    );
  }


  Widget button(String label,Function onTap){

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(begin: Offset(0.0, -0.6),end: Offset.zero).animate(animController),
        child: new Material(
          color: Color(0xBB00D699),
          borderRadius: BorderRadius.circular(30.0),
          child: InkWell(
            onTap: onTap,
            splashColor: Colors.white24,
            highlightColor: Colors.white10,
            child: Container(
              padding: EdgeInsets.symmetric(vertical:12.0 ),
              child: Center(child: new Text(label,style: textStyle.copyWith(fontSize: 18.0),)),
            ),
          ),
        ),
      ),
    );

  }

  handleWeightRadioValueChange(int value){

    setState(() {
      _weightRadioValue=value;

      switch (value) {

        case 0:
          weightmultiplier=1.0;
          break;

        case 1:
          weightmultiplier=0.45;
          break;
      }

    });
  }

  handleHightRadioValueChange(int value){

    setState(() {
      _hightRadioValue=value;

      switch (value) {

        case 0:
          hightmultiplier=1.0;
          break;

        case 1:
          hightmultiplier=100;
          break;
      }
    });
  }

  handleGenderRadioValueChange(int value){

    setState(() {
      _genderRadioValue=value;

      switch (value) {

        case 0:
          gendermultiplier=5;
          break;

        case 1:
          gendermultiplier=-161;
          break;
      }
    });
  }

  handleActivityRadioValueChange(int value){

    setState(() {
      _activityRadioValue=value;

      switch (value) {

        case 0:
          activitymultiplier=1.2;
          break;

        case 1:
          activitymultiplier=1.375;
          break;
        case 2:
          activitymultiplier=1.55;
          break;

        case 4:
          activitymultiplier=1.725;
          break;
      }
    });
  }
  calculateBMI(){
    double weight=0.0;
    double hight=0.0;
    double age = 0;

    double pm = 4;
    double cm = 4;
    double fm = 9;

    double pc = 0;
    double cc = 0;
    double fc = 0;
    setState(() {

      if(_weightController.text.isNotEmpty && double.parse(_weightController.text) > 0.0 && _hightController.text.isNotEmpty &&  double.parse(_hightController.text) > 0.0){
        age= double.parse(_ageController.text);
        weight=double.parse(_weightController.text);
        hight=double.parse(_hightController.text);
        double weightF=weight*weightmultiplier;
        double hightF=hight*hightmultiplier;
        if(age !=0 || weight != 0 || hight != 0 ){
          info="your calorie estimate is " ;
          bmiResult=(((10*weightF) + (6.25*hightF) -(5*age)+(gendermultiplier))*activitymultiplier).round();
          protien = (weightF * 1.815).round();
          fat = ((bmiResult *.25)/9).round();
          pc = protien*pm;
          fc = fat*fm;
          cc = bmiResult-pc - fc.round();
          carbs = (cc/9).round();
          info2="\nprotien:";
          info3=" fat: ";
          info4=" carbs: ";

          //bmiResult=(weightF/(hightF*hightF)).round();
        }else{
          bmiResult=0;
          info="please enter correct values";
        }

      } else {
        info="please enter correct values";
      }

    });

  }

  String state(int bmi){

    if( bmi < 18.5 ) { stateColor=Colors.red; return ""; }
    else if( bmi >= 18.5 && bmi <= 24.99 ) { stateColor=Colors.green.shade400; return ""; }
    else if( bmi >= 25 && bmi <= 29.99 ) { stateColor=Colors.yellow; return ""; }
    else if( bmi >= 30 ) { stateColor=Colors.red; return ""; }

  }

}

const TextStyle textStyle=TextStyle(
    color: Colors.black,
    fontStyle: FontStyle.italic
    ,fontFamily: 'BebasNeue');