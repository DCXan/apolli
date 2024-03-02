import 'package:apolli/screens/daily_poll.dart';
import 'package:apolli/screens/profile.dart';
import 'package:apolli/screens/results.dart';
import 'package:flutter/material.dart';

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
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedPageIndex,
        onDestinationSelected: (index) {
          _selectScreen(index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.how_to_vote,
              color: Color.fromARGB(255, 231, 111, 81),
            ),
            label: 'Daily Poll',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.bar_chart,
              color: Color.fromARGB(255, 42, 157, 143),
            ),
            label: 'Results',
          ),
          NavigationDestination(
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
