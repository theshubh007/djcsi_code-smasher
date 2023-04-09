import 'package:auth_employee/style/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Employee_details extends StatefulWidget {
  String eid;
  String ename;
  Employee_details({required this.eid, required this.ename, super.key});

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
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
          // ),
          backgroundColor: const Color(0xff6096B4),
          title: Text('${widget.ename} Details'),
        ),
        backgroundColor: const Color(0xff6096B4),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 20, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.eid,
                style: headingTitle2,
              ),
              FutureBuilder(
                  future: allemployeehubref
                      .doc(widget.eid)
                      .collection('Experience')
                      .get(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var rating = snapshot.data!.docs[index]['rating'];
                            return ListTile(
                              tileColor:
                                  const Color.fromARGB(255, 221, 221, 221),
                              title: Text(
                                snapshot.data!.docs[index]['org_name'],
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Feedback from employer",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff18939b))),
                                  Text(snapshot.data!.docs[index]['reason'],
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white)),
                                  SizedBox(
                                      height: 50,
                                      child: rating == 1
                                          ? const Icon(
                                              Icons.flag,
                                              color: Colors.red,
                                              size: 30,
                                            )
                                          : rating == 2
                                              ? const Icon(
                                                  Icons.flag,
                                                  color: Colors.orange,
                                                  size: 30,
                                                )
                                              : rating == 3
                                                  ? const Icon(
                                                      Icons.flag,
                                                      color: Colors.yellow,
                                                      size: 30,
                                                    )
                                                  : const Icon(
                                                      Icons.flag,
                                                      color: Colors.green,
                                                      size: 30,
                                                    ))
                                ],
                              ),
                            );
                          });
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        )));
  }
}
