
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetutorial/service/userdatabase.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class User_Profile extends StatefulWidget {
  const User_Profile({super.key});

  @override
  State<User_Profile> createState() => _User_ProfileState();
}

class _User_ProfileState extends State<User_Profile> {

  int _selectedValue = 1;
  String dropdownvalue = 'Cash';

  // List of items in our dropdown menu
  var items = [
    'Cash',
    'Online',
  ];

  TextEditingController fullnamecontroller= TextEditingController();
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController phnocontroller= TextEditingController();
  TextEditingController housenocontroller= TextEditingController();
  TextEditingController datecontroller= TextEditingController();

  Future<void> setUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      if (userDoc.exists) {
        Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;

        fullnamecontroller.text = userData!['name'];
        emailcontroller.text = userData['email'];
        //housenocontroller.text = userData['HouseNo'];
      } else {
        print("User document does not exist.");
      }
    } else {
      print("No user is currently signed in.");
    }
  }
@override
  void initState() {

  setUserData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /* title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "User",
                 style: TextStyle(
                   color: Colors.orange,
                   fontSize: 30,
                   fontWeight: FontWeight.bold),
              ),
              Text(
                "Form",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ), */
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 40, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "User",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "Form",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("User Details:-", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 20,),
              Text("Full Name:", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(), borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: fullnamecontroller,
                  decoration: InputDecoration(border: InputBorder.none,
                      prefixIcon: Icon(Icons.face) ),

                ),
              ),
              SizedBox(height: 20,),
              Text("Email:", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(), borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(border: InputBorder.none,
                      prefixIcon: Icon(Icons.email_outlined) ),

                ),
              ),

              SizedBox(height: 20,),
              Text("Ph No:", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(), borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: phnocontroller,
                  decoration: InputDecoration(border: InputBorder.none,
                      prefixIcon: Icon(Icons.call) ),

                ),
              ),
              SizedBox(height: 20,),
              Text("House No:", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(), borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: housenocontroller,
                  decoration: InputDecoration(border: InputBorder.none,
                      prefixIcon: Icon(Icons.house_outlined) ),
                ),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Payment Details:-", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
                ],
              ),

              SizedBox(height: 20,),
              Text("Payment Type:", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(15),
                child: DropdownButton(

                  // Initial Value
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),


                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),




              SizedBox(height: 20,),
              Text("Payment Process:", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
              RadioListTile(
                title: Text('Pending', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                value: 1,
                groupValue:
                _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
              RadioListTile(
                title: Text('Success', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),

                value: 2,
                groupValue:
                _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue =
                    value!;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextField(
                controller: datecontroller,
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today_rounded),
                  hintText: 'Select Date',
                ),
                onTap: () async{
                  DateTime? pickeddate = await showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2025));

                  if (pickeddate != null) {
                    setState(() {

                      datecontroller.text = DateFormat('dd-MM-yyyy').format(pickeddate);

                    });


                  }

                },
              ),


              SizedBox(height: 30,),

              Center(
                child: ElevatedButton(
                    onPressed: () async{
                      String Id= randomAlphaNumeric(10);
                      User? user = FirebaseAuth.instance.currentUser;
                      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({

                        // 'name': name,
                        // 'email': email,
                        // 'accountType': accountType,
                        "PhNo" :  phnocontroller.text,
                        "HouseNo" :  housenocontroller.text,
                        "PaymentType" : dropdownvalue.toString(),
                        "PaymentProcess" : _selectedValue.toString(),
                        "Date" : datecontroller.text,
                      }, SetOptions(merge: true));

                      Map<String, dynamic> userInfoMap = {
                        "FullName" : fullnamecontroller.text,
                        "Email" : emailcontroller.text,
                        "PhNo" :  phnocontroller.text,
                        "HouseNo" :  housenocontroller.text,
                        "PaymentType" : dropdownvalue.toString(),
                        "PaymentProcess" : _selectedValue.toString(),
                        "Date" : datecontroller.text,
                        "Id" : user!.uid,
                      };
                      await DatabaseMethods().addUserDetails(userInfoMap, user!.uid).then((value) {
                        Fluttertoast.showToast(
                            msg: "User Details Uploaded Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      });

                    },

                    child: Text("SUBMIT", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),)),
              )

            ],
          ),
        ),
      ),
    );
  }
}
