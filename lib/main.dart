import 'package:delivery/pages/checkout/checkout.dart';
import 'package:delivery/pages/home/navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:delivery/pages/common/theme.dart';

// pages
import 'package:delivery/pages/home/home.dart';
import 'package:delivery/pages/cart/cart.dart';
import 'package:delivery/pages/profile/profile.dart';

import 'package:delivery/pages/meal_detail/meal_detail.dart';
import 'package:delivery/pages/payment/payment.dart';

const HomeRoute = "/";
const cartRoute = "/cart";
const MealDetailRoute = "/meal_detail";
const PaymentRoute = "/payment";
const checkOutRoute = "/checkout";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    CartView(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Goosh Foods',
      onGenerateRoute: _routes(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: SizedBox(
            height: 75,
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: (_selectedIndex == 0)
                          ? primaryColor
                          : Colors.transparent,
                    ),
                    child: Icon(
                      LineIcons.home,
                      color: (_selectedIndex == 0) ? Colors.white : primaryColor,
                    ),
                  ),
                  label: ' ',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: (_selectedIndex == 1)
                          ? primaryColor
                          : Colors.transparent,
                    ),
                    child: Icon(
                      LineIcons.shoppingBag,
                      color: (_selectedIndex == 1) ? Colors.white : primaryColor,
                    ),
                  ),
                  label: ' ',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: (_selectedIndex == 2)
                          ? primaryColor
                          : Colors.transparent,
                    ),
                    child: Icon(
                      LineIcons.user,
                      color: (_selectedIndex == 2) ? Colors.white : primaryColor,
                    ),
                  ),
                  label: ' ',
                ),
              ],
              currentIndex: _selectedIndex,
              backgroundColor: Colors.grey[100],
              elevation: 0,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
          ),
          // body: SafeArea(
          // child: FloatingNavBar(
          // unselectedIconColor: Colors.white,
          // color: Colors.white,
          // selectedIconColor: secondaryColor,
          // hapticFeedback: false,
          // showTitle: false,
          // horizontalPadding: 20,
          // cardWidth: 100,
          // items: [
          // FloatingNavBarItem(
          //   iconData: LineIcons.home,
          //   title: '',
          //   page: Home(),
          // ),
          // FloatingNavBarItem(
          //   iconData: LineIcons.shoppingBag,
          //   title: '',
          //   page: CartView(),
          // ),
          // FloatingNavBarItem(
          //   iconData: LineIcons.user,
          //   title: '',
          //   page: Profile(),
          // )
          // ],
          // ),
          // ),
        ),
      ),
    );
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
        case PaymentRoute:
          screen = Payment();
          break;
        case checkOutRoute:
          screen = CheckOut();
          break;
        case cartRoute:
          screen = CartView();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
