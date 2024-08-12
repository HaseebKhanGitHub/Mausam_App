import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:mausam_app/main.dart';

class worker {
  String location;

  worker({required this.location}) {
    location = this.location;
  }

  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;

  Future<void> getData() async {

    try{
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=9f24f45f1a43cd906106cb78433a7be0');
      http.Response response =
      await http.get(url); // Use the Uri object with http.get
      Map data = jsonDecode(response.body); // Decode the JSON response

     // print(data);
      //temperature, humidity
      Map temp_data = data['main'];
      double getTemp = temp_data['temp'] - 273.15;
      String getHumidity = temp_data['humidity'].toString();

      //Getting AirSpeed
      Map wind = data['wind'];
      double getAirspeed = wind['speed']*3.6;

      //Getting Description
      List weather_data = data['weather']; //list type
      Map weather_main_data = weather_data[0]; //dictionary type
      String getMaindes = weather_main_data['main'];
      String getDesc = weather_main_data['description'];


      //Assigning values
      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAirspeed.toString();
      description = getDesc;
      main = getMaindes;
      icon = weather_main_data['icon'];
    } catch(e)
    {
      temp = 'Cannot Find Data';
      humidity = 'Cannot Find Data';
      air_speed = 'Cannot Find Data';
      description = 'Cannot Find Data';
      main = 'Cannot Find Data';
      icon = '03n';
    }
    }

    }



