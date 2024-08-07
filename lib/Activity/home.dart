

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


     void getData() async{
     //Response response =await get('https://timeapi.io/api/Time/current/zone?timeZone=Europe/Amsterdam');

       var url = Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=Europe/Amsterdam');
       //http.Response response = await http.get(url);
       http.Response response = await http.get(url);

     print(response.body);
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
