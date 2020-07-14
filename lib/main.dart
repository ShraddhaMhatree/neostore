import 'package:flutter/material.dart';
import 'package:neostore/providers/auth_provider.dart';
import 'package:neostore/providers/product_provider.dart';
import 'package:neostore/screens/home_screen.dart';
import 'package:neostore/screens/login_screen.dart';
import 'package:neostore/screens/product_description_screen.dart';
import 'package:neostore/screens/products_list.dart';
import 'package:neostore/screens/registration_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static final Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };
  MaterialColor colorCustom = MaterialColor(0xFFFE3F3F, color);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AuthProvider()),
        ChangeNotifierProvider(create: (ctx) => ProductsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Lato',
          primarySwatch: colorCustom,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 26.0, color: Colors.white, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 20.0, color: Colors.white),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        home: LoginScreen(),
        routes: {
          HomeScreen.route: (ctx) => HomeScreen(),
          RegistrationScreen.route: (ctx) => RegistrationScreen(),
          ProductsList.route: (ctx) => ProductsList(),
          ProductDescription.route : (ctx) => ProductDescription()
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Neostore'),
      ),
      body: Center(
        child: Text('Welocme to Homr page'),
      ),
    );
  }
}
