import 'package:flutter/material.dart';
import 'package:simple_e_commerce_app/feature/home/data/dummy_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: navItems[_currentIndex]["widget"],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items:
            navItems
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: item["icon"],
                    label: item["label"],
                  ),
                )
                .toList(),
      ),
    );
  }
}
