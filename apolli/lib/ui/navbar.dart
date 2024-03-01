import 'package:apolli/screens/daily_poll.dart';
import 'package:apolli/screens/profile.dart';
import 'package:apolli/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NavbarState();
  }
}

class _NavbarState extends State<Navbar> {
  int _selectedPageIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen;
    String activeScreenTitle;

    // if (_selectedPageIndex == 1) {
    //   activeScreen = const ResultsScreen();
    //   activeScreenTitle = 'Results';
    // }
    // else if (_selectedPageIndex == 2) {
    //   activeScreen = const ProfileScreen();
    //   activeScreenTitle = 'Profile';
    // }

    switch (_selectedPageIndex) {
      case 1:
        {
          activeScreen = const ResultsScreen();
          activeScreenTitle = 'Results';
        }
        break;
      case 2:
        {
          activeScreen = const ProfileScreen();
          activeScreenTitle = 'Profile';
        }
        break;
      default:
        {
          activeScreen = const DailyPollScreen();
          activeScreenTitle = 'Daily Poll';
        }
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Theme.of(context).primaryColorLight,
        iconSize: 36,
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          _selectScreen(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.how_to_vote,
              color: Color.fromARGB(255, 231, 111, 81),
            ),
            label: 'Daily Poll',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
              color: Color.fromARGB(255, 42, 157, 143),
            ),
            label: 'Results',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 0, 151, 211),
            ),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
