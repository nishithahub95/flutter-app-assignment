import 'package:assignment/constant.dart';
import 'package:assignment/main_page.dart';
import 'package:assignment/Screen/signup.dart';
import 'package:assignment/Screen/tabbar_page.dart';
import 'package:assignment/utils/Routes/route_name.dart';
import 'package:assignment/utils/Routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:shop_app_admin/shared/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId
        ));
  }

  else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,

      initialRoute: RoutesName.tabbar,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

