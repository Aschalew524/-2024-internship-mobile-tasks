import 'package:flutter/material.dart';
import 'package:task_6/pages/homePage/home_page.dart';
import 'package:task_6/pages/add_update/add_update.dart';
import 'package:task_6/pages/search/searchPage.dart';
import 'package:task_6/pages/detailspage/details.dart';
import 'package:task_6/pages/homePage/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: addPage()
    );
  }
}
//HomePage()
//addPage()
//ProductDetailsPage


