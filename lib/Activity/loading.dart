import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam_app/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late String temp;
  late String hum;
  late String air_speed;
  late String des;
  late String main;


  void startApp() async {
    worker instance = worker(location: 'Lahore');
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;

    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, '/home',
          arguments: {
            'temp_value' : temp,
            'hum_value' : hum,
            'air_value' : air_speed,
            'des_value' : des,
            'main_value' : main,
    });

    }

    );


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image.asset('wlogo.png',height: 100,width: 100,),
              Image(image: AssetImage('assets/images/wlogo.png'),height: 230,width: 350,),
              Text('Mausam App', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500,color: Colors.white),),
              Text('Made By Haseeb Khan',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
                SizedBox(height: 20,),
                SpinKitThreeBounce(
        color: Colors.white,
        size: 30.0,
      ),
      ],
          ),
        ),
      backgroundColor: Colors.blue.shade200,
        );

  }
}
