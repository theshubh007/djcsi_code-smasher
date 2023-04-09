import 'dart:convert';
import 'dart:io';
import 'package:auth_employee/Firebase_Services.dart';
import 'package:auth_employee/login_page.dart';
import 'package:auth_employee/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  bool formVisible = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _adharController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _experticeController = TextEditingController();
  final TextEditingController _pancardController = TextEditingController();

  File? img;
  final ImagePicker _picker = ImagePicker();
  Future imgFromGallery() async {
    await Permission.photos.request();
    var permissionstatus = await Permission.photos.status;

    if (permissionstatus.isGranted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          img = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } else {
      print('Grant Permission and try again');
    }
  }

  Future<String> _uploadImage(File image) async {
    const url = 'http://dhrumit.pythonanywhere.com/img2';
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file1', image.path));
    final response = await request.send();
    final responseData = await response.stream.toBytes();
    final responseString = String.fromCharCodes(responseData);
    return responseString;
  }

  void clearcontroller() {
    _nameController.clear();
    _adharController.clear();
    _experienceController.clear();
    _experticeController.clear();
    _pancardController.clear();
  }

  @override
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Firebase_Serv.signOutGoogle();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Loginpage()
                      // builder: (context) => const HomePage(),
                      ));
            },
            icon: const Icon(Icons.logout_outlined,
                color: Colors.white, size: 30),
          ),
        ],
      ),
      backgroundColor: const Color(0xff6096B4),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Column(
              //   children: [
              //     if (img != null) Image.file(img!),
              //     if (img != null)
              //       ElevatedButton(
              //           onPressed: () async {
              //             final response = await _uploadImage(img!);
              //             final jsonResponse = jsonDecode(response);
              //             final similarityPercentage =
              //                 jsonResponse['similarity_percentage'];
              //             ScaffoldMessenger.of(context).showSnackBar(
              //               SnackBar(
              //                 content: Text(
              //                     'Similarity percentage: $similarityPercentage'),
              //               ),
              //             );
              //             if(similarityPercentage>45){
              //               formVisible = true;
              //             }else{
              //               formVisible = false;
              //             }
              //           },
              //           child: const Text('Verify image')),
              //     if (img != null)
              //       ElevatedButton(
              //           onPressed: () {
              //             setState(() {
              //               img = null;
              //             });
              //           },
              //           child: const Text('Clear Image')),
              //     ElevatedButton(
              //       onPressed: () async {
              //         final pickedFile =
              //             await _picker.pickImage(source: ImageSource.gallery);
              //         if (pickedFile != null) {
              //           setState(() {
              //             img = File(pickedFile.path);
              //           });
              //         }
              //       },
              //       child: const Text('Select Image'),
              //     ),
              //   ],
              // ),
              InkWell(
                onTap: () async {
                  var status = await Permission.photos.status;
                  print(status);
                  await picker.pickImage(source: ImageSource.gallery);
                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 10,
                  child: Container(
                      width: width * 0.80,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.lightBlue.shade100,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          border: Border.all(color: Colors.white)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/addPhoto.png",
                            height: 80,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          const Text(
                            "Upload Photo",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: "Anuphan",
                                letterSpacing: 1.1),
                          ),
                        ],
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () async {
                  var status = await Permission.photos.status;
                  print(status);
                  await picker.pickImage(source: ImageSource.gallery);
                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 10,
                  child: Container(
                      // alignment: Alignment.,
                      width: width * 0.80,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.lightBlue.shade100,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          border: Border.all(color: Colors.white)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/aadharCard.png", height: 90),
                          const SizedBox(
                            width: 9,
                          ),
                          const Text(
                            "Upload Aadharcard ",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Anuphan",
                                letterSpacing: 1.1),
                          ),
                        ],
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () async {
                  var status = await Permission.photos.status;
                  print(status);
                  await picker.pickImage(source: ImageSource.gallery);
                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 10,
                  child: Container(
                      // alignment: Alignment.,
                      width: width * 0.80,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.lightBlue.shade100,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          border: Border.all(color: Colors.white)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/panCard.png", height: 90),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Upload Pancard",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Anuphan",
                                letterSpacing: 1.1),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 40, left: 40),
                child: InkWell(
                  onTap: () {
                    setState(()async{
                      final response = await _uploadImage(img!);
                      final jsonResponse = jsonDecode(response);
                      final similarityPercentage =
                      jsonResponse['similarity_percentage'];
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Similarity percentage: $similarityPercentage'),
                        ),
                      );
                      if(similarityPercentage>45){
                        formVisible = true;
                      }else{
                        formVisible = false;
                      }
                    },);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.white)),
                    alignment: Alignment.center,
                    height: 40,
                    width: width,
                    child: const Text(
                      "Verify",
                      style: TextStyle(fontSize: 18, fontFamily: "Alkatra"),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: formVisible,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Employee Name",
                                  textAlign: TextAlign.left, style: formText),
                              const SizedBox(
                                height: 2,
                              ),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: "Enter name of the employee",
                                  border: OutlineInputBorder(),
                                  focusColor: Colors.white10,
                                  focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      width: 0.8,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Employee aadhar number",
                                  textAlign: TextAlign.left, style: formText),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: _adharController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: "Enter adhar number of employee",
                                  border: OutlineInputBorder(),
                                  focusColor: Colors.white10,
                                  focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      width: 0.8,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Employee PAN number",
                                  textAlign: TextAlign.left, style: formText),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: _pancardController,
                                decoration: const InputDecoration(
                                  hintText: "Enter PAN number of employee",
                                  border: OutlineInputBorder(),
                                  focusColor: Colors.white10,
                                  focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      width: 0.8,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Employee Year of experience",
                                  textAlign: TextAlign.left, style: formText),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: _experienceController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText:
                                      "Enter Year of experience of employee",
                                  border: OutlineInputBorder(),
                                  focusColor: Colors.white10,
                                  focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Employee Expertice",
                                  textAlign: TextAlign.left, style: formText),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: _experticeController,
                                decoration: const InputDecoration(
                                  hintText: "Enter expertice of employee",
                                  border: OutlineInputBorder(),
                                  // focusColor: Colors.white10,
                                  focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      strokeAlign: 12,
                                      width: 0.8,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, right: 20, left: 20, bottom: 30),
                          child: InkWell(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                bool present = await Firebase_Serv
                                    .check_employee_is_already_registered(
                                        _adharController.text.trim(),
                                        _pancardController.text.trim());

                                if (present) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Employee is already registered with this adhar number or pancard number")));
                                } else {
                                  await Firebase_Serv
                                      .upload_employee_data_bothplace(
                                          _nameController.text.trim(),
                                          _adharController.text.trim(),
                                          _pancardController.text.trim(),
                                          _experienceController.text.trim(),
                                          _experticeController.text.trim());
                                  setState(() {
                                    clearcontroller();
                                  });
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(color: Colors.white)),
                              alignment: Alignment.center,
                              height: 40,
                              width: width,
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: "Alkatra"),
                              ),
                            ),
                          ),
                        ),
                        // InkWell(
                        //   onTap: () async {
                        //     await imgFromGallery();
                        //   },
                        //   child: Container(
                        //     // alignment: Alignment.,
                        //       width: width * 0.80,
                        //       padding: const EdgeInsets.all(10),
                        //       decoration: const BoxDecoration(
                        //         color: Colors.black12,
                        //         borderRadius: BorderRadius.all(Radius.circular(07)),
                        //         // border: Border.all(color: Colors.red)
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           Image.asset("assets/addPhoto.png", height: 85),
                        //           const SizedBox(
                        //             width: 18,
                        //           ),
                        //           const Text(
                        //             "Add Photo",
                        //             style: TextStyle(fontSize: 20),
                        //           ),
                        //         ],
                        //       )),
                        // ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     print("OK");
                        //   },
                        //   child: Container(
                        //       // alignment: Alignment.,
                        //       width: width * 0.80,
                        //       padding: const EdgeInsets.all(10),
                        //       decoration: const BoxDecoration(
                        //         color: Colors.black12,
                        //         borderRadius: BorderRadius.all(Radius.circular(07)),
                        //         // border: Border.all(color: Colors.red)
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           Image.asset("assets/aadharCard.png", height: 90),
                        //           const SizedBox(
                        //             width: 9,
                        //           ),
                        //           const Text(
                        //             "Add Aadharcard Photo",
                        //             style: TextStyle(fontSize: 18),
                        //           ),
                        //         ],
                        //       )),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
