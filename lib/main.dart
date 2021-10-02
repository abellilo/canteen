import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/screens/detail.dart';

void main() {
  runApp(MyRestaurantBooking());
}

class MyRestaurantBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 25.0, top: 45.0, right: 25.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Text(
                          "Discover",
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/6177606/pexels-photo-6177606.jpeg?cs=srgb&dl=pexels-cup-of-couple-6177606.jpg&fm=jpg"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 40.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        buildTopChip("healthy", true),
                        buildTopChip("itailian", false),
                        buildTopChip("mexican", false),
                        buildTopChip("asian", false),
                        buildTopChip("chinese", false),
                        buildTopChip("haitian", false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Expanded(
                child: ListView(
                  children: <Widget>[
                    buildItem(
                        "Joe's Linder",
                        "123 reviews = S.Oxford 13th",
                        "https://images.pexels.com/photos/704569/pexels-photo-704569.jpeg?cs=srgb&dl=pexels-daria-shevtsova-704569.jpg&fm=jpg",
                        4.5),
                    buildItem(
                        "Mama's brunch",
                        "98 reviews = S. Guiler 6th",
                        "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?cs=srgb&dl=pexels-ella-olsson-1640777.jpg&fm=jpg",
                        4.5),
                    buildItem(
                        "Joe's Linder",
                        "123 reviews = S.Oxford 13th",
                        "https://images.pexels.com/photos/1095550/pexels-photo-1095550.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1095550.jpg&fm=jpg",
                        4.5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildItem(String title, String subTitle, String url,
      double rating) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => DetailPage(url)));
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.0),
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            Hero(
              tag: url,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(url),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(
                      rating.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildTopChip(String label, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Chip(
        padding: EdgeInsets.all(8.0),
        label: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        backgroundColor: isActive ? Colors.orange : Colors.grey,
      ),
    );
  }
}
