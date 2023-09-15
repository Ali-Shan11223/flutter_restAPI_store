import 'package:flutter/material.dart';
import 'package:flutter_restapi_storeapp/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RESTAPI Store',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade300,
        fontFamily: 'Lato',
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.white,
            )),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.blue,
          selectionHandleColor: Colors.red,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
