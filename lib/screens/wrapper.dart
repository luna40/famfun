import 'package:demone/models/Users.dart';
import 'package:demone/screens/authenticate/authenticate.dart';
import 'package:demone/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user =Provider.of<User>(context); 
    
    // return either authenticate or home
  if (user == null) {
    return Authenticate();
  } else{
    return Homee();
  }
      
  }
} 