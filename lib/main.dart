import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thamturakit_mobile/pages/bookingfilter.dart';
import 'package:thamturakit_mobile/pages/home.dart';
import 'package:thamturakit_mobile/pages/login.dart';
import './config/Palette .dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
// need this for initializeDateFormatting()
import 'package:intl/date_symbol_data_local.dart';

// This lets magic happen!
// import 'package:buddhist_datetime_dateformat/buddhist_datetime_dateformat.dart';

late Box box;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Box box = await Hive.openBox('box');
  // Hive.registerAdapter(BankAccountAdapter());
  // box.put('bankAccount', BankAccount(currency: "test", myMoney: 300));
  var box = await Hive.openBox('testBox');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  // set thai language
  Intl.defaultLocale = "th";
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          // '/': (context) => const RouteScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/login': (context) => const LoginScreen(),
        },
        theme: ThemeData(
          primarySwatch: Palette.bluetheme,
          // primarySwatch: Colors.blue.shade800,
          scaffoldBackgroundColor: const Color(0xFFEFEFEF),
          fontFamily: 'Prompt',
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
            bodyText2: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
            button: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w100),
            // and so on for every text style
          ),
        ),
        home: SafeArea(
          child: AnimatedSplashScreen(
              duration: 3000,
              splash: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpinKitFadingCube(
                    color: Palette.bluetheme,
                    size: 50.0,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 50),
                      child: Text(
                        "GO TRAVEL",
                        style: TextStyle(
                            fontSize: 40,
                            color: Palette.bluetheme,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              // nextScreen: HomeScreen(),
              nextScreen: LoginScreen(),
              splashTransition: SplashTransition.fadeTransition,
              splashIconSize: double.infinity,
              // pageTransitionType: PageTransitionType.scale,
              backgroundColor: Colors.white),
        ));
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   DateTime _startdate = DateTime(2022, 12, 24);
//   DateTime _enddate = DateTime(2022, 12, 24);
//   int _counter = 0;
//   int _weight = 0;
//   double _result = 0;
//   TextEditingController weightController = new TextEditingController();
//   List<Book> books = allBooks;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   void _calculate() {
//     setState(() {
//       _result = double.parse(weightController.text) * 2.2 * 30 / 2;
//     });
//   }

//   // Style Button
//   final ButtonStyle flatButtonStyle = TextButton.styleFrom(
//     backgroundColor: Colors.blue,
//     padding: EdgeInsets.all(8),
//   );

//   _buttonStartDate(double _height, double _width) {
//     final ButtonStyle flatButtonStyle = TextButton.styleFrom(
//         minimumSize: Size(_width, _height),
//         backgroundColor: Colors.white,
//         padding: EdgeInsets.fromLTRB(13, 13, 13, 13));
//     return TextButton(
//       style: flatButtonStyle,
//       onPressed: () async {
//         DateTime? newDate = await showDatePicker(
//             context: context,
//             initialDate: _startdate,
//             firstDate: DateTime(1900),
//             lastDate: DateTime(2100));
//         if (newDate == null) return;
//         setState(() => _startdate = newDate);
//       },
//       child: Row(children: <Widget>[
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("เช็คอิน",
//                 style: TextStyle(fontSize: 15, color: Colors.black)),
//             Text(
//               '${_startdate.day}/${_startdate.month}/${_startdate.year}',
//               style: TextStyle(fontSize: 15, color: Colors.black),
//             ),
//           ],
//         ),
//         SizedBox(width: 50),
//         Column(
//           children: [Icon(Icons.calendar_today_outlined, color: Colors.grey)],
//         ),
//       ]),
//     );
//   }

//   _buttonEndDate(double _height, double _width) {
//     final ButtonStyle flatButtonStyle = TextButton.styleFrom(
//       minimumSize: Size(_width, _height),
//       backgroundColor: Colors.white,
//       padding: EdgeInsets.fromLTRB(13, 13, 13, 13),
//     );
//     return TextButton(
//       style: flatButtonStyle,
//       onPressed: () async {
//         DateTime? newDate = await showDatePicker(
//             context: context,
//             initialDate: _enddate,
//             firstDate: DateTime(1900),
//             lastDate: DateTime(2100));
//         if (newDate == null) return;
//         setState(() => _enddate = newDate);
//       },
//       child: Row(children: <Widget>[
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("เช็คเอาท์",
//                 style: TextStyle(fontSize: 15, color: Colors.black)),
//             Text(
//               '${_enddate.day}/${_enddate.month}/${_enddate.year}',
//               style: TextStyle(fontSize: 15, color: Colors.black),
//             ),
//           ],
//         ),
//         SizedBox(width: 50),
//         Column(
//           children: [Icon(Icons.calendar_today_outlined, color: Colors.grey)],
//         ),
//       ]),
//     );
//   }

//   void searchBook(String query) {
//     final suggestions = allBooks.where((book) {
//       final bookTitles = book.title.toLowerCase();
//       final input = query.toLowerCase();
//       return bookTitles.contains(input);
//     }).toList();

//     setState(() => books = suggestions);
//   }

//   @override
//   Widget build(BuildContext context) => Container(
//         constraints: BoxConstraints.expand(),
//         decoration: const BoxDecoration(),
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           // backgroundColor: Colors.transparent,
//           appBar: AppBar(title: ThemeBar().getImageLogo()),
//           body: Column(),
//         ),
//       );
// }
