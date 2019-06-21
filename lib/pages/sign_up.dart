import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_trends/pages/login.dart';
import 'package:new_trends/db/users.dart';

import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices=UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  String gender;
  String groupValue="Male";

  bool loading = false;



  @override
  Widget build(BuildContext context) {

    double height=MediaQuery.of(context).size.height/3;

    return Scaffold(
      body: new Stack(
        children: <Widget>[
          Image.asset(
            "images/back.jpg",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          new Container(
            color: Colors.black.withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),
          new Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "images/lg.png",
              width: 280.0,
              height: 240.0,
            ),
          ),
          new Center(
            child: Padding(
              padding: const EdgeInsets.only(top:200.0),
              child: new Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[

                Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white.withOpacity(0.4),
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name",
                          icon: Icon(Icons.person_outline)
                      ),
                      validator: (value){
                        if (value.isEmpty) {
                          return "The name field cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),



                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.40),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _emailTextController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                icon: Icon(Icons.alternate_email)
                            ),
                            validator: (value){
                              if(value.isEmpty){
                                Pattern pattern=r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(value))
                                  return 'Please make sure your email address is valid';
                                else
                                  return null;
                              }
                            },
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                      child: new Container(
                        color: Colors.white.withOpacity(0.4),
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new ListTile(
                                title: new Text(
                                  "Male",
                                  textAlign: TextAlign.end,
                                  style: new TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                trailing:new Radio(
                                    value: "Male",
                                    groupValue: groupValue,
                                    onChanged: (e)=>valueChanged(e)
                                ),
                              ),
                            ),
                            new Expanded(
                              child: new ListTile(
                                title: new Text(
                                  "Female",
                                  textAlign: TextAlign.end,
                                  style: new TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                trailing:new Radio(
                                    value: "Female",
                                    groupValue: groupValue,
                                    onChanged: (e)=>valueChanged(e)
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.4),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordTextController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                icon: Icon(Icons.lock_outline)
                            ),
                            validator: (value){
                              if (value.isEmpty) {
                                return "The password field cannot be empty";
                              } else if (value.length < 6) {
                                return "the password has to be at least 6 characters long";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white.withOpacity(0.4),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: _confirmPasswordTextController,
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            border: InputBorder.none,
                            icon: Icon(Icons.lock_outline)
                        ),
                        validator: (value){
                          if (value.isEmpty) {
                            return "The password field cannot be empty";
                          } else if (value.length < 6) {
                            return "The password has to be at least 6 characters long";
                          }else if(_passwordTextController.text!=_confirmPasswordTextController.text){
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blue.shade700,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: ()async{
                            validateForm();
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            "Sign Up",
                            style: new TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0
                            ),
                          ),
                        ),
                      ),
                    ),



                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child:Text(
                          "Sign In",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                              color: Colors.blue
                          ),
                        ) ,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: loading?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  valueChanged(e) {
    setState(() {
      if(e=="Male"){
        groupValue=e;
        gender=e;
      }
      else if(e=="Female"){
        groupValue=e;
        gender=e;
      }
    });
  }

  Future validateForm() async {
    FormState formState=_formKey.currentState;
    if(formState.validate()){
      FirebaseUser firebaseUser=await firebaseAuth.currentUser();
      if(firebaseUser==null){
        firebaseAuth.createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text).then((user)=>{
              _userServices.createUser(user.uid,{
                "username":_nameController.text,
                "email":_emailTextController.text,
                "id":user.uid,
                "gender":gender,

              })

        }).catchError((e)=>{
          print(e.toString())
        })
        ;
        Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=>new HomePage()));
      }
    }
  }
}
