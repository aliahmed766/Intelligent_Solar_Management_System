import 'dart:async';

import 'package:flutter/material.dart';
import 'package:solar_calculation_system/prefrences/preference_manager.dart';
import 'package:solar_calculation_system/routeUtils/route_names.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), () async{
      bool isUserLoggedIn = await PreferenceManager.isUserLoggedIn();
      if(isUserLoggedIn){
        Navigator.pushReplacementNamed(context, RouteNames.ROUTE_HOME_SCREEN);
      }else{
        Navigator.pushReplacementNamed(context, RouteNames.ROUTE_LOGIN_SCREEN);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(width:150,height: 150,
            image: AssetImage("assets/images/solar_logo_.jpg")),
            SizedBox(height: 30,),
            Text("Welcome\n To \nSolar Calculation System", textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}

