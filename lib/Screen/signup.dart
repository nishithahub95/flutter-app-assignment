import 'package:assignment/Screen/login.dart';
import 'package:assignment/Screen/widget/my_button.dart';
import 'package:assignment/utils/Routes/route_name.dart';
import 'package:assignment/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey,
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.7,
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
                          Text('Create an \n Account',style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.w900),),
                        ],
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller:nameController ,
                              decoration: ThemeHelper().textInputDecoration('Name', 'user name',Icons.person),
                              cursorColor: Colors.grey,
                              style: TextStyle(color: Colors.grey),
                              validator: (value) {
                                if (value!.isEmpty||!RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                                  return 'Please enter correct name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller:emailController ,
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
                              controller: phoneController,
                              decoration: ThemeHelper().textInputDecoration('Contact no', 'Phone no',Icons.phone),
                              cursorColor: Colors.grey,
                              style: TextStyle(color: Colors.grey),
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a phone number';
                                }else if(!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)){
                                  return 'Please enter valid phone number';
                                }


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
                            FormField<bool>(
                              builder: (state) {
                                return Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                          focusColor: Colors.red,

                                            activeColor: Colors.red,
                                            value: checkboxValue,
                                            side: BorderSide(color: Colors.red),
                                            onChanged: (value) {
                                              setState(() {
                                                checkboxValue = value!;
                                                state.didChange(value);
                                              });
                                            }),
                                        Row(
                                          children: [
                                            Text("I agree with ", style: TextStyle(color: Colors.black),),
                                            Text("terms and conditions.",style: TextStyle(color: Colors.red,decoration: TextDecoration.underline),)

                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        state.errorText ?? '',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                      ),
                                    )
                                  ],
                                );
                              },
                              validator: (value) {
                                if (!checkboxValue) {
                                  return 'You need to accept terms and conditions';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Already have an account?",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Sign In',
                                  textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.red),
                                )

                              ],
                            ),
                            //SizedBox(height: 5,)
                          ]
                        ),

                      ),

                    ],
                  ),
                ),
              ),
            ),
         SizedBox(height: 20,),
            MyButton(title: 'REGISTER', onPress: (){
            if (_formKey.currentState!.validate()) {
              Navigator.pushNamed(context, RoutesName.tabbar);
              _auth.createUserWithEmailAndPassword(email:
              emailController.text.toString(),
                  password:passwordController.text.toString()
              );

            }
            })

          ],
        ),
      )
    );
  }
}
