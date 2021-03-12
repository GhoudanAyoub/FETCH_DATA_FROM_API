import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final String apiUrl =
      "http://ninanews.com/NinaNewsService/api/values/GetLastXBreakingNews?rowsToReturn=1";

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body)['Data'];
  }

  bool giftBool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black.withOpacity(0.2),
        child: Center(
          child: Stack(
            children: <Widget>[
              GiftList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget GiftList() {
    return Container(
      alignment: Alignment.bottomRight,
      child: Container(
        height: 2 * MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: 2 * MediaQuery.of(context).size.height / 3 - 50,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 0, 0, 0),
                    child: MaterialButton(
                      minWidth: 0,
                      onPressed: () {},
                      child: Icon(
                        Icons.lock_clock,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      shape: CircleBorder(),
                      elevation: 2.0,
                      color: Colors.red,
                      padding: const EdgeInsets.all(12.0),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text(
                      'Purchase Coins',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey[800],
                    thickness: 0.5,
                    height: 0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 150, 0, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: clipsWidget(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    giftBool = !giftBool;
                  });
                },
                child: Container(
                  color: Colors.grey[850],
                  alignment: Alignment.bottomCenter,
                  height: 50,
                  child: Stack(
                    children: <Widget>[
                      Container(
                          height: double.maxFinite,
                          alignment: Alignment.center,
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget clipsWidget() {
    return Container(
      height: 250,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Row(
        children: [
          Column(
            children: [
              roundedContainer(Colors.redAccent, "asset/gift/Bike.png", 200),
              SizedBox(
                height: 15,
              ),
              roundedContainer(
                  Colors.greenAccent, "asset/gift/Balloon.png", 25),
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            children: [
              roundedContainer(
                  Colors.orangeAccent, "asset/gift/Camera.png", 100),
              SizedBox(height: 15),
              roundedContainer(Colors.purpleAccent, "asset/gift/Car.png", 300),
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            children: [
              roundedContainer(Colors.blue, "asset/gift/Drinks.png", 15),
              SizedBox(
                height: 15,
              ),
              roundedContainer(
                  Colors.lightGreenAccent, "asset/gift/Flower.png", 10),
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            children: [
              roundedContainer(Colors.white, "asset/gift/Glasses.png", 70),
              SizedBox(
                height: 15,
              ),
              roundedContainer(
                  Colors.deepOrangeAccent, "asset/gift/Ice Cream.png", 25),
            ],
          ),
          SizedBox(width: 15),
          Column(
            children: [
              roundedContainer(Colors.pink, "asset/gift/Love.png", 500),
              SizedBox(
                height: 15,
              ),
              roundedContainer(Colors.brown, "asset/gift/Ring.png", 1000),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundedContainer(Color color, assetName, price) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print(price.toString());
            checkPacket(price);
          },
          child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Hero(
                tag: "image-",
                child: Image(
                  image: AssetImage(assetName),
                  height: 40,
                ),
              )),
        ),
        Text(
          "${price.toString()} C",
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  void checkPacket(price) {}
}
