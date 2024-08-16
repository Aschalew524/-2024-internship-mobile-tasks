import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'presentation/bloc/product_bloc.dart';
import 'presentation/pages/addProductPage.dart';
import 'presentation/pages/detailsPage.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/searchProductPage.dart';
import 'injection_container.dart'; // Import your injection container

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
   init(); // Ensure this completes successfully
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductBloc>(), 
        ),
      ],
      child: MaterialApp(
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/detail': (context) => ProductDetailsPage(),
          '/add': (context) => const addPage(),
          '/search': (context) => const SearchPage(),
        },
        title: 'Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
