import 'package:firebase_core/firebase_core.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:delivery/pages/common/theme.dart';

// pages
import 'package:delivery/pages/home/home.dart';
import 'package:delivery/pages/cart/cart.dart';
import 'package:delivery/pages/profile/profile.dart';

import 'package:delivery/pages/meal_detail/meal_detail.dart';

const HomeRoute = "/";
const MealDetailRoute = "/meal_detail";

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // FirebaseApp defaultApp = await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Goosh Foods',
        onGenerateRoute: _routes(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          backgroundColor: bgColor,
          body: SafeArea(
            child: FloatingNavBar(
              unselectedIconColor: Colors.white,
              color: primaryColor,
              selectedIconColor: secondaryColor,
              hapticFeedback: false,
              showTitle: true,
              horizontalPadding: 50,
              cardWidth: 100,
              items: [
                FloatingNavBarItem(
                  iconData: LineIcons.home,
                  title: 'Home',
                  page: Home(),
                ),
                FloatingNavBarItem(
                  iconData: LineIcons.shoppingBag,
                  title: 'Cart',
                  page: CartView(),
                ),
                FloatingNavBarItem(
                  iconData: LineIcons.user,
                  title: 'My Profile',
                  page: Profile(),
                )
              ],
            ),
          ),
        ));
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;

      switch (settings.name) {
        case HomeRoute:
          screen = MyApp();
          break;
        case MealDetailRoute:
          screen = MealDetail(arguments['id']);
          break;

        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
