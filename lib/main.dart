import 'package:flutter/material.dart';
import 'pages/movieCard.dart';
import 'pages/Home.dart';
import 'pages/chooseGenre.dart';
import 'pages/loading.dart';
import 'pages/startingPage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/startPage',
    routes: {
      '/Loading' : (context) => Loading(),
      '/movieCard': (context) => movieCard(),
      '/Home': (context) => Home(),
      '/chooseGenre': (context) => chooseGenre(),
      '/startPage' :(context) => StartPage(),
    },
  ));
}
