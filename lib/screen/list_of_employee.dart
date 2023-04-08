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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
        ),
        backgroundColor: Colors.transparent,
        title: const Text('List of Your Employees'),
      ),
      backgroundColor: const Color(0xff191a1f),
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
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color(0xff31343b),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14, vertical: 4),
                                        child: Text(
                                          documentSnapshot['name'],
                                          style: const TextStyle(
                                              fontSize: 24,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14, vertical: 0),
                                        child: Text(
                                            documentSnapshot['adharcard_num'],
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 0),
                                  child: IconButton(
                                    onPressed: () {
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            var selectvalue = 1;
                                            return StatefulBuilder(builder:
                                                (BuildContext context,
                                                    setState) {
                                              return AlertDialog(
                                                backgroundColor: Colors.white,
                                                title: const Text(
                                                  'Enter your Feedback for employee',
                                                  style:
                                                      TextStyle(fontSize: 25),
                                                ),
                                                content: Column(
                                                  children: [
                                                    SizedBox(
                                                      width: 300,
                                                      height: 80,
                                                      child:
                                                          DropdownButton<int>(
                                                        value: selectvalue,
                                                        onChanged:
                                                            (int? newValue) {
                                                          setState(() {
                                                            selectvalue =
                                                                newValue!;
                                                          });
                                                        },
                                                        items: [
                                                          DropdownMenuItem<int>(
                                                            value: 1,
                                                            child: Row(
                                                              children: const [
                                                                Icon(Icons.flag,
                                                                    color: Colors
                                                                        .red,
                                                                    size: 50),
                                                                Text(
                                                                  'criminal record',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          DropdownMenuItem<int>(
                                                            value: 2,
                                                            child: Row(
                                                              children: const [
                                                                Icon(Icons.flag,
                                                                    color: Colors
                                                                        .orange,
                                                                    size: 50),
                                                                Text(
                                                                  'bad behaviour',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          DropdownMenuItem<int>(
                                                            value: 3,
                                                            child: Row(
                                                              children: const [
                                                                Icon(Icons.flag,
                                                                    color: Colors
                                                                        .yellow,
                                                                    size: 50),
                                                                Text(
                                                                  'bad performance',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          DropdownMenuItem<int>(
                                                            value: 4,
                                                            child: Row(
                                                              children: const [
                                                                Icon(Icons.flag,
                                                                    color: Colors
                                                                        .green,
                                                                    size: 50),
                                                                Text(
                                                                  'very punctual',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // RatingBar.builder(
                                                    //   initialRating: 0,
                                                    //   itemCount: 4,
                                                    //   itemBuilder:
                                                    //       (context, index) {
                                                    //     switch (index) {
                                                    //       case 0:
                                                    //         return const Icon(
                                                    //           Icons.flag,
                                                    //           color: Colors.red,
                                                    //         );
                                                    //       case 1:
                                                    //         return const Icon(
                                                    //           Icons.flag,
                                                    //           color:
                                                    //               Colors.orange,
                                                    //         );
                                                    //       case 2:
                                                    //         return const Icon(
                                                    //           Icons.flag,
                                                    //           color:
                                                    //               Colors.yellow,
                                                    //         );
                                                    //       case 3:
                                                    //         return const Icon(
                                                    //           Icons.flag,
                                                    //           color:
                                                    //               Colors.green,
                                                    //         );
                                                    //       default:
                                                    //         return const Icon(
                                                    //           Icons.flag,
                                                    //           color:
                                                    //               Colors.green,
                                                    //         );
                                                    //     }
                                                    //   },
                                                    //   onRatingUpdate: (rating) {
                                                    //     print(rating);
                                                    //   },
                                                    // ),
                                                    Form(
                                                        key: formkey,
                                                        child: TextFormField(
                                                          controller:
                                                              reasonController,
                                                          maxLines: 46,
                                                          minLines: 6,
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 16,
                                                                    top: 12,
                                                                    bottom: 12,
                                                                    right: 16),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          9.00),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            hintText:
                                                                "Enter here your feedback",
                                                          ),
                                                          style:
                                                              const TextStyle(
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
                                                  ],
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, 'Cancel'),
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () async {},
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            });
                                          });
                                    },
                                    icon: const Icon(
                                      Icons.flag,
                                      color: Color(
                                        0xff18acb3,
                                      ),
                                      size: 30,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 0),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Employee_details(
                                                      eid: documentSnapshot[
                                                          'adharcard_num'],
                                                      ename: documentSnapshot[
                                                          'name'],
                                                    )));
                                      },
                                      icon: const Icon(
                                        Icons.near_me,
                                        color: Colors.grey,
                                        size: 30,
                                      )),
                                )
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
