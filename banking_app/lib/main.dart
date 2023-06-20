import 'package:banking_app/views/screens/home.dart';
import 'package:flutter/material.dart';

import 'views/screens/view_customers.dart';
import 'views/screens/view_transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sparks Bank',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(
          255,
          7,
          42,
          108,
        ),
        fontFamily: 'OpenSans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(
            255,
            7,
            42,
            108,
          ),
        ),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      home: const Home(),
      routes: {
        ViewCutomers.routeName: (ctx) => const ViewCutomers(),
        ViewTransactions.routeName: (ctx) => const ViewTransactions(),
      },
    );
  }
}
