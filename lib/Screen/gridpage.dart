import 'package:ecommerce/Screen/fullscreen.dart';
import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  List<dynamic> products = [];
  var sizes;

  GridPage({super.key, required this.products, required this.sizes});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 350,
          crossAxisSpacing: 5,
          mainAxisSpacing: 15,
        ),
        itemCount: widget.sizes,
        itemBuilder: (context, index) {
          final product = widget.products[index];

          return GridTile(
              child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => FullScreen(list: [product],)));
            },
            child: Card(
              elevation: 4,
              child: Container(
                height: 400,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(product.images[0]),
                              fit: BoxFit.cover)),
                    ),
                    Text(
                      product.title.toString(),
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      elevation: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.price.toString(),
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.add),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
        });
    ;
  }
}
