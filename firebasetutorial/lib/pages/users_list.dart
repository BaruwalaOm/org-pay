import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

  class _UsersListState extends State<UsersList> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CupertinoSearchTextField(
          backgroundColor: Colors.white70,
          controller: _searchController,

        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "User",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "List",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
          ),

           StreamBuilder<QuerySnapshot>(
               stream: FirebaseFirestore.instance.collection('UserList').snapshots(),
              builder: (context,snapshot){
              List<Row> userWidgets = [];

              if(snapshot.hasData)
              {
                 final users = snapshot.data?.docs.reversed.toList();
                 for(var user in users!)
               {
                  final userWidget = Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(user['FullName'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text(user['Email'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text(user['PhNo'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text(user['HouseNo'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          ],
         );

                  userWidgets.add(userWidget);

               }
              }

              return Expanded(
                child: ListView(
                  children: userWidgets,
                ),
              );
              }
           ),
    ],
      ),
    );
  }

}


