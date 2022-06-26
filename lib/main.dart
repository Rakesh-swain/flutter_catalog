import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import './widgets/themes.dart';
import './screens/login_screen.dart';
import './screens/home_screen.dart';
import '../screens/cart_screen.dart';
import 'package:url_strategy/url_strategy.dart';

import 'screens/home_detail_screen.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Catalog App',
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        routes: {
          "/": (_, __) => MaterialPage(child: LoginScreen()),
          MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomeScreen()),
          MyRoutes.homeDetailsRoute: (uri, _) {
            final catalog = (VxState.store as MyStore)
                .catalog
                ?.getById(int.parse(uri.queryParameters['id'].toString()));
            return MaterialPage(
                child: HomeDetailScreen(
              catalog: catalog!,
            ));
          },
          MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginScreen()),
          MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartScreen()),
        },
      ),
      // routes: {
      //   '/home_screen': (context) => HomeScreen(),
      //   '/': (context) => LoginScreen(),
      //   '/cart': (context) => CartScreen(),
      // },
    );
  }
}
