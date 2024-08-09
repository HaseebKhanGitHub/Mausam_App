

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
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
    var city_name = ['Gujranwala','Lahore', 'Karachi','Peshawar','Quetta','Gilgit'];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    // Cast the arguments to a Map
    final Map<String, dynamic> info = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(// Search Container
                padding: EdgeInsets.symmetric(horizontal: 8 ),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                   GestureDetector(
                     onTap: (){},
                     child: Container(child: Icon(Icons.search,color: Colors.blue), margin: EdgeInsets.fromLTRB(3, 0, 7, 0),),
                   ),
                    Expanded(
                      child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search $city',
                        border: InputBorder.none,
                      ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
