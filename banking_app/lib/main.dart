import 'package:banking_app/views/screens/home.dart';
import 'package:banking_app/views/screens/transfer_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/users_screen_controller.dart';
import 'views/screens/view_customers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => UserViewController()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
          TransferForm.routeName: (ctx) => const TransferForm(),
        },
      ),
    );
  }
}
