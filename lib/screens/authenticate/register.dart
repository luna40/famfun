import 'package:demone/services/auth.dart';
import 'package:demone/shared/constants.dart';
import 'package:demone/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth= AuthService();
  final _formKey = GlobalKey<FormState>(); 
  bool loading = false;

  // textfield  state
 
   String email='';
  String password='';
  String error ='';
  @override
  Widget build(BuildContext context) {
     return loading ? Loading(): Scaffold
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
                validator: (val) => val.isEmpty ? 'Redo' : null,
                onChanged: (val){
                  setState(()=>email=val);

                }
                ),// textform field 1
                SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'password'),
               
                   validator: (val) => val.length <2 ? 'Redo' : null,
                onChanged: (val){
                setState(()=>password=val);

                } 
            
            ),// textformfield 2
            SizedBox(height: 20.0,),
           RaisedButton( 
            color: Colors.grey[200],
            onPressed: () async {  
           if(_formKey.currentState.validate()){
             setState(()=> loading = true);
                dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                if(result == null){
                   setState(() { error = 'redo';
                   loading= false;});
                }
              }
              },
           child: Text('Register' ,style: TextStyle( color: Colors.black )
           )
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