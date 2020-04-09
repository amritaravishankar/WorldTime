import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';
import 'package:world_time_app/pages/choose_location_page.dart';
import 'package:world_time_app/pages/default_location.dart';
import 'package:world_time_app/pages/favourites.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      //'/settings': (context) => Settings(),
      '/location': (context) => ChoosePage(),
      '/default_loc': (context) => Default(),
      '/favourite': (context) => Favourites(),
    }
));
