import 'package:flutter/material.dart';
import './widgets/themes.dart';
import './screens/login_screen.dart';
import './screens/home_screen.dart';
import '../screens/cart_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalog App',
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      routes: {
        '/home_screen': (context) => HomeScreen(),
        '/': (context) => LoginScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
