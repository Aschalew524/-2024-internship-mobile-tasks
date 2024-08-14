import 'package:flutter/material.dart';

import 'injection_container.dart';
import 'presentation/pages/addProductPage.dart';
import 'presentation/pages/detailsPage.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/searchProductPage.dart';





void main() {
  WidgetsBinding.instance;
  init();
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
          '/search':(context)=> const SearchPage()
        },
        title: 'Flutter',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage()
    );
  }
}
//HomePage()
//addPage()
//ProductDetailsPage


