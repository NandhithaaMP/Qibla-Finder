import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qibla_compass/screens/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 4),() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    },);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100,),
          Image.asset("asset/images/qibla-compass.png",scale: 3,color: Colors.green.shade900,),
          SizedBox(height: 100,),
          Center(child: Text("Welcome to Qibla Compass",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}
