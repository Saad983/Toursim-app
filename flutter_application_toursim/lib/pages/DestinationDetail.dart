// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_toursim/pages/GetDesByName.dart';
import 'package:flutter_application_toursim/pages/confirm_booking.dart';
import 'package:flutter_application_toursim/pages/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_application_toursim/pages/Favourites.dart';
import 'package:flutter_application_toursim/services/NetworkHelper.dart';

class Destinationdetail extends StatefulWidget {
  const Destinationdetail({
    super.key,
    required this.title,
  });

  final String title;
  @override
  State<Destinationdetail> createState() => _DestinationdetailState();
}

bool isFavorite(String destinationId) {
  return favorites.any((destination) =>
      destination['destination_id'].toString() == destinationId);
}

class _DestinationdetailState extends State<Destinationdetail> {
  late List destination;
  late List destinationDetail;

  Future<http.Response> _getDestinationbyID() async {
    final http.Response response =
        await Network().postData({'id': widget.title}, '/getDesById.php');
    print('response ----${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        destinationDetail = res['destinations'];
      });
    });
    return response;
  }

  Future<http.Response> _addBooking() async {
    final http.Response response = await Network().postData(
        {'dest_id': widget.title, 'per_person_price': '', 'total_person': ''},
        '/addtoBooking.php');
    print('response ----${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        destinationDetail = res['destinations'];
      });
    });
    return response;
  }

  @override
  void initState() {
    _getDestinationbyID();
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
                        builder: (context) => DestinationByName(title: name)));
              },
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250.h,
              child: Image.asset(
                '${destinationDetail[0]["image"]}',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${destinationDetail[0]['destination_name'].toString()} ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs.${destinationDetail[0]['person_price']}/-',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      destinationDetail[0]['description'].toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              fixedSize: Size(80.w, 100.h),
                              backgroundColor: Colors.blue.shade600,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.r))),
                          onPressed: () {},
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                isFavorite(destinationDetail[0]
                                            ['destination_id']
                                        .toString())
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite(destinationDetail[0]
                                            ['destination_id']
                                        .toString())
                                    ? Colors.red
                                    : Colors.black,
                                size: 30.sp,
                              ),
                              onPressed: () {
                                setState(() {
                                  String destinationId = destinationDetail[0]
                                          ['destination_id']
                                      .toString();
                                  if (isFavorite(destinationId)) {
                                    // Remove from favorites
                                    favorites.removeWhere((destination) =>
                                        destination['destination_id']
                                            .toString() ==
                                        destinationId);
                                  } else {
                                    // Add to favorites
                                    favorites.add(destinationDetail[0]);
                                  }
                                });
                              },
                            ),
                          )),
                      SizedBox(
                        width: 160.w,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              fixedSize: Size(100.w, 120.h),
                              backgroundColor: Colors.blue.shade600,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.r))),
                          onPressed: () {
                            final route1 = MaterialPageRoute(
                                builder: (contex) => ConfirmBookingPage(
                                      price: double.parse(
                                          destinationDetail[0]['person_price']),
                                      destId: int.parse(destinationDetail[0]
                                          ['destination_id']),
                                      destName: destinationDetail[0]
                                          ['destination_name'],
                                      image: destinationDetail[0]['image'],
                                    ));
                            Navigator.push(context, route1);
                          },
                          child: Text(
                            'Book Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ])),
          ],
        ),
      ),
    ));
  }
}
