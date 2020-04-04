import 'package:flutter/material.dart';
import 'package:worldclock/pages/home.dart';
import 'package:worldclock/pages/location.dart';
import 'package:worldclock/pages/loading.dart';


void main() =>runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context)=>Loading(),
    '/home': (context)=>Home(),
    '/location': (context)=>ChooseLocation(),
  },
));