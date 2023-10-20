import 'dart:developer';

import 'package:ecommerce/APIS/Model/products.dart';
import 'package:flutter/material.dart';

import '../APIS/apis.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> list = [];
  Stream<List<dynamic>>? productStream;
  @override
  void initState() {
    super.initState();
    log("init function called");
    productStream = Stream.fromFuture(API.getCategories());
    log("init not function called");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecommerce'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StreamBuilder<List<dynamic>>(
          stream: productStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
            }
            final  products = snapshot.data!;
            return ListView.builder(
             
              itemCount: products.length,
              
              itemBuilder: (context, index) {
             final product = products[index] as Map<String, dynamic>;
             
             

              return ListTile(
                  title: Text(product['title'].toString()),
                  subtitle: Text(product['description'].toString()),
                );
            });
          },
        ),
      ),
    );
  }
}
