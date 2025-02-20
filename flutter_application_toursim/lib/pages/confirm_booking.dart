import 'package:flutter/material.dart';
import 'package:flutter_application_toursim/pages/bookedDestination.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmBookingPage extends StatefulWidget {
  const ConfirmBookingPage(
      {super.key,
      required this.price,
      required this.destId,
      required this.destName,
      required this.image});

  final double price;
  final int destId;
  final String destName;
  final String image;
  @override
  State<ConfirmBookingPage> createState() => _ConfirmBookingPageState();
}

class _ConfirmBookingPageState extends State<ConfirmBookingPage> {
  final _formKey = GlobalKey<FormState>();
  int totalPerson = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 25, vertical: kToolbarHeight),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: widget.destName,
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'DestinationName',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: '${widget.price}',
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Price Per Person',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value == '') {
                        return 'Total Person must be required';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        totalPerson = int.parse(value);
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Enter Total Person',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blueAccent)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showConDialog(context);
                          }
                        },
                        child: const Text(
                          'Confirm Booking',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ))),
    );
  }

  void showConDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Information',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            content: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'Do you want to Book the destination ${widget.destName}',
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Perons :',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text('$totalPerson'),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Price :',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text('${totalPerson * widget.price}'),
                  ],
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      final route = MaterialPageRoute(
                        builder: (context) => BookedDestination(
                          destId: widget.destId,
                          destName: widget.destName,
                          price: widget.price,
                          image: widget.image,
                        ),
                      );
                      Navigator.push(context, route);
                    },
                    color: Colors.grey,
                    minWidth: 80,
                    child: const Text(
                      'Ok',
                      style: TextStyle(
                          fontSize: 22,
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
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 22,
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
}
