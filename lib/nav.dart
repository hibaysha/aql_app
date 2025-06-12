import 'package:aql_app/constants/dx_icons.dart';
import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/dx_icon.dart';
import 'package:aql_app/screens/homepage/homepage.dart';
import 'package:aql_app/screens/my_profile/my_profile.dart';
import 'package:aql_app/screens/stream/stream_screen.dart';
import 'package:aql_app/screens/subjects/subject_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BottomNav());
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Homepge(),
    SubjectScreen(),
    StreamScreen(),
    MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DxColors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: DxColors.naviconclr,
        unselectedItemColor: DxColors.navgrey.withOpacity(0.40),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: DxIcon(DxIcons.home, color: DxColors.navgrey.withOpacity(.4)),
            label: 'Home',
            activeIcon: DxIcon(DxIcons.home, color: DxColors.naviconclr),
          ),
          BottomNavigationBarItem(
            icon: DxIcon(DxIcons.teacher),
            label: 'Subject',
            activeIcon: DxIcon(DxIcons.teacher, color: DxColors.naviconclr),
          ),
          BottomNavigationBarItem(
            icon: DxIcon(DxIcons.docu),
            label: 'Streams',
            activeIcon: DxIcon(DxIcons.docu, color: DxColors.naviconclr),
          ),
          BottomNavigationBarItem(
            icon: DxIcon(DxIcons.user),
            label: 'My Profile',

            activeIcon: DxIcon(DxIcons.user, color: DxColors.naviconclr),
          ),
        ],
      ),
    );
  }
}
