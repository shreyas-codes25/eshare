// import 'package:eshare/models/drive_data_model.dart';
// import 'package:eshare/screens/home/list_tile.dart';
// import 'package:eshare/services/get_drive.dart';

import 'package:eshare/screens/folder_screen/folders.dart';
import 'package:eshare/screens/settings_screen/settings.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pageList = [
    Folders(),
    Folders(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pageList[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 7,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        selectedFontSize: 17,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(size: 28),
        selectedIconTheme: IconThemeData(size: 30),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Folders',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Recent'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        onTap: _onItemTapped,
      ),
    );
  }
}
