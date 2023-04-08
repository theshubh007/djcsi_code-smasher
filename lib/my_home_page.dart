import 'package:auth_employee/Firebase_Services.dart';
import 'package:auth_employee/login_page.dart';
import 'package:auth_employee/screen/home_page.dart';
import 'package:auth_employee/screen/list_of_employee.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ListOfEmployee()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home Page'),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Firebase_Serv.signOutGoogle();
      //         Navigator.of(context).pushAndRemoveUntil(
      //             MaterialPageRoute(builder: (context) => const Loginpage()),
      //             (Route<dynamic> route) => false);
      //       },
      //       icon: const Icon(Icons.logout),
      //     ),
      //   ],
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff76B5C5),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30,),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, size: 30),
            label: 'List',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
