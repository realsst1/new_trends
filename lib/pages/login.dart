import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_trends/pages/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_trends/pages/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;


  @override
  void initState() {
    super.initState();
    isSignedIn();
  }


  void isSignedIn() async{
    setState(() {
      loading=true;
    });

    FirebaseUser user=await firebaseAuth.currentUser().then((user){
      if(user!=null){
        setState(() {
          isLogedin=true;
        });
      }

    });


    if(isLogedin){
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=>new HomePage()));
    }

    setState(() {
      loading=false;
    });
  }

 /* Future handleSignIn() async{
    preferences=await SharedPreferences.getInstance();
    setState(() {
      loading=true;
    });

    GoogleSignInAccount googleUser=await googleSignIn.signIn();
    GoogleSignInAuthentication authentication=await googleUser.authentication;
    FirebaseUser firebaseUser=await firebaseAuth.signInWithGoogle(idToken: authentication.idToken, accessToken: authentication.accessToken);

    if(firebaseUser!=null){
      final QuerySnapshot result=await Firestore.instance.collection("users").where("id",isEqualTo: firebaseUser.uid).getDocuments();
      final List<DocumentSnapshot> documents=result.documents;
      if(documents.length==0){
        Firestore.instance.collection("users").document(firebaseUser.uid).setData({
          "id":firebaseUser.uid,
          "username":firebaseUser.displayName,
          "profilePicture":firebaseUser.photoUrl
        });

        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("photoURL", firebaseUser.photoUrl);

      }
      else{
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("photoURL", documents[0]['profilePicture']);
      }

      Fluttertoast.showToast(msg: "Logged In");
      setState(() {
        loading=false;
      });
    }
    else{

    }
  }
*/
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
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.4),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _passwordTextController,
                            obscureText: true,
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
                        color: Colors.blue.shade700,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: (){},
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            "Login",
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
                      child: Text(
                        "Forgot Password",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                        },
                        child:Text(
                          "Sign Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.0
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
}
