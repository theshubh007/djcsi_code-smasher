import 'package:auth_employee/Firebase_Services.dart';
import 'package:auth_employee/login_page.dart';
import 'package:flutter/material.dart';

class Admin_info_page extends StatefulWidget {
  const Admin_info_page({super.key});

  @override
  State<Admin_info_page> createState() => _Admin_info_pageState();
}

class _Admin_info_pageState extends State<Admin_info_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Info'),
        actions: [
          IconButton(
            onPressed: () {
              Firebase_Serv.signOutGoogle();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Loginpage()),
                  (Route<dynamic> route) => false);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Placeholder(),
    );
  }
}
