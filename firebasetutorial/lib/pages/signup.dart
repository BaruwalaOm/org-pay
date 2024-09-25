import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authFunctions.dart';
import 'login.dart';

class signup  extends StatefulWidget {
  const signup ({super.key});

  @override
  State<signup > createState() => signup_State();
}

class signup_State extends State<signup> {

  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String fullname = '';
  bool signup = false;
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("SIGN UP"),),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    RadioListTile(
                      title: Text('Admin', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
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
                      title: Text('User', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),

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
                    signup
                        ? Container()
                        : TextFormField(
                      key: ValueKey('Full name'),
                      decoration: InputDecoration(hintText: 'Enter Full name',  prefixIcon: Icon(Icons.face),),
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      /* validator: (value) {
                      if (value!.isEmpty){
                        return 'Please Enter full name';
                      } else {
                        return null;
                      }
                  }, */

                      onSaved: (value) {
                        setState(() {
                          fullname = value!;
                        });
                      },
                    ),

                    TextFormField(
                      key: ValueKey('email'),
                      decoration: InputDecoration(hintText: 'Enter email',  prefixIcon: Icon(Icons.email_outlined),),
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      /* validator: (value) {
                      if (value!.isEmpty){
                        return 'Please Enter full name';
                      } else {
                        return null;
                      }
                  }, */

                      onSaved: (value) {
                        setState(() {
                          email = value!;
                        });
                      },
                    ),

                    TextFormField(
                      key: ValueKey('password'),
                      decoration: InputDecoration(hintText: 'Enter password',  prefixIcon: Icon(Icons.lock_outline),),
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      /* validator: (value) {
                      if (value!.isEmpty){
                        return 'Please Enter full name';
                      } else {
                        return null;
                      }
                  }, */

                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                    ),

                    SizedBox(height: 30,),
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                              signup
                                  //?AuthServices.signin(email, password, fullname, context)
                                  : AuthServices.signup(email, password, fullname, _selectedValue == 1 ? 'Admin' : 'User',context);
                            }
                          },

                          child: Text(signup ? 'Sign Up' : ' Sign Up', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                    ),
                    SizedBox(height: 10,),

                    SizedBox(height: 30,),
                    ElevatedButton(onPressed: (() => Get.to(Login())), child: Text("Already Have An Account?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                  ]
              ),
            ),
          ),
        )
    );
  }
}