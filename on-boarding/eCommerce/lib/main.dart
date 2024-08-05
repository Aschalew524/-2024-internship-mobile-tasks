import 'package:flutter/material.dart';

import 'presentation/addProductPage/addPage.dart';
import 'presentation/detailsPage/detailsPage.dart';
import 'presentation/home_page/homePage.dart';
import 'presentation/searchProductPage/searchPage.dart';




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
          '/home': (context) => const HomePage(),
          '/detail': (context) => ProductDetailsPage(),
          '/add':(context)  =>   const addPage(),
          '/search':(context)=> const searchPage()
        },
        title: 'Flutter',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const addPage()
    );
  }
}
//HomePage()
//addPage()
//ProductDetailsPage


