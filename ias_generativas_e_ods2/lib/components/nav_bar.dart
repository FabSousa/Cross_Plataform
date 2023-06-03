import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/pages/dashboard_page.dart';
import 'package:ias_generativas_e_ods2/pages/galeria_page.dart';
import 'package:ias_generativas_e_ods2/pages/history_page.dart';

class NavBar extends StatelessWidget {
  final int index;

  const NavBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final items = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.photo_album_outlined), label: 'Galeria'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.history), label: 'Histórico'),
    ];

    return BottomNavigationBar(
      currentIndex: index,
      items: items,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        List<String> routeNames = List.of([
          DashboardPage.routeName,
          GaleryPage.routeName,
          HistoryPage.routeName,
        ]);

        Navigator.popAndPushNamed(context, routeNames[index]);
      },
    );
  }
}
