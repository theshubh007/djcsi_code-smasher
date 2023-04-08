import 'package:flutter/material.dart';


class ListOfEmployee extends StatefulWidget {
  const ListOfEmployee({Key? key}) : super(key: key);

  @override
  State<ListOfEmployee> createState() => _ListOfEmployeeState();
}

class _ListOfEmployeeState extends State<ListOfEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6096B4),
      body: SafeArea(
        child: Center(
          child: Text("HELLO"),
        ),
      ),
    );;
  }
}
