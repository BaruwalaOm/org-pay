import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetutorial/pages/payment.dart';
import 'package:firebasetutorial/pages/payment_list.dart';
import 'package:firebasetutorial/pages/user_profile.dart';
import 'package:firebasetutorial/pages/users_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../pages/login.dart';
import '../service/userdatabase.dart';


class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _Admin_PanelState();
}

class _Admin_PanelState extends State<AdminPanel> {

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
                return  Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(

                            children: [
                              Text(
                                "FullName: "+ds["FullName"],
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),

                              Spacer(),
                              SizedBox(width: 5,),
                              GestureDetector(
                                  onTap: (){
                                    fullnamecontroller.text = ds["FullName"];
                                    emailcontroller.text = ds["Email"];
                                    phnocontroller.text = ds["PhNo"];
                                    housenocontroller.text = ds["HouseNo"];
                                    EditUserDetail(ds["Id"]);
                                  },
                                  child: Icon(Icons.edit, color: Colors.orange,)),
                              SizedBox(width: 5,),
                              GestureDetector(
                                  onTap: () async {
                                    await DatabaseMethods().deleteUserDetail(ds["Id"]);
                                  },
                                  child: Icon(Icons.delete, color: Colors.orange,)),

                            ],
                          ),

                          Text(
                            "Email: "+ds["Email"],
                            style: TextStyle(color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),

                          Text(
                            "PhNo: "+ds["PhNo"],
                            style: TextStyle(color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),

                          Text(
                            "HouseNo: "+ds["HouseNo"],
                            style: TextStyle(color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )

                        ],
                      ),
                    ),
                  ),
                );

              })
              : Container();
        });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: (()=>signout()),
        child: Icon(Icons.login_rounded),
      ),*/

      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 30),
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
                    child: Icon(Icons.cancel)),
                SizedBox(width: 60,),
                Text(
                  "Edit",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Details",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )

              ],),
            SizedBox(height: 20,),
            Text("Full Name", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(

                controller: fullnamecontroller,
                decoration: InputDecoration(border: InputBorder.none,
                  prefixIcon: Icon(Icons.face),),

              ),
            ),
            SizedBox(height: 20,),
            Text("E-mail", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(border: InputBorder.none,
                  prefixIcon: Icon(Icons.email_outlined),),
              ),
            ),
            SizedBox(height: 20,),
            Text("Ph No", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: phnocontroller,
                decoration: InputDecoration(border: InputBorder.none, prefixIcon: Icon(Icons.call),),

              ),
            ),
            SizedBox(height: 20,),
            Text("House No", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: housenocontroller,
                decoration: InputDecoration(border: InputBorder.none, prefixIcon: Icon(Icons.house_outlined),),
              ),
            ),
            SizedBox(height: 30,),
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


            }, child: Text("Update")))



          ],),
      ),
    ),
  ));



}

class MyDrawer extends StatelessWidget {

  final admin=FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Admin'),
            titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //subtitle: Text('${admin!.email}'),
            tileColor: Colors.black54,
            //textColor: Colors.white,
            onTap: () {
              // Handle item 1 tap
              Navigator.pop(context); // Close drawer
            },
          ),
          /*SizedBox(height: 20,),
          ListTile(
              title: Text('UserProfile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              onTap: (() => Get.to(User_Profile()))
          ), */
          SizedBox(height: 20,),
          ListTile(
              title: Text('UsersList', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              onTap: (() => Get.to(UsersList()))
          ),
          /* ListTile(
              title: Text('Payment'),
              onTap: (() => Get.to(Payment()))
          ), */
          ListTile(
              title: Text('PaymentList', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              onTap: (() => Get.to(PaymentList()))
          ),
          ListTile(
              title: Text('Logout', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              onTap: (() => signout(context))
          ),
          // Add more menu items here
        ],
      ),
    );
  }

  signout(BuildContext context)async{


    await FirebaseAuth.instance.signOut().then((value) async {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
              (route) => false);
    });
    //await FirebaseAuth.instance.signOut();
  }

}
