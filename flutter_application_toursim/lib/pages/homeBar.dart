// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_toursim/pages/Favourites.dart';
import 'package:flutter_application_toursim/pages/destination.dart';
import 'package:flutter_application_toursim/pages/homepage.dart';

class Homebar extends StatefulWidget {
  const Homebar({super.key, required String type, required this.title});

  final String title;
  @override
  State<Homebar> createState() => _HomebarState();
}

class _HomebarState extends State<Homebar> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    //isistrah edit aur deletet mein bhihai
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(children: [
          const HomePage(
            title: '',
          ),
          DestinationPage(
            title: widget.title, //ye walal page jis mein show hoga Okay
          ),
          const FavouritePage(
            title: '',
          ),
        ]),
        bottomNavigationBar: const SafeArea(
            child: TabBar(tabs: [
          Tab(icon: Icon(Icons.home), text: "Main"),
          Tab(icon: Icon(Icons.location_on_sharp), text: "Locations"),
          Tab(icon: Icon(Icons.favorite_rounded), text: "Favourite")
        ])),
      ),
    );
  }
}
