import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetutorial/pages/Read-only_file.dart';
import 'package:firebasetutorial/pages/payment.dart';
import 'package:firebasetutorial/pages/payment_list.dart';
import 'package:firebasetutorial/pages/user_profile.dart';
import 'package:firebasetutorial/pages/users_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../service/shared_pref_helper.dart';
import '../service/userdatabase.dart';
import 'login.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  TextEditingController fullnamecontroller= new TextEditingController();
  TextEditingController emailcontroller= new TextEditingController();
  TextEditingController phnocontroller= new TextEditingController();
  TextEditingController housenocontroller= new TextEditingController();


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

  Widget allUsersDetails(){
    return StreamBuilder(
        stream: UsersStream,
        builder: (context, AsyncSnapshot snapshot){
          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index){
                DocumentSnapshot ds=snapshot.data.docs[index];
                User? user = FirebaseAuth.instance.currentUser;
                if(Prefs.accountType.get() == 'Admin') {
                return  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    "FullName: "+ds["FullName"],
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        // overflow: TextOverflow.visible,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),

                                const Spacer(),
                                /*SizedBox(width: 5,),
                              GestureDetector(
                                  onTap: (() => Get.to(Payment()) ),
                                  child: Icon(Icons.payment, color: Colors.orange,)), */
                               const SizedBox(width: 5,),
                                GestureDetector(
                                    onTap: (() => Get.to(Read_only(
                                      fullName: ds["FullName"],
                                      Email: ds["Email"],
                                      PhNo: ds["PhNo"],
                                      HouseNo: ds["HouseNo"],
                                      PaymentType: ds["PaymentType"],
                                      PaymentProcess: ds["PaymentProcess"],
                                      Date: ds["Date"],
                                    )) ),
                                    child: Icon(Icons.remove_red_eye, color: Colors.orange,)),
                                const SizedBox(width: 5,),
                                GestureDetector(
                                    onTap: (){
                                      fullnamecontroller.text = ds["FullName"];
                                      emailcontroller.text = ds["Email"];
                                      phnocontroller.text = ds["PhNo"];
                                      housenocontroller.text = ds["HouseNo"];
                                      EditUserDetail(ds["Id"]);
                                    },
                                    child: const Icon(Icons.edit, color: Colors.orange,)),
                                const SizedBox(width: 5,),
                                GestureDetector(
                                    onTap: () async {
                                      await DatabaseMethods().deleteUserDetail(ds["Id"]);
                                    },
                                    child: const Icon(Icons.delete, color: Colors.orange,)),

                              ],
                            ),

                            Text(
                              "Email: "+ds["Email"],
                              style: const TextStyle(color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),

                            Text(
                              "PhNo: "+ds["PhNo"],
                              style: const TextStyle(color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),

                            Text(
                              "HouseNo: "+ds["HouseNo"],
                              style: const TextStyle(color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "PaymentType: "+ds["PaymentType"],
                              style: const TextStyle(color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "PaymentProcess: "+ds["PaymentProcess"],
                              style: const TextStyle(color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Date: "+ds["Date"],
                              style: const TextStyle(color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )

                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                return  user!.uid == ds['Id'] ?  Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "FullName: "+ds["FullName"],
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      // overflow: TextOverflow.visible,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              const Spacer(),
                              SizedBox(width: 5,),
                              GestureDetector(
                                  onTap: (() => Get.to(Read_only(
                                    fullName: ds["FullName"],
                                    Email: ds["Email"],
                                    PhNo: ds["PhNo"],
                                    HouseNo: ds["HouseNo"],
                                    PaymentType: ds["PaymentType"],
                                    PaymentProcess: ds["PaymentProcess"],
                                    Date: ds["Date"],
                                  )) ),
                                  child: Icon(Icons.remove_red_eye, color: Colors.orange,)),

                              const SizedBox(width: 5,),
                              GestureDetector(
                                  onTap: (){
                                    fullnamecontroller.text = ds["FullName"];
                                    emailcontroller.text = ds["Email"];
                                    phnocontroller.text = ds["PhNo"];
                                    housenocontroller.text = ds["HouseNo"];
                                    EditUserDetail(ds["Id"]);
                                  },
                                  child: const Icon(Icons.edit, color: Colors.orange,)),
                              const SizedBox(width: 5,),
                              GestureDetector(
                                  onTap: () async {
                                    await DatabaseMethods().deleteUserDetail(ds["Id"]);
                                  },
                                  child: const Icon(Icons.delete, color: Colors.orange,)),

                            ],
                          ),

                          Text(
                            "Email: "+ds["Email"],
                            style: const TextStyle(color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),

                          Text(
                            "PhNo: "+ds["PhNo"],
                            style: const TextStyle(color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),

                          Text(
                            "HouseNo: "+ds["HouseNo"],
                            style: const TextStyle(color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "PaymentType: "+ds["PaymentType"],
                            style: const TextStyle(color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "PaymentProcess: "+ds["PaymentProcess"],
                            style: const TextStyle(color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Date: "+ds["Date"],
                            style: const TextStyle(color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )

                        ],
                      ),
                    ),
                  ),
                ) : const SizedBox();
                }

              })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
        titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: (()=>signout()),
        child: Icon(Icons.login_rounded),
      ),*/

      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            Expanded(child: allUsersDetails()),

          ],
        ),

      ),

      drawer: MyDrawer(),
    );
  }

  Future EditUserDetail(String id) => showDialog(context: context, builder: (context)=> AlertDialog(
    content: Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.cancel)),
                const SizedBox(width: 60,),
                const Text(
                  "Edit",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Details",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )

              ],),
            const SizedBox(height: 20,),
            const Text("Full Name", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(

                controller: fullnamecontroller,
                decoration: const InputDecoration(border: InputBorder.none,
                  prefixIcon: Icon(Icons.face),),

              ),
            ),
            const SizedBox(height: 20,),
            const Text("E-mail", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: emailcontroller,
                decoration: const InputDecoration(border: InputBorder.none,
                  prefixIcon: Icon(Icons.email_outlined),),
              ),
            ),
            const SizedBox(height: 20,),
            const Text("Ph No", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: phnocontroller,
                decoration: const InputDecoration(border: InputBorder.none, prefixIcon: Icon(Icons.call),),

              ),
            ),
            const SizedBox(height: 20,),
            const Text("House No", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: housenocontroller,
                decoration: const InputDecoration(border: InputBorder.none, prefixIcon: Icon(Icons.house_outlined),),
              ),
            ),
            const SizedBox(height: 30,),
            Center(child: ElevatedButton(onPressed: () async{
              Map<String, dynamic>updateInfo={
                "FullName": fullnamecontroller.text,
                "Email": emailcontroller.text,
                "PhNo": phnocontroller.text,
                "Id": id,
                "HouseNo":  housenocontroller.text,
              };
              await DatabaseMethods().updateUserDetail(id, updateInfo).then((value) {
                Navigator.pop(context);
              });


            }, child: const Text("Update")))



          ],),
      ),
    ),
  ));



}

class MyDrawer extends StatelessWidget {

  final user=FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    if(Prefs.accountType.get() == 'Admin') {
      return Drawer(
        child: ListView(
            children: [
       ListTile(
        title: Text('${user!.displayName}'),
        titleTextStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        subtitle: Text('${user!.email}'),
        tileColor: Colors.black54,
        textColor: Colors.white,
        onTap: () {
          // Handle item 1 tap
          Navigator.pop(context); // Close drawer
        },
      ),
              ListTile(
                  title: const Text('Logout', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  onTap: (() => signout(context))
              ),
              // Add more menu items here
            ],
        ),
      );

    } else {

      return Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('${user!.displayName}'),
              titleTextStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              subtitle: Text('${user!.email}'),
              tileColor: Colors.black54,
              textColor: Colors.white,
              onTap: () {
                // Handle item 1 tap
                Navigator.pop(context); // Close drawer
              },
            ),
            const SizedBox(height: 20,),
            ListTile(
                title: const Text('UserProfile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                onTap: (() => Get.to(const User_Profile()))
            ),
            ListTile(
                title: const Text('UsersList', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                onTap: (() => Get.to(const UsersList()))
            ),
            /* ListTile(
              title: Text('Payment'),
              onTap: (() => Get.to(Payment()))
          ), */
            ListTile(
                title: const Text('PaymentList', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                onTap: (() => Get.to(const PaymentList()))
            ),
            ListTile(
                title: const Text('Logout', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                onTap: (() => signout(context))
            ),
            // Add more menu items here
          ],
        ),
      );

    }
  }

  signout(BuildContext context)async{

    Prefs.clear();
    await FirebaseAuth.instance.signOut().then((value) async {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
              (route) => false);
    });
    //await FirebaseAuth.instance.signOut();
  }

}
