

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Activity"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        children: [
          FloatingActionButton(
            onPressed: (){

            }
          ),Text('kuch nai')
        ],
      ),

    );
  }
}
