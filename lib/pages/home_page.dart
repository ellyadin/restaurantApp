// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:restaurant_app/restaurant.dart';
import 'package:restaurant_app/pages/restaurant_list_page.dart';
import 'package:restaurant_app/pages/restaurant_detail_page.dart';
import 'package:restaurant_app/platform_widget.dart';

import '../platform_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  static const routeName = '/restaurant-list';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: buildAndroid, iosBuilder: buildiOS);
  }

  Widget buildAndroid(BuildContext context) {
    return Scaffold(
      body: (bottomNavIndex == 0) ? ArticleListPage() : SettingsPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        selectedItemColor: Colors.amber,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (value) {
          setState(() {
            bottomNavIndex = value;
          });
        },
      ),
    );
  }

  Widget buildiOS(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.amber,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (value) {
          setState(() {
            bottomNavIndex = value;
          });
        },
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return ArticleListPage();
        } else {
          return ArticleListPage();
        }
      },
    );
  }
}
