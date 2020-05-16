import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_gas/const.dart';
import 'package:my_gas/history/filter_page.dart';
import 'package:my_gas/history/history_tab.dart';
import 'package:my_gas/home/home_tab.dart';
import 'package:my_gas/notification/notification_tab.dart';
import 'package:my_gas/profile/profile_tab.dart';
import 'package:my_gas/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insegna',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: HexColor('#F5322B'),
        primarySwatch: Colors.red,
//        primaryColor: Colors.red,
        accentColor: Colors.blue,
//        fontFamily: 'Roboto',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
//                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
      ),
//      home: SplashScreen(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => SplashScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => MyHomePage(),
        'home_tab': (context) => HomeTabe(),
      },

//      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTabIndex = 0;
  String titleApp = 'Insegna';
  String userId = '';
  List<Widget> tabs = [
    HomeTabe(),
    HistoryTab(),
    NotificationTab(),
    ProfileTab(),
  ];
//on tap tabs
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
      if (currentTabIndex == 0) {
        titleApp = 'HOME';
      } else if (currentTabIndex == 1) {
        titleApp = 'HISTORY';
      } else if (currentTabIndex == 2) {
        titleApp = 'NOTIFICATIONS';
      } else if (currentTabIndex == 3) {
        titleApp = 'PROFILE';
      } else {
        titleApp = 'INSEGNA';
      }
    });
  }

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = AppBar(
      title: Text(
        titleApp,
        style: Theme.of(context).textTheme.title,
      ),
      automaticallyImplyLeading: false,
    );

    final PreferredSizeWidget jobAppBar = AppBar(
      title: Text(
        titleApp,
        style: Theme.of(context).textTheme.title,
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.tune,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            }),
      ],
      automaticallyImplyLeading: false,
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: currentTabIndex == 1 ? jobAppBar : appBar,
      body: WillPopScope(child: tabs[currentTabIndex], onWillPop: onWillPop),
//      body: tabs[currentTabIndex],
      endDrawer: currentTabIndex == 1 ? FilterPage() : null,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        onTap: onTapped,
        selectedItemColor: HexColor('#F5322B'),
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        currentIndex: currentTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_active,
            ),
            title: Text('Notification'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }

  DateTime currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 1)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Double press back to exit');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
