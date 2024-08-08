

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


     void getData() async{

       var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Gujranwala&appid=9f24f45f1a43cd906106cb78433a7be0');
       http.Response response = await http.get(url); // Use the Uri object with http.get
       Map data = jsonDecode(response.body); // Decode the JSON response

       /*Map temp_data = data['main'];
       double temp = temp_data['temp'];
       print(temp);*/

       List weather_data = data['weather'];  //list type
       Map weather_main_data = weather_data[0];   //dictionary type

       print(weather_data);
       print(weather_main_data['main']);


     }

  @override
  void initState() {
        super.initState();
        getData();
        print('This is a  init state');


  }


  int counter = 1;
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
            onPressed: () => setState(() {
            counter += 1;
            }),
          ),Text('$counter')
        ],
      ),




    );
  }
}
