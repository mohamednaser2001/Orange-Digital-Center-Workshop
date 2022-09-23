import 'dart:async';

import 'package:flutter/material.dart';
import 'package:orange_workshop/core/resources/constants.dart';
import 'package:orange_workshop/view/pages/layout/home_layout.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:orange_workshop/view/components/core/core_components.dart';

import '../login/login_screen.dart';

class SplashScreen extends  StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(
        const Duration(seconds: 2,),
            () { Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(
              builder: (context)=>token==null ? LoginScreen() : HomeLayout()),
              (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          orangeHeader(),
          const SizedBox(height: 70.0,),
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: LinearPercentIndicator(
              barRadius:const Radius.circular(8.0),
              percent: 1,
              progressColor: Colors.deepOrange,
              backgroundColor: Colors.grey[400],
              animationDuration: 1000,
              lineHeight: 10.0,
              animation: true,
            ),
          ),
        ],

      ),
    );
  }
}