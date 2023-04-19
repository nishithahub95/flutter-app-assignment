import 'package:assignment/Screen/home.dart';
import 'package:assignment/Screen/widget/my_button.dart';
import 'package:assignment/utils/Routes/route_name.dart';
import 'package:assignment/utils/theme_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool loading=false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();

    passwordController.dispose();
  }

  void login(){
    setState(() {
      loading=true;
    });
    _auth.signInWithEmailAndPassword(email:emailController.text.toString(), password: passwordController.text.toString());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: MediaQuery.of(context).size.height*0.70,
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height*0.7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text('Signin into your \n Account',style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.w900),),
                        ],
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: emailController,
                                decoration: ThemeHelper().textInputDecoration('Email', 'email',Icons.email),
                                cursorColor: Colors.grey,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Colors.grey),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a Email';
                                  }
                                  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                                    return 'Please enter a valid Email';
                                  }
                                  return null;
                                },

                              ),
                              SizedBox(
                                height: 10,
                              ),

                              TextFormField(
                                controller: passwordController,
                                decoration: ThemeHelper().textInputDecoration('Password', '',Icons.lock),
                                cursorColor: Colors.grey,
                                obscureText: true,
                                obscuringCharacter: '*',
                                style: TextStyle(color: Colors.grey),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter your password";
                                  }
                                  else if(val.length<6){
                                    return "please enter atleast 6";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10,0,10,20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {

                                  },
                                  child: Text( "Forgot your password?", style: TextStyle( color: Colors.red, ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Text("Login with",  style: TextStyle(color: Colors.black),),
                              SizedBox(height: 25.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child: FaIcon(
                                      FontAwesomeIcons.google, size: 35,
                                      color: Colors.blue,
                                      //color: HexColor("#EC2D2F"),
                                       ),
                                    onTap: () {

                                    },
                                  ),
                                  SizedBox(width: 20.0,),
                                  InkWell(
                                 child: FaIcon(
                                      FontAwesomeIcons.facebook, size: 35,
                                     color: Colors.blue,
                                     // color: HexColor("#3E529C"),
                                      ),

                                  ),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Don't have an account?",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Register Now',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.red),
                                  )

                                ],
                              ),
                              SizedBox(height: 60,)
                            ]
                        ),

                      ),

                    ],
                  ),
                ),
              ),
            ),
           SizedBox(
             height: 10,
           ),
           MyButton(title: 'LOGIN', onPress: () {
             if (_formKey.currentState!.validate()) {
               login();
               Navigator.pushNamed(context, RoutesName.home);
             }
           }
    )

          ],

        ),
      ),
    );
  }
}
