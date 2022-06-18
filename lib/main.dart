import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/login_screen.dart';
import './screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalog App',
      themeMode: ThemeMode.light,
      // darkTheme:
      //     ThemeData(brightness: Brightness.light, primarySwatch: Colors.green),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      //initialRoute: '/',
      routes: {
        '/home_screen': (context) => HomeScreen(),
        '/': (context) => LoginScreen(),
      },
    );
  }
}
