import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/pages/dashboard_page.dart';
import 'package:ias_generativas_e_ods2/pages/galeria_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = "/";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: index,
      children: const [
        DashboardPage(),
        GaleryPage(),
      ],
    );
  }

  Widget getBottomNavigationBar() {
    final items = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.photo_album_outlined), label: 'Galeria'),
    ];

    return BottomNavigationBar(
      currentIndex: index,
      items: items,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          this.index = index;
        });
      },
    );
  }
}
