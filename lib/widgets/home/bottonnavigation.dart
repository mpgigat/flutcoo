import 'package:flutter/material.dart';

class BottonNavigation extends StatelessWidget {
  const BottonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.green,
        backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
        unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: "Calendario"),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_outline_outlined), label: "Grafica"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_outlined),
              label: "Usuarios")
        ]);
  }
}
