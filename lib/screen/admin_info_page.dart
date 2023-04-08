import 'package:auth_employee/Firebase_Services.dart';
import 'package:auth_employee/my_home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Admin_info_page extends StatefulWidget {
  const Admin_info_page({Key? key}) : super(key: key);

  @override
  State<Admin_info_page> createState() => _Admin_info_pageState();
}

class _Admin_info_pageState extends State<Admin_info_page> {
  int currentStep = 0;
  final _firstformKey = GlobalKey<FormState>();
  final _secondformKey = GlobalKey<FormState>();

  final TextEditingController _orgnameController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _phonenumController = TextEditingController();

  // DatabaseReference organizationRef = FirebaseDatabase.instance.ref("Organization");
  final database = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {
              final isLastStep = currentStep == getSteps().length - 1;
              if (isLastStep) {
                Firebase_Serv.uploadadmininfo(
                        _nameController.text.trim(),
                        _orgnameController.text.trim(),
                        _roleController.text.trim(),
                        _phonenumController.text.trim())
                    .then((value) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()));
                });
              } else {
                setState(() {
                  currentStep++;
                });
              }
            },
            onStepCancel: () {
              currentStep == 0
                  ? null
                  : setState(() {
                      currentStep--;
                    });
            },
            onStepTapped: (step) {
              setState(() {
                currentStep = step;
              });
            },
          ),
        ),
      ),
    ));
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text("Term and Condition"),
          content: Column(
            children: const [
              Text('''

 1.Use of Service: Users may use the service only for lawful purposes and in accordance with the terms and conditions. Users must not use the service to harass, defame, or otherwise harm others.

2. Content: Users are solely responsible for the information they share on the platform. 

3. Intellectual Property: The platform owns all intellectual property rights in the service and its content. Users may not use the platform's content without permission.

          ''')
            ],
          ),
        ),
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text(
            // "Organization",
            "",
            style: TextStyle(fontSize: 8),
          ),
          content: Column(
            children: [
              Form(
                  key: _firstformKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Organization name",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _orgnameController,
                              decoration: const InputDecoration(
                                hintText: "Enter the organization name",
                                border: OutlineInputBorder(),
                                focusColor: Colors.white10,
                                focusedBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.black38,
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
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text(
                // "Employee"
                ""),
            content: Column(
              children: [
                Form(
                    key: _secondformKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Name",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: "Enter your name",
                                  border: OutlineInputBorder(),
                                  focusColor: Colors.white10,
                                  focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Colors.black38,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Role",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: _roleController,
                                decoration: const InputDecoration(
                                  hintText: "specify your role in organization",
                                  border: OutlineInputBorder(),
                                  focusColor: Colors.white10,
                                  focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Colors.black38,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Phone Number",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: _phonenumController,
                                decoration: const InputDecoration(
                                  hintText: "Enter the phone number",
                                  border: OutlineInputBorder(),
                                  focusColor: Colors.white10,
                                  focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Colors.black38,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    )),
              ],
            )),
      ];
}
