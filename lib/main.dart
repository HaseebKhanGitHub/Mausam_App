

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mausam_app/Activity/home.dart';
import  'package:mausam_app/Activity/location.dart';
import 'package:mausam_app/Activity/loading.dart';
import 'package:http/http.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Home(),
    routes: {
      '/' : (context) => Loading(),
     '/home' :  (context) => Home(),
      '/loading' :  (context) => Loading(),
    },


));
}