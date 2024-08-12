import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';

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
    var city_name = [
      'Gujranwala',
      'Lahore',
      'Karachi',
      'Peshawar',
      'Quetta',
      'Gilgit'
    ];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    // Cast the arguments to a Map
    final Map<String, dynamic> info =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String temp = ((info['temp_value']).toString()).substring(0,4);
    //Map info = ModalRoute.of(context).settings.arguments;

    String icon = info['icon_value'];
    String getcity = info['city_value'];
    String hum = info['hum_value'];
    String air_speed = (((info['air_value']).toString()).substring(0,4));
    String des = info['des_value'];




    return Scaffold(
      resizeToAvoidBottomInset: false ,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: GradientAppBar(
            gradient: LinearGradient(colors: [
              Colors.blue,
              Colors.blue.shade200,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          )),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue.shade800, Colors.blue.shade300])),
          child: Column(
            children: [
              Container(
                // Search Container
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Icon(Icons.search, color: Colors.blue),
                        margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
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
              ),
              Row(children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.5)),
                    child: Row(
                      children: [
                        Image.network('https://openweathermap.org/img/wn/$icon@2x.png',width: 70,height: 70,),
                        SizedBox(width: 30),
                        Column(
                          children: [
                            Text(des.toUpperCase() ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            Text('In $getcity',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))],
                        )
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    padding: EdgeInsets.all(20),
                  ),
                ),
              ]),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white.withOpacity(0.5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(image: AssetImage('assets/images/therm.png' ), height: 50,width: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('$temp',style: TextStyle(fontSize: 90),),
                              Text('C', style: TextStyle(fontSize: 30),)
                            ],
                          )
                        ],

                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      padding: EdgeInsets.all(26),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white.withOpacity(0.5)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(WeatherIcons.day_cloudy_windy),
                            ],
                          ),
                          SizedBox(height: 30),
                          Text('$air_speed',style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                          Text('km/hr')
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(25, 0, 10, 0),
                      padding: EdgeInsets.all(26),
                      height: 200,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white.withOpacity(0.5)),
                      child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(WeatherIcons.humidity),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text('$hum',style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                        Text('km/hr')
    ],
    ),

                      margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                      padding: EdgeInsets.all(26),
                      height: 200,
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Text('Made By Haseeb Khan'),
                    Text('Powered By openweathermap.org')
                  ],
                ),
                padding: EdgeInsets.all(20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
