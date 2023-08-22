import 'package:expense_tracker_fiap/pages/categorias_page.dart';
import 'package:expense_tracker_fiap/pages/contas_page.dart';
import 'package:expense_tracker_fiap/pages/dashboard_page.dart';
import 'package:expense_tracker_fiap/pages/transacoes_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

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
      children: [
        DashBoardPage(),
        TransacoesPage(),
        ContasPage(),
        CategoriasPage()
      ],
    );
  }

  Widget getBottomNavigationBar() {
    final items = [
      BottomNavigationBarItem(
          icon: Icon(Ionicons.bar_chart_outline), label: 'Dashboard'),
      BottomNavigationBarItem(
          icon: Icon(Ionicons.swap_horizontal_outline), label: 'Transações'),
      BottomNavigationBarItem(
          icon: Icon(Ionicons.wallet_outline), label: 'Contas'),
      BottomNavigationBarItem(
          icon: Icon(Ionicons.list_outline), label: 'Categorias'),
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
