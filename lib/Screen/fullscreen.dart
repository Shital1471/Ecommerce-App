import 'package:ecommerce/APIS/Model/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreen extends StatefulWidget {
  List<dynamic> list = [];
  FullScreen({super.key, required this.list});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      image: DecorationImage(
                          image: NetworkImage(widget.list[0].images[0]),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                      Text(
                        'Deatils',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      Icon(CupertinoIcons.heart_solid)
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.list[0].title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            widget.list[0].price.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Text(
                        widget.list[0].description,
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                      
                      Container(
                        padding: EdgeInsets.all(8),
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                elevation: 4, backgroundColor: Colors.black),
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
