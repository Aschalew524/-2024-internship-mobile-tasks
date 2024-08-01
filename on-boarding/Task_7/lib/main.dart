import 'package:flutter/material.dart';
import 'package:task_7/addProductPage/addPage.dart';
import 'package:task_7/detailsPage/detailsPage.dart';
import 'package:task_7/home_page/homePage.dart';
import 'package:task_7/searchProductPage/searchPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        initialRoute: '/',
        routes:  {
          '/home': (context) => HomePage(),
          '/detail': (context) => ProductDetailsPage(),
          '/add':(context)  =>   addPage(),
          '/search':(context)=> searchPage()
        },
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


