import 'package:flutter/material.dart';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/NetworkHelper.dart';

class AddDestintion extends StatefulWidget {
  const AddDestintion({super.key, required this.title});

  final String title;

  @override
  State<AddDestintion> createState() => _AddDestintionState();
}

class _AddDestintionState extends State<AddDestintion> {
  // ignore: non_constant_identifier_names
  String destination_name = "";
  String dsc = "";
  String cityId = "";
  String address = "";
  String msg = '';

  final _formKey = GlobalKey<FormState>();

  validate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        //  msg = "Your Registration has been completed please signIn";
        _addproduct();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Your Destination has been saved',
          style: TextStyle(
              fontSize: 12.sp, color: Colors.blue, fontWeight: FontWeight.bold),
        )));
      });
    }
  }

  void showConDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Information',
              style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            content: Text(
              'Do You want to submit this record',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: MaterialButton(
                      onPressed: () {
                        validate();
                        Navigator.of(context).pop();
                      },
                      color: Colors.grey,
                      minWidth: 80.w,
                      child: Text(
                        'Ok',
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.grey,
                    minWidth: 100,
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }

  //api calling function

  Future<http.Response> _addproduct() async {
    final http.Response response = await Network().postData({
      "name": destination_name,
      "descripion": dsc,
      "city_id": cityId,
      "address": address
    }, '/addDestination.php');

    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        // _employee = res['user'];
        msg = res['msg'];
      });
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        title: const Text("Add Destination"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                msg = "Search Pressed";
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              setState(() {
                msg = "vertical Pressed";
              });
            },
          ),
        ],
      ),
      body: Container(
          height: 900.sh,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.green],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Add Destinations',
                      style: TextStyle(
                          fontSize: 48.sp,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter Destination Name"),
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty) {
                            destination_name = "";
                          } else {
                            destination_name = value;
                          }
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name must be entered";
                        }
                        return null;
                      },
                    ),
                    const Divider(),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Enter Description"),
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty) {
                            dsc = "";
                          } else {
                            dsc = value;
                          }
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Description must be entered";
                        }
                        return null;
                      },
                    ),
                    const Divider(),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Enter City Id"),
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      maxLines: 5,
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty) {
                            cityId = "";
                          } else {
                            cityId = value;
                          }
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "city Id must be entered";
                        }
                        return null;
                      },
                    ),
                    const Divider(),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Enter Address"),
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty) {
                            address = "";
                          } else {
                            address = value;
                          }
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Address must be entered";
                        }
                        return null;
                      },
                    ),
                    const Divider(),
                    MaterialButton(
                      onPressed: () {
                        showConDialog(context);
                      },
                      color: Colors.grey,
                      minWidth: 300,
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
