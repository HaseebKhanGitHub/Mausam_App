

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
        super.initState();
        print('This is a  init state');
  }
  @override
  Widget build(BuildContext context) {

    // Cast the arguments to a Map
    final Map<String, dynamic> info = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Activity"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        children: [
          SizedBox(height: 12,),
          Text(info['temp_value']),
          SizedBox(height: 12,),
          Text(info['hum_value']),
          SizedBox(height: 12,),
          Text(info['air_value']),
          SizedBox(height: 12,),
          Text(info['des_value']),
          SizedBox(height: 12,),
          Text(info['main_value']),



        ],
      ),
    );
  }
}
