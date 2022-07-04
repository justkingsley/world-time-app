import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';
import 'package:world_time_app/pages/choose_location.dart';

void main() => runApp(MaterialApp(
  //(context) keeps track of where in the widget tree we are
  //initialRoute determines which route we will got to first.
  initialRoute: '/home',
  routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocation(),
  },
));
