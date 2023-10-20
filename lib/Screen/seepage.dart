import 'package:ecommerce/APIS/apis.dart';
import 'package:ecommerce/Screen/gridpage.dart';
import 'package:flutter/material.dart';

import '../APIS/Model/products.dart';

class SeePage extends StatefulWidget {
  const SeePage({super.key});

  @override
  State<SeePage> createState() => _SeePageState();
}

class _SeePageState extends State<SeePage> {
  Stream<List<dynamic>>? productstream;
  List<Product> allProducts = [];
  @override
  void initState() {
    super.initState();
    // productstream = Stream.fromFuture(API.getCategories());
    _loadData();
  }

  void _loadData() {
    API.getCategories().then((data) {
      setState(() {
        allProducts = data.map((item) => Product.fromJson(item)).toList();
        productstream = Stream.value(allProducts);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
      ),
      body: Container(
          margin: EdgeInsets.all(10),
          child: StreamBuilder<List<dynamic>>(
            stream: productstream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                case ConnectionState.done:
              }
              final products = snapshot.data!;
              return GridPage(
                products: products,
                sizes: products.length,
              );
            },
          )),
    );
  }
}
