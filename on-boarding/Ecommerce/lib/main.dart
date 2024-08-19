import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/product/presentation/pages/addProductPage.dart';
import 'features/product/presentation/pages/detailsPage.dart';
import 'features/product/presentation/pages/home_page.dart';
import 'features/product/presentation/pages/searchProductPage.dart';
import 'injection_container.dart'; 



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // Ensure that dependency injection is initialized before running the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [/*  */
        BlocProvider(
          create: (context) => sl<ProductBloc>(), 
        ) 
      ],
      child: MaterialApp(
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/detail': (context) => ProductDetailsPage(),
          '/add': (context) => const addPage(),
          '/search': (context) => const SearchPage(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
} 

/*  import 'package:flutter/material.dart';

import 'features/auth/presentation/pages/signin_page.dart';
import 'features/auth/presentation/pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SigninPage(),
    );
  }
}
 










 */