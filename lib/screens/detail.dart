import 'package:flutter/material.dart';
import 'package:restaurant/main.dart';

class DetailPage extends StatefulWidget {

  final String url;
  DetailPage (this.url);

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Chip(
        padding: EdgeInsets.fromLTRB(55, 12, 55, 12),
        backgroundColor: Colors.orange,
        label: Text("Book now",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),
      body: Stack(
        children: [
          Hero(
            tag: widget.url,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    widget.url),
                fit: BoxFit.cover,
              )),
            ),
          ),
          Positioned(
            top: 40,
            right: 15.0,
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.4),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          buildAvatar(105.0,
              "https://images.pexels.com/photos/1260968/pexels-photo-1260968.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1260968.jpg&fm=jpg"),
          buildAvatar(85.0,
              "https://images.pexels.com/photos/1775043/pexels-photo-1775043.jpeg?cs=srgb&dl=pexels-mariana-kurnyk-1775043.jpg&fm=jpg"),
          buildAvatar(65.0,
              "https://images.pexels.com/photos/3186654/pexels-photo-3186654.jpeg?cs=srgb&dl=pexels-nerfee-mirandilla-3186654.jpg&fm=jpg"),
          buildAvatar(45.0,
              "https://images.pexels.com/photos/1092730/pexels-photo-1092730.jpeg?cs=srgb&dl=pexels-trang-doan-1092730.jpg&fm=jpg"),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.40,
            left: 25.0,
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(width: 1.0, color: Colors.white),
                borderRadius: BorderRadius.circular(20.0),
              ),
              alignment: Alignment.center,
              child: Text(
                "4.5",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: 25.0,
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ]),
                    child: Text(
                      "176 reviews, 10 Friends",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Sys Brunch",
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildItemRow(context),
                    buildItemRow(context),
                    buildItemRow(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildItemRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            fit:BoxFit.cover,
                            image: NetworkImage("https://images.pexels.com/photos/52526/sign-places-travel-information-52526.jpeg?cs=srgb&dl=pexels-pixabay-52526.jpg&fm=jpg"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Vegetables",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),),
                          SizedBox(height: 15.0,),
                          Container(
                            width: MediaQuery.of(context).size.width -150,
                            child: Text("You should consume 1 1/2 cups of vegetables per day according",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
  }

  Positioned buildAvatar(double leftPosition, String url) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.40,
      left: leftPosition,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 1.0, color: Colors.white),
        ),
      ),
    );
  }
}
