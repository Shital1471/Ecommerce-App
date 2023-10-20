import 'dart:developer';

import 'package:ecommerce/Screen/gridpage.dart';
import 'package:ecommerce/Screen/seepage.dart';
import 'package:flutter/material.dart';

import '../APIS/Model/products.dart';
import '../APIS/apis.dart';
import 'categories.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  TextEditingController _textEditingController = TextEditingController();

  Stream<List<dynamic>>? productStream;
   List<Product> allProducts = [];
  
  @override
  void initState() {
    super.initState();
    log("init function called");
    // productStream = Stream.fromFuture(API.getCategories());
     _loadData();
    log("init not function called");
  }

  void _loadData() {
   API.getCategories().then((data) {
      setState(() {
        allProducts = data.map((item) => Product.fromJson(item)).toList();
        productStream = Stream.value(allProducts);
      });
    });
  }

  void _searchElement(String value) {
    setState(() {
      productStream = Stream.value(allProducts.where((product) =>
          product.title.toLowerCase().contains(value.toLowerCase())).toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(image: AssetImage('Images/shopping.png'),fit: BoxFit.cover)
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "Hello,\n",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Shital Gupta',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ))
                        ])),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.notifications,size: 30,),
                        SizedBox(width: 10,),
                        Icon(Icons.format_align_justify,size: 30,)
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                      hintText: 'Search for brand...',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: Icon(Icons.search)
                      ),
                      onSubmitted: (value) {
                    _searchElement(value);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CategoryScreen(),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New Arrival',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => SeePage()));
                            },
                            child: Text(
                              'See All',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 300,
                        child: StreamBuilder<List<dynamic>>(
                            stream: productStream,
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                case ConnectionState.none:
                                  return Center(
                                      child: CircularProgressIndicator());
                                case ConnectionState.active:
                                case ConnectionState.done:
                              }
                              final products = snapshot.data!;
                              return GridPage(
                                products: products,
                                sizes: 10,
                              );
                            }),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
