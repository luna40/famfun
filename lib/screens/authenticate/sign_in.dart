import 'package:demone/services/auth.dart';
import 'package:demone/shared/constants.dart';
import 'package:demone/shared/loading.dart';
import 'package:flutter/material.dart';
///import 'package:demone/models/Users.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({ this.toggleView}); 

  @override
  _SignInState createState() => _SignInState();}

class _SignInState extends State<SignIn> {
 
final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
bool loading=false;
// textfeild states
String email='';
String password= '';
  String error ='';
  @override
  Widget build(BuildContext context) {
    return loading? Loading() :Scaffold
    (backgroundColor:    Colors.pink[100],
       appBar: AppBar(
       backgroundColor: Colors.pink[400], 
       elevation: 0.0,
       title: Text('hello fam'),
       actions: <Widget>[
         FlatButton.icon(onPressed: (){
           widget.toggleView(); 
         }, icon: Icon(Icons.person), label: Text('Register'))
       ],
       ),
       body: Container( 
          
         padding: EdgeInsets.symmetric(vertical:20, horizontal: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'email'),
                   validator: (val) => val.isEmpty ? 'email' : null,
                onChanged: (val){
                  setState(()=>password=val);

                }
                ),// textform field 1
                SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                obscureText: true,
                   validator: (val) => val.length <6 ? 'password' : null,
                onChanged: (val){
                setState(()=>password=val);

                }
            
            ),// textformfield 2
            SizedBox(height: 20.0,),
           RaisedButton( 
            color: Colors.grey[200],
            child: Text('sign In' ,style: TextStyle( color: Colors.black )
           ),
            onPressed: () async {
              if(_formKey.currentState.validate()){
            setState(()=> loading = true);
                dynamic result = await _auth.signInWithEmailAndPassword(email,password);
                if(result == null){
                   setState(() { error = 'redo';
                   loading= false;});
                }
                
              }
            }
           //print(email);
           //print(password);},
           //child: Text('sign In' ,style: TextStyle( color: Colors.black )
           //),
           ),
           SizedBox (height: 12.0),
           Text(error, style: TextStyle(color: Colors.red, fontSize:14.0),
           )

            ],
           ),
           ),
            ),
          );
  }
}