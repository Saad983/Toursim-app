// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_toursim/pages/DestinationDetail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_application_toursim/pages/Favourites.dart';
import 'package:flutter_application_toursim/services/NetworkHelper.dart';

class DestinationByName extends StatefulWidget {
  const DestinationByName({super.key, required this.title});

  final String title;
  @override
  State<DestinationByName> createState() => _DestinationByNameState();
}

class _DestinationByNameState extends State<DestinationByName> {
  late List DestinationByName;

  Future<http.Response> _getDestinationbyName() async {
    final http.Response response = await Network()
        .postData({'name': widget.title}, '/getAllDesbyName.php');
    print('response ----${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        DestinationByName = res['destinations'];
      });
    });
    return response;
  }

  @override
  void initState() {
    _getDestinationbyName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Search here',
                    labelText: 'Search here',
                    suffixIcon: Icon(Icons.search)),
              ),
              actions: [
                Icon(
                  Icons.more_vert,
                  size: 27.sp,
                )
              ],
            ),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: DestinationByName.length,
              itemBuilder: (context, index) {
                var item = DestinationByName[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Destinationdetail(
                                    title: item['destination_id'].toString()),
                              ));
                        },
                        child: Container(
                          height: 170.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 5.w),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.r),
                                      child: Opacity(
                                        opacity: 0.9,
                                        child: Image.asset(
                                          '${item["image"]}',
                                          height: 130.h,
                                          width: 100.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        item['destination_name']
                                            .toString(), // Replace with actual data key
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${item['description'].toString().substring(0, 25)}...',
                                            // Replace with actual data key
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 40.w,
                                          ),
                                          Text(
                                            'Rs.25,999', // Replace with actual price data
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '4.5', // Replace or dynamically generate rating
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          SizedBox(width: 10.w),
                                          Icon(
                                            Icons.star,
                                            size: 20.sp,
                                            color: Colors.yellow.shade700,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 20.sp,
                                            color: Colors.yellow.shade700,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 20.sp,
                                            color: Colors.yellow.shade700,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          Container(
                                              height: 30.h,
                                              width: 70.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r)),
                                              child: const Center(
                                                  child: Text('11:00 PM'))),
                                          SizedBox(width: 10.w),
                                          Container(
                                              height: 30.h,
                                              width: 70.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r)),
                                              child: const Center(
                                                  child: Text('01:00 PM'))),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(width: 10.w, height: 20.h),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}
