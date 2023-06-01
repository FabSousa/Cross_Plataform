import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/pages/details_page.dart';
import 'package:ias_generativas_e_ods2/pages/filter_page.dart';
import 'package:ias_generativas_e_ods2/pages/history_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "IAs Generativas e ODS2",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        DetailsPage.routeName: (context) => const DetailsPage(),
        HistoryPage.routeName: (context) => const HistoryPage(),
        FilterPage.routeName: (context) => const FilterPage(),
      },
    );
  }
}
