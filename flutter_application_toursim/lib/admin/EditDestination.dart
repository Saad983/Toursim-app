import 'package:flutter/material.dart';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/NetworkHelper.dart';

class EditDestination extends StatefulWidget {
  const EditDestination({super.key, required this.title});

  final String title;

  @override
  State<EditDestination> createState() => _EditDestinationState();
}

class _EditDestinationState extends State<EditDestination> {
  String name = "";
  String desc = "";
  String address = "";
  String msg = "";

  final _formKey = GlobalKey<FormState>();

  validate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        //  msg = "Your Registration has been completed please signIn";
        _Editdestinations();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Your Destination has been updated',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      validate();
                      Navigator.of(context).pop();
                    },
                    color: Colors.grey,
                    child: Text(
                      'Ok',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.grey,
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
  late List destinations;

  Future<http.Response> _getdestinations1() async {
    final http.Response response =
        await Network().postData({"id": widget.title}, '/getDesById.php');

    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        destinations = res['destinations'];
        name = destinations[0]['destination_name'];
        desc = destinations[0]['description'];
        address = destinations[0]['address'];
      });
    });
    return response;
  }

  Future<http.Response> _Editdestinations() async {
    final http.Response response = await Network().postData(
        {"name": name, "desc": desc, "address": address, "pid": widget.title},
        '/updateDestination.php');

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
  void initState() {
    _getdestinations1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade400,
          title: TextFormField(
            decoration: const InputDecoration(
                hintText: 'Search here', labelText: 'Search here'),
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  name = '';
                } else {
                  name = value;
                }
              });
            },
          ),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Update Destinations',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  const Divider(),
                  Text(
                    '  $msg ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  TextFormField(
                    initialValue: '${destinations[0]['destination_name']}',
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          name = "";
                        } else {
                          name = value;
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Destination Name must be entered";
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    initialValue: '${destinations[0]['description']}',
                    maxLines: 3,
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          desc = "";
                        } else {
                          desc = value;
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
                    initialValue: '${destinations[0]['address']}',
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
                        return "Destination address must be entered";
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.blue.shade600,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.r))),
                      onPressed: () {
                        showConDialog(context);
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )),
        )
        // Container(
        //     height: 900.sh,
        //     decoration: const BoxDecoration(
        //         gradient: LinearGradient(
        //             colors: [Colors.white, Colors.green],
        //             begin: Alignment.topCenter,
        //             end: Alignment.bottomCenter)),
        //     child: Padding(
        //       padding: EdgeInsets.only(left: 20.sw, right: 20.sw),
        //       child: Form(
        //         key: _formKey,
        //         child: Center(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: <Widget>[
        //               Text(
        //                 'Edit destinations of destinations id ${widget.title}',
        //                 style: TextStyle(
        //                     fontSize: 22.sp,
        //                     color: Colors.blue,
        //                     fontWeight: FontWeight.bold),
        //               ),
        //               const Divider(),
        //               Text(
        //                 '${msg}',
        //                 style: TextStyle(
        //                     fontSize: 22.sp,
        //                     color: Colors.red,
        //                     fontWeight: FontWeight.bold),
        //               ),

        //               TextFormField(
        //                 decoration:
        //                     const InputDecoration(hintText: "Enter Description"),
        //                 initialValue: "${destinations[0]["description"]}",
        //                 keyboardType: TextInputType.multiline,
        //                 minLines: 3,
        //                 maxLines: 5,
        //                 onChanged: (value) {
        //                   setState(() {
        //                     if (value.isEmpty)
        //                       desc = "";
        //                     else
        //                       desc = value;
        //                   });
        //                 },
        //                 validator: (value) {
        //                   if (value == null || value.isEmpty) {
        //                     return "Description must be entered";
        //                   }
        //                   return null;
        //                 },
        //               ),
        //               Divider(),
        //               TextFormField(
        //                 decoration: InputDecoration(hintText: "Enter Address"),
        //                 initialValue: "${destinations[0]["address"]}",
        //                 keyboardType: TextInputType.multiline,
        //                 minLines: 3,
        //                 maxLines: 5,
        //                 onChanged: (value) {
        //                   setState(() {
        //                     if (value.isEmpty)
        //                       desc = "";
        //                     else
        //                       desc = value;
        //                   });
        //                 },
        //                 validator: (value) {
        //                   if (value == null || value.isEmpty) {
        //                     return "Address must be entered";
        //                   }
        //                   return null;
        //                 },
        //               ),
        //               Divider(),
        //               MaterialButton(
        //                 onPressed: () {
        //                   showConDialog(context);
        //                 },
        //                 color: Colors.grey,
        //                 minWidth: 300,
        //                 child: Text(
        //                   'Submit',
        //                   style: TextStyle(
        //                       fontSize: 22.sp,
        //                       color: Colors.red,
        //                       fontWeight: FontWeight.bold),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     )
        //     ),
        );
  }
}
