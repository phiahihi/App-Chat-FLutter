import 'dart:ui';

import 'package:app_chat/widget/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Index 1: School',
      style: optionStyle,
    ),
    const HomePage(),
    const Text(
      'Index 3: School',
      style: optionStyle,
    ),
    const Text(
      'Index 4: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        child: Scaffold(
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(0, 0),
                    blurRadius: 3,
                    spreadRadius: 5,
                  )
                ]
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  elevation: 10,
                  selectedIconTheme: const IconThemeData(size: 32),
                  items: [
                    BottomNavigationBarItem(
                        icon: Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(color: Color.fromRGBO(255, 230, 230, 1), borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: const Icon(Icons.article_outlined, size: 30.0, color: Color.fromRGBO(246, 105, 105, 1),),
                        ),
                        backgroundColor: Colors.white,
                        label: 'Diary',
                        activeIcon: Container(
                          child: const Icon(Icons.article_outlined, color: Colors.white,),
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(color: const Color.fromRGBO(246, 105, 105, 1), borderRadius: BorderRadius.circular(10)),
                        )
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(color: Color.fromRGBO(255, 230, 230, 1), borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: const Icon(Icons.message_outlined, size: 30.0, color: Color.fromRGBO(246, 105, 105, 1),),
                      ),
                      backgroundColor: Colors.white,
                      label: 'Message',
                      activeIcon: Container(
                        child: const Icon(Icons.message_outlined, color: Colors.white,),
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(color: const Color.fromRGBO(246, 105, 105, 1), borderRadius: BorderRadius.circular(10)),
                      )
                    ),
                    BottomNavigationBarItem(
                        icon: Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(color: Color.fromRGBO(255, 230, 230, 1), borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: const Icon(Icons.task_outlined, size: 30.0, color: Color.fromRGBO(246, 105, 105, 1),),
                        ),
                        backgroundColor: Colors.white,
                        label: 'Daily Task',
                        activeIcon: Container(
                          child: const Icon(Icons.task_outlined, color: Colors.white,),
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(color: const Color.fromRGBO(246, 105, 105, 1), borderRadius: BorderRadius.circular(10)),
                        )
                    ),
                    BottomNavigationBarItem(
                        icon: Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(color: Color.fromRGBO(255, 230, 230, 1), borderRadius: const BorderRadius.all(Radius.circular(10))),
                          child: const Icon(Icons.person_outline, size: 30.0, color: Color.fromRGBO(246, 105, 105, 1),),
                        ),
                        backgroundColor: Colors.white,
                        label: 'Profile',
                        activeIcon: Container(
                          child: const Icon(Icons.person_outline, color: Colors.white,),
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(color: const Color.fromRGBO(246, 105, 105, 1), borderRadius: BorderRadius.circular(10)),
                        )
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor: const Color.fromRGBO(246, 105, 105, 1),
                  onTap: _onItemTapped,
                  iconSize: 25.0),
            ),
          ),
        ),
      ),
    );
  }
}
