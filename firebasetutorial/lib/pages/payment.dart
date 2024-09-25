
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';
import '../service/paymentdatabase.dart';

 class Payment extends StatefulWidget {
   const Payment({super.key});

   @override
   State<Payment> createState() => _PaymentState();
 }

 class _PaymentState extends State<Payment> {

   int _selectedValue = 1;
   String dropdownvalue = 'Cash';

   // List of items in our dropdown menu
   var items = [
     'Cash',
     'Online',
   ];



   @override

   TextEditingController fullnamecontroller= new TextEditingController();
   TextEditingController phnocontroller= new TextEditingController();
   TextEditingController housenocontroller= new TextEditingController();
   TextEditingController datecontroller= new TextEditingController();


   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         /* title: Center(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(
               "Payment",
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
                     "Payment",
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
                       Map<String, dynamic> userInfoMap = {
                         "FullName" : fullnamecontroller.text,
                         "PhNo" :  phnocontroller.text,
                         "PaymentType" : dropdownvalue.toString(),
                         "PaymentProcess" : _selectedValue.toString(),
                         "Date" : datecontroller.text,
                         "Id" : Id,

                       };
                       await PaymentDatabaseMethods().addPaymentDetails(userInfoMap, Id).then((value) {
                         Fluttertoast.showToast(
                             msg: "Payment Details Uploaded Successfully",
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
