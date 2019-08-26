
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WordAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => WordAddState();

}

class WordAddState extends State{
  TextEditingController txtTurkish = TextEditingController();
  TextEditingController txtEnglish = TextEditingController();
  //TextEditingController txtTurkish = TextEditingController();

  @override
  Widget build(BuildContext context) {
      
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add to Word"),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
        children: <Widget>[
          TextField(
            controller: txtTurkish,
            decoration: InputDecoration(labelText: "Türkçe"),
          ),
           TextField(
            controller: txtEnglish,
            decoration: InputDecoration(labelText: "English"),
          ),
          FlatButton(
            child: Text("Save"),
          )
          
        ],
      ), 
      ) 
      
      
    );
  }

}