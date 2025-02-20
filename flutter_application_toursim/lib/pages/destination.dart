import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_toursim/admin/AddDestination.dart';
import 'package:flutter_application_toursim/admin/EditDestination.dart';
import 'package:flutter_application_toursim/pages/DestinationDetail.dart';
import 'package:flutter_application_toursim/pages/GetDesByName.dart';
import 'package:flutter_application_toursim/services/NetworkHelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class DestinationPage extends StatefulWidget {
  final String title; // This will be either 'admin' or 'user'

  const DestinationPage({super.key, required this.title});

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  late List destination;
  String pid = "";
  late String msg = '';
  String name = '';
  // Fetching destinations from the server
  Future<http.Response> _getdestination() async {
    final http.Response response = await Network().postData({
      'O': '1',
      'S': '40',
    }, '/getdestination.php');
    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      destination = res["destinations"];
    });
    return response;
  }

  // Deleting a destination based on product id
  Future<http.Response> _deleteProduct() async {
    final http.Response response =
        await Network().postData({"pid": pid}, '/deleteDestination.php');
    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      msg = res['msg'];
    });
    return response;
  }

  // Show confirmation dialog before deletion
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
              'Do you want to delete the destination with ID $pid?',
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
                      _deleteProduct();
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) =>
                                  DestinationPage(title: widget.title)));
                    },
                    color: Colors.grey,
                    minWidth: 80,
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

  @override
  void initState() {
    _getdestination();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) =>
                              DestinationByName(title: name)));
                },
              ),
            ]),
        body: Column(children: [
          SizedBox(
            height: 230.h,
            width: double.infinity,
            child: Image.asset(
              'images/Quetta.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          // Only show the "Create New Destination" button for admin
          widget.title == 'admin'
              ? Center(
                  child: GestureDetector(
                    child: Container(
                      height: 50.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Center(
                        child: Text(
                          'Create New Destination',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => const AddDestintion(title: ''),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  // Howa ya nh nhi hua warna yahan box aata Aik mint Login ky page sy knsy page per aarha hai homebar
                  child: Text(
                    msg,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
          // Show the message after deletion or any other message

          SizedBox(height: 30.h),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10, // Space between columns
                  mainAxisSpacing: 10, // Space between rows
                  childAspectRatio: 0.7,
                ),
                itemCount: destination.length,
                itemBuilder: (context, index) {
                  final destinationItem = destination[index];
                  return GestureDetector(
                    child: Card(
                      margin: EdgeInsets.all(5.0.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.sp),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                '${destinationItem["image"]}',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.w),
                              child: Text(
                                "${destinationItem['destination_name']} "
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Only show Edit and Delete buttons for admin
                                widget.title == 'admin'
                                    ? Padding(
                                        padding: EdgeInsets.only(bottom: 10.h),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor:
                                                Colors.blue.shade600,
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                fullscreenDialog: true,
                                                builder: (context) =>
                                                    EditDestination(
                                                        title: destinationItem[
                                                                "destination_id"]
                                                            .toString()),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Edit',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    : const Text(''),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => Destinationdetail(
                            title: destinationItem["destination_id"].toString(),
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
