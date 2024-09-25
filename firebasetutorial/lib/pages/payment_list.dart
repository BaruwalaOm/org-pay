import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({super.key});

  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {

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
                  "Payment",
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
              stream: FirebaseFirestore.instance.collection('PaymentList').snapshots(),
              builder: (context,snapshot){
                List<Row> paymentWidgets = [];

                if(snapshot.hasData)
                {
                  final users = snapshot.data?.docs.reversed.toList();
                  for(var user in users!)
                  {
                    final paymentWidget = Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(user['FullName']),
                        Text(user['PhNo']),
                        //Text(user['PaymentProcess'].toString()),
                       Text(user['PaymentType'].toString())
                        //Text(user['HouseNo']),
                      ],
                    );

                    paymentWidgets.add(paymentWidget);

                  }
                }

                return Expanded(
                  child: ListView(
                    children: paymentWidgets,
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}



