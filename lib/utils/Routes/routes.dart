
import 'package:assignment/Screen/home.dart';
import 'package:assignment/Screen/login.dart';
import 'package:assignment/Screen/signup.dart';
import 'package:assignment/Screen/tabbar_page.dart';
import 'package:assignment/utils/Routes/route_name.dart';
import 'package:flutter/material.dart';

class Routes{
  static MaterialPageRoute generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>const Home());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>const LogIn());
      case RoutesName.signup:
      //var event=settings.arguments as Eventsa ;
        return MaterialPageRoute(builder: (BuildContext context) =>  const SignUp());
      case RoutesName.tabbar:
      //var event=settings.arguments as Eventsa ;
        return MaterialPageRoute(builder: (BuildContext context) =>  const TabBarPage());

      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}
