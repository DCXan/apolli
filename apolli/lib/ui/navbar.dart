import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NavbarState();
  }
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apolli'),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote), label: 'Daily Poll'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Results'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
      ]),
    );
  }
}
