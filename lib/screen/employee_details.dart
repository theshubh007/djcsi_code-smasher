import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Employee_details extends StatefulWidget {
  String eid;
  Employee_details({required this.eid, super.key});

  @override
  State<Employee_details> createState() => _Employee_detailsState();
}

class _Employee_detailsState extends State<Employee_details> {
  User? user = FirebaseAuth.instance.currentUser;

  final allemployeehubref =
      FirebaseFirestore.instance.collection('All_employee_hub');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        FutureBuilder(
            future: allemployeehubref
                .doc(widget.eid)
                .collection('Experience')
                .get(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return ListTile(
                      title: Text(documentSnapshot['org_name']),
                      subtitle: Column(
                        children: [
                          Text(documentSnapshot['rating']),
                          Text(documentSnapshot['reason']),
                        ],
                      ),
                     
                    );
                  },
                );
              }
              return const Text("No Past Experience");
            })
      ],
    )));
  }
}
