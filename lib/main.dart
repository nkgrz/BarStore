import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';
import 'models/product.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(
          create: (context) => ProductDataProvider(),
        ),
        ChangeNotifierProvider<CartDataProvider>(
          create: (context) => CartDataProvider(),
        ),
      ],
      // builder: (context, child) {return MaterialApp(
      //   title: 'Bar Store',
      //   theme: ThemeData(
      //     textTheme: GoogleFonts.marmeladTextTheme(
      //       Theme.of(context).textTheme,
      //     ),
      //   ),
      //   home: const HomePage());
      // },
      child: MaterialApp(
        title: 'Bar Store',
        theme: ThemeData(
          textTheme: GoogleFonts.marmeladTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const HomePage(),
      ),
      
    );
  }
}

