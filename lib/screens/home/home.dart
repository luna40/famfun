import 'package:demone/services/auth.dart';
import 'package:flutter/material.dart';
 
 class Homee extends StatelessWidget {
   final AuthService _auth =AuthService();
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.purple[200],
       appBar: AppBar(
         backgroundColor: Colors.pink[400],
         title: Text('welcome'),
         elevation: 0.0,
         actions: <Widget>[
           FlatButton.icon(
             onPressed: () async{
               await _auth.signOut();

             },
            icon: Icon(Icons.person), 
            label: Text('settings')
            )
         ],
       ),

     ); //scaffold
   }
 }