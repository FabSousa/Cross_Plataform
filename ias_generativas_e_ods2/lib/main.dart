import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/pages/dashboard_page.dart';
import 'package:ias_generativas_e_ods2/pages/details_page.dart';
import 'package:ias_generativas_e_ods2/pages/filter_page.dart';
import 'package:ias_generativas_e_ods2/pages/galeria_page.dart';
import 'package:ias_generativas_e_ods2/pages/history_page.dart';

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
        initialRoute: DashboardPage.routeName,
        routes: {
          DashboardPage.routeName: (context) => const DashboardPage(),
          GaleryPage.routeName: (context) => const GaleryPage(),
          HistoryPage.routeName: (context) => const HistoryPage(),
          FilterPage.routeName: (context) => const FilterPage(),
          DetailsPage.routeName: (context) => const DetailsPage(),
        });
  }
}
