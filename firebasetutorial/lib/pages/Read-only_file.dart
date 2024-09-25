
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetutorial/service/userdatabase.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

import '../service/shared_pref_helper.dart';

class Read_only extends StatefulWidget {
   Read_only({super.key, required this.fullName,  required this.Email,  required this.PhNo, required this.HouseNo, required this.PaymentType, required this.PaymentProcess, required this.Date});
 String fullName = '';
 String Email = '';
 String PhNo = '';
 String HouseNo = '';
 String PaymentType = '';
 String PaymentProcess = '';
 String Date = '';


  @override
  State<Read_only> createState() => _Read_onlyState();
}

class _Read_onlyState extends State<Read_only> {

  Stream? UsersStream;
  getontheload() async{
    UsersStream= await DatabaseMethods().getUsersDetails();
    setState(() {

    });
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

//   Widget allUsersDetails(){
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       child: Material(
//         elevation: 5,
//         borderRadius: BorderRadius.circular(10),
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           width: MediaQuery
//               .of(context)
//               .size
//               .width,
//           decoration: BoxDecoration(color: Colors.white,
//               borderRadius: BorderRadius.circular(10)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "User",
//                     style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold),
//                   ),
//
//                   Text(
//                     "Form",
//                     style: TextStyle(
//                         color: Colors.orange,
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 40,),
//
//               Row(
//                 children: [
//                   Flexible(
//                     child: Text(
//                       "FullName: " + ds["FullName"],
//                       maxLines: 2,
//                       style: const TextStyle(
//                           color: Colors.black87,
//                           // overflow: TextOverflow.visible,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//
//               SizedBox(height: 20,),
//               Text(
//                 "FullName: " + ds["FullName"], style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold),),
//               SizedBox(height: 10,),
//               Container(
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                     border: Border.all(),
//                     borderRadius: BorderRadius.circular(10)
//                 ),
//               ),
//               SizedBox(height: 20,),
//               Text(
//                 "Email: " + ds["Email"], style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold),),
//               SizedBox(height: 10,),
//               Container(
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                     border: Border.all(),
//                     borderRadius: BorderRadius.circular(10)
//                 ),
//               ),
//
//               SizedBox(height: 20,),
//               Text(
//                 "PhNo: " + ds["PhNo"], style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold),),
//               SizedBox(height: 10,),
//               Container(
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                     border: Border.all(),
//                     borderRadius: BorderRadius.circular(10)
//                 ),
//               ),
//               SizedBox(height: 20,),
//               Text(
//                 "HouseNo: " + ds["HouseNo"], style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold),),
//               SizedBox(height: 10,),
//               Container(
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                     border: Border.all(),
//                     borderRadius: BorderRadius.circular(10)
//                 ),
//               ),
//               SizedBox(height: 50,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//
//                   Text("Payment Details:-", style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold),),
//                 ],
//               ),
//
//               SizedBox(height: 20,),
//               Text(
//                 "PaymentType: " + ds["PaymentType"], style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold),),
//               SizedBox(height: 10,),
//               Container(
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                     border: Border.all(),
//                     borderRadius: BorderRadius.circular(10)
//                 ),
//               ),
//
//               SizedBox(height: 20,),
//               Text(
//                 "PaymentProcess: " + ds["PaymentProcess"],
//                 style: TextStyle(color: Colors.black,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold),),
//               SizedBox(height: 10,),
//               Container(
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                     border: Border.all(),
//                     borderRadius: BorderRadius.circular(10)
//                 ),
//               ),
//               SizedBox(height: 20,),
//               Text(
//                 "Date: " + ds["Date"], style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold),
//               )
//
//             ],
//           ),
//         ),
//       ),
//     )
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read-only"),
        titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),

      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            Expanded(child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
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
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),

                          Text(
                            "Form",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("User Details:-", style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),),
                        ],
                      ),


                      // Row(
                      //   children: [
                      //     Flexible(
                      //       child: Text(
                      //         "FullName: " + widget.fullName,
                      //         maxLines: 2,
                      //         style: const TextStyle(
                      //             color: Colors.black87,
                      //             // overflow: TextOverflow.visible,
                      //             fontSize: 20,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      SizedBox(height: 20,),
                      Text(
                        "FullName: " + widget.fullName, style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Email: " + widget.Email, style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),

                      SizedBox(height: 20,),
                      Text(
                        "PhNo: " + widget.PhNo, style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "HouseNo: " + widget.HouseNo, style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("Payment Details:-", style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),),
                        ],
                      ),

                      SizedBox(height: 20,),
                      Text(
                        "PaymentType: " + widget.PaymentType, style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),

                      SizedBox(height: 20,),
                      Text(
                        "PaymentProcess: " + widget.PaymentProcess,
                        style: TextStyle(color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Date: " + widget.Date, style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),),

          ],
        ),

      ),

    );
  }
}
