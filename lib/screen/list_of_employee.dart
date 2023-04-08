import 'package:auth_employee/screen/employee_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListOfEmployee extends StatefulWidget {
  const ListOfEmployee({Key? key}) : super(key: key);

  @override
  State<ListOfEmployee> createState() => _ListOfEmployeeState();
}

class _ListOfEmployeeState extends State<ListOfEmployee> {
  User? user = FirebaseAuth.instance.currentUser;
  final formkey = GlobalKey<FormState>();
  TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('Adminhub')
                  .doc(user!.uid)
                  .collection('my_employees')
                  .get(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    documentSnapshot['name'],
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(documentSnapshot['adharcard_num']),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    backgroundColor: const Color(0xffFFFFFF),
                                    title: const Text(
                                      'Enter your Feedback for employee',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    content: Form(
                                        key: formkey,
                                        child: TextFormField(
                                          controller: reasonController,
                                          maxLines: 46,
                                          minLines: 6,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 16,
                                                    top: 12,
                                                    bottom: 12,
                                                    right: 16),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9.00),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            hintText:
                                                "Enter here your feedback",
                                          ),
                                          style: const TextStyle(
                                            fontSize: 15.0,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please nter some text';
                                            }
                                            return null;
                                          },
                                        )),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () async {},
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(Icons.flag),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Employee_details(
                                                eid: documentSnapshot[
                                                    'adharcard_num'],
                                              )));
                                },
                                icon: const Icon(
                                  Icons.near_me,
                                  color: Colors.grey,
                                ))
                          ],
                        )),
                      );
                      // return ListTile(
                      //   title: Text(documentSnapshot['name']),
                      //   subtitle: Text(documentSnapshot['adharcard_num']),
                      //   trailing: IconButton(
                      //       onPressed: () {},
                      //       icon: const Icon(
                      //         Icons.near_me,
                      //         color: Colors.grey,
                      //       )),
                      // );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
