import 'package:attendance_frontend_flutter/NodeJS_Api/Api.dart';
import 'package:attendance_frontend_flutter/NodeJS_Models/SpecificUserDetailModel.dart';
import 'package:attendance_frontend_flutter/Screens/Authentication/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  double screenHeight = 0;
  double screenWidth = 0;

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  var EmployeeUniqID = "";
  var EmployeeID = "";

  loadSettings() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      EmployeeUniqID = (prefs.getString("EmployeeUniqID"))!;
      EmployeeID = (prefs.getString("EmployeeID"))!;
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   alignment: Alignment.centerLeft,
            //   margin: const EdgeInsets.only(top: 32),
            //   child: Text(
            //     "My Profile",
            //     style: TextStyle(
            //       color: Color(0xff3f51b5),
            //       fontFamily: "NexaBold",
            //       fontSize: screenWidth / 18,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: screenHeight / 1.45,
            //   child: FutureBuilder<SpecificUserModel>(
            //     future: GettingEmployee().GettingEmployeeData(),
            //     builder: (context, snapshots) {
            //       return (snapshots.hasData)
            //           ? ListView.builder(
            //               itemCount: 1,
            //               itemBuilder: (context, index) {
            //                 return Container(
            //                   height: 80,
            //                   decoration: const BoxDecoration(
            //                     color: Colors.white,
            //                     boxShadow: [
            //                       BoxShadow(
            //                         color: Colors.black26,
            //                         blurRadius: 10,
            //                         offset: Offset(2, 2),
            //                       ),
            //                     ],
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(20)),
            //                   ),
            //                   child: Row(
            //                     crossAxisAlignment: CrossAxisAlignment.center,
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       Icon(
            //                         Icons.person,
            //                         size: 50,
            //                         color: Color(0xff3f51b5),
            //                       ),
            //                       SizedBox(
            //                         width: 16,
            //                       ),
            //                       Container(
            //                         child: Expanded(
            //                             child: Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text(
            //                               (snapshots.data?.data?.getSpecificUser
            //                                               ?.employeeName)
            //                                           .toString() !=
            //                                       null
            //                                   ? (snapshots
            //                                           .data
            //                                           ?.data
            //                                           ?.getSpecificUser
            //                                           ?.employeeName)
            //                                       .toString()
            //                                   : "User",
            //                               style: TextStyle(
            //                                   color: Colors.black,
            //                                   fontSize: 16,
            //                                   fontFamily: "NexaBold",
            //                                   fontWeight: FontWeight.bold),
            //                             ),
            //                             SizedBox(
            //                               height: 5,
            //                             ),
            //                             Text(
            //                               (snapshots.data?.data?.getSpecificUser
            //                                           ?.email) !=
            //                                       null
            //                                   ? (snapshots.data?.data
            //                                           ?.getSpecificUser?.email)
            //                                       .toString()
            //                                   : "user@gmail.com",
            //                               style: TextStyle(
            //                                 color: Colors.black54,
            //                                 fontFamily: "NexaBold",
            //                                 fontSize: 16,
            //                               ),
            //                             ),
            //                           ],
            //                         )),
            //                       ),
            //                       Icon(
            //                         Icons.navigate_next_rounded,
            //                         size: 30,
            //                         color: Color(0xff3f51b5),
            //                       ),
            //                     ],
            //                   ),
            //                 );
            //               })
            //           : SizedBox();
            //     },
            //   ),
            // ),
            // isKeyboardVisible
            //     ? SizedBox(
            //         height: screenHeight / 16,
            //       )
            //     : Container(
            //         height: screenHeight / 4,
            //         width: screenWidth,
            //         decoration: BoxDecoration(
            //           color: Color(0xff3f51b5),
            //           borderRadius: const BorderRadius.only(
            //             bottomRight: Radius.circular(70),
            //           ),
            //         ),
            //         child: Center(
            //           child: Image.asset(
            //             "assets/images/2.png",
            //             width: screenWidth / 1.5,
            //             height: screenWidth / 1.5,
            //           ),
            //         ),
            //       ),
            SizedBox(
              height: screenHeight / 16,
            ),
            Container(
              margin: EdgeInsets.only(
                top: screenHeight / 15,
                bottom: screenHeight / 20,
              ),
              child: Column(
                children: [
                  Text(
                    "My Profile",
                    style: TextStyle(
                        fontSize: screenWidth / 18,
                        fontFamily: "NexaBold",
                        color: Color(0xff3f51b5)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your Employee ID : " + EmployeeID,
                    style: TextStyle(
                      fontSize: screenWidth / 22,
                      fontFamily: "NexaBold",
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<SpecificUserModel>(
                future: GettingEmployee().GettingEmployeeData(),
                builder: (context, snapshots) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth / 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fieldTitle("Name"),
                        customField(
                            (snapshots
                                    ?.data?.data?.getSpecificUser?.employeeName)
                                .toString(),
                            nameController,
                            false,
                            Icons.person),
                        fieldTitle("Mobile No"),
                        customField(
                            (snapshots?.data?.data?.getSpecificUser?.mobileNo)
                                .toString(),
                            mobileController,
                            false,
                            Icons.phone),
                        fieldTitle("Email"),
                        customField(
                            (snapshots?.data?.data?.getSpecificUser?.email)
                                .toString(),
                            emailController,
                            false,
                            Icons.email),
                        GestureDetector(
                          onTap: () async {
                            if (nameController.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Color(0xff3f51b5),
                                content: Text(
                                  "Please Enter Name !!!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "NexaBold",
                                  ),
                                ),
                                // backgroundColor: Color(0xffeef444c),
                              ));
                            } else if (mobileController.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Color(0xff3f51b5),
                                content: Text(
                                  "Please Enter Mobile !!!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "NexaBold",
                                  ),
                                ),
                                // backgroundColor: Color(0xffeef444c),
                              ));
                            } else if (emailController.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Color(0xff3f51b5),
                                content: Text(
                                  "Please Enter Email !!!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "NexaBold",
                                  ),
                                ),
                                // backgroundColor: Color(0xffeef444c),
                              ));
                            } else {
                              SpecificUserModel data = await UpdatingEmployee()
                                  .UpdatingEmployeeData(
                                      nameController.text.trim(),
                                      mobileController.text.trim(),
                                      emailController.text.trim());

                              if (data.status == 200) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.white,
                                  content: Text(
                                    "Your Details Updated Successfully !",
                                    style: TextStyle(
                                      color: Color(0xff3f51b5),
                                      fontFamily: "NexaBold",
                                    ),
                                  ),
                                ));
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Profile(),
                                ));
                              }
                            }
                          },
                          child: Container(
                            height: 60,
                            width: screenWidth,
                            margin: EdgeInsets.only(top: screenHeight / 40),
                            decoration: BoxDecoration(
                              color: Color(0xff3f51b5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Center(
                              child: Text(
                                "UPDATE",
                                style: TextStyle(
                                  fontFamily: "NexaBold",
                                  fontSize: screenWidth / 26,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget fieldTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth / 26,
          fontFamily: "NexaBold",
        ),
      ),
    );
  }

  Widget customField(String hint, TextEditingController controller,
      bool obscure, IconData icon) {
    return Container(
      width: screenWidth,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: screenWidth / 6,
            child: Icon(
              icon,
              color: Color(0xff3f51b5),
              size: screenWidth / 15,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: screenWidth / 12),
              child: TextFormField(
                controller: controller,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight / 35,
                  ),
                  border: InputBorder.none,
                  hintText: hint,
                ),
                maxLines: 1,
                obscureText: obscure,
              ),
            ),
          )
        ],
      ),
    );
  }
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // double screenHeight = 0;
  // double screenWidth = 0;
  // Color primary = const Color(0xffeef444c);
  // String birth = "Date of birth";
  // var EmployeeID = "";
  //
  // TextEditingController firstNameController = TextEditingController();
  // TextEditingController lastNameController = TextEditingController();
  // TextEditingController addressController = TextEditingController();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   loadSettings();
  // }
  //
  // loadSettings() async {
  //   final SharedPreferences prefs = await _prefs;
  //   setState(() {
  //     EmployeeID = (prefs.getString("EmployeeID"))!;
  //   });
  // }
  //
  // // void pickUploadProfilePic() async {
  // //   final image = await ImagePicker().pickImage(
  // //     source: ImageSource.gallery,
  // //     maxHeight: 512,
  // //     maxWidth: 512,
  // //     imageQuality: 90,
  // //   );
  // //
  // //   Reference ref = FirebaseStorage.instance
  // //       .ref().child("${User.employeeId.toLowerCase()}_profilepic.jpg");
  // //
  // //   await ref.putFile(File(image!.path));
  // //
  // //   ref.getDownloadURL().then((value) async {
  // //     setState(() {
  // //       User.profilePicLink = value;
  // //     });
  // //
  // //     await FirebaseFirestore.instance.collection("Employee").doc(User.id).update({
  // //       'profilePic': value,
  // //     });
  // //   });
  // // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   screenHeight = MediaQuery.of(context).size.height;
  //   screenWidth = MediaQuery.of(context).size.width;
  //   return Scaffold(
  //     body: SingleChildScrollView(
  //       padding: const EdgeInsets.all(20),
  //       child: Column(
  //         children: [
  //           GestureDetector(
  //             onTap: () {
  //               // pickUploadProfilePic();
  //             },
  //             child: Container(
  //               margin: const EdgeInsets.only(top: 80, bottom: 24),
  //               height: 120,
  //               width: 120,
  //               alignment: Alignment.center,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(20),
  //                 color: primary,
  //               ),
  //               child: Center(
  //                 child:
  //                 // User.profilePicLink == " " ?
  //                 const Icon(
  //                   Icons.person,
  //                   color: Colors.white,
  //                   size: 80,
  //                 )
  //                   //     : ClipRRect(
  //                   // borderRadius: BorderRadius.circular(20),
  //                   // child: Image.network(User.profilePicLink),
  //                 ),
  //               ),
  //             ),
  //           // ),
  //           Align(
  //             alignment: Alignment.center,
  //             child: Text(
  //               "Employee ${EmployeeID}",
  //               style: const TextStyle(
  //                 fontFamily: "NexaBold",
  //                 fontSize: 18,
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 24,),
  //           User.canEdit ? textField("First Name", "First name", firstNameController) : field("First Name", User.firstName),
  //           User.canEdit ? textField("Last Name", "Last name", lastNameController) : field("Last Name", User.lastName),
  //           User.canEdit ? GestureDetector(
  //             onTap: () {
  //               showDatePicker(
  //                   context: context,
  //                   initialDate: DateTime.now(),
  //                   firstDate: DateTime(1950),
  //                   lastDate: DateTime.now(),
  //                   builder: (context, child) {
  //                     return Theme(
  //                       data: Theme.of(context).copyWith(
  //                         colorScheme: ColorScheme.light(
  //                           primary: primary,
  //                           secondary: primary,
  //                           onSecondary: Colors.white,
  //                         ),
  //                         textButtonTheme: TextButtonThemeData(
  //                           style: TextButton.styleFrom(
  //                             primary: primary,
  //                           ),
  //                         ),
  //                         textTheme: const TextTheme(
  //                           headline4: TextStyle(
  //                             fontFamily: "NexaBold",
  //                           ),
  //                           overline: TextStyle(
  //                             fontFamily: "NexaBold",
  //                           ),
  //                           button: TextStyle(
  //                             fontFamily: "NexaBold",
  //                           ),
  //                         ),
  //                       ),
  //                       child: child!,
  //                     );
  //                   }
  //               ).then((value) {
  //                 setState(() {
  //                   birth = DateFormat("MM/dd/yyyy").format(value!);
  //                 });
  //               });
  //             },
  //             child: field("Date of Birth", birth),
  //           ) : field("Date of Birth", User.birthDate),
  //           User.canEdit ? textField("Address", "Address", addressController) : field("Address", User.address),
  //           User.canEdit ? GestureDetector(
  //             onTap: () async {
  //               String firstName = firstNameController.text;
  //               String lastName = lastNameController.text;
  //               String birthDate = birth;
  //               String address = addressController.text;
  //
  //               if(User.canEdit) {
  //                 if(firstName.isEmpty) {
  //                   showSnackBar("Please enter your first name!");
  //                 } else if(lastName.isEmpty) {
  //                   showSnackBar("Please enter your last name!");
  //                 } else if(birthDate.isEmpty) {
  //                   showSnackBar("Please enter your birth date!");
  //                 } else if(address.isEmpty) {
  //                   showSnackBar("Please enter your address!");
  //                 } else {
  //                   await FirebaseFirestore.instance.collection("Employee").doc(User.id).update({
  //                     'firstName': firstName,
  //                     'lastName': lastName,
  //                     'birthDate': birthDate,
  //                     'address': address,
  //                     'canEdit': false,
  //                   }).then((value) {
  //                     setState(() {
  //                       User.canEdit = false;
  //                       User.firstName = firstName;
  //                       User.lastName = lastName;
  //                       User.birthDate = birthDate;
  //                       User.address = address;
  //                     });
  //                   });
  //                 }
  //               } else {
  //                 showSnackBar("You can't edit anymore, please contact support team.");
  //               }
  //             },
  //             child: Container(
  //               height: kToolbarHeight,
  //               width: screenWidth,
  //               margin: const EdgeInsets.only(bottom: 12),
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(4),
  //                 color: primary,
  //               ),
  //               child: const Center(
  //                 child: Text(
  //                   "SAVE",
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontFamily: "NexaBold",
  //                     fontSize: 16,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ) : const SizedBox(),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget field(String title, String text) {
  //   return Column(
  //     children: [
  //       Align(
  //         alignment: Alignment.centerLeft,
  //         child: Text(
  //           title,
  //           style: const TextStyle(
  //             fontFamily: "NexaBold",
  //             color: Colors.black87,
  //           ),
  //         ),
  //       ),
  //       Container(
  //         height: kToolbarHeight,
  //         width: screenWidth,
  //         margin: const EdgeInsets.only(bottom: 12),
  //         padding: const EdgeInsets.only(left: 11),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(4),
  //           border: Border.all(
  //             color: Colors.black54,
  //           ),
  //         ),
  //         child: Align(
  //           alignment: Alignment.centerLeft,
  //           child: Text(
  //             text,
  //             style: const TextStyle(
  //               color: Colors.black54,
  //               fontFamily: "NexaBold",
  //               fontSize: 16,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget textField(String title, String hint, TextEditingController controller) {
  //   return Column(
  //     children: [
  //       Align(
  //         alignment: Alignment.centerLeft,
  //         child: Text(
  //           title,
  //           style: const TextStyle(
  //             fontFamily: "NexaBold",
  //             color: Colors.black87,
  //           ),
  //         ),
  //       ),
  //       Container(
  //         margin: const EdgeInsets.only(bottom: 12),
  //         child: TextFormField(
  //           controller: controller,
  //           cursorColor: Colors.black54,
  //           maxLines: 1,
  //           decoration: InputDecoration(
  //             hintText: hint,
  //             hintStyle: const TextStyle(
  //               color: Colors.black54,
  //               fontFamily: "NexaBold",
  //             ),
  //             enabledBorder: const OutlineInputBorder(
  //               borderSide: BorderSide(
  //                 color: Colors.black54,
  //               ),
  //             ),
  //             focusedBorder: const OutlineInputBorder(
  //               borderSide: BorderSide(
  //                 color: Colors.black54,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //
  // void showSnackBar(String text) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       behavior: SnackBarBehavior.floating,
  //       content: Text(
  //         text,
  //       ),
  //     ),
  //   );
  // }
}
