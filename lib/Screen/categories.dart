import 'dart:developer';

import 'package:flutter/material.dart';

import '../APIS/Model/products.dart';
import '../APIS/apis.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Stream<List<dynamic>>? categoryStream;
  PageController _pageController = PageController(viewportFraction: 0.8);
  int currentPage = 0;
  int pagecount = 5;
  @override
  void initState() {
    super.initState();
    log("init function called");
    // Use Stream.fromFuture to create a stream from a Future
    categoryStream = Stream.fromFuture(API.getCategories());
    log("init not function called");

    startAutoPageTransition();
  }

  void startAutoPageTransition() {
    Future.delayed(const Duration(seconds: 5), () {
      if (currentPage < pagecount - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _pageController.animateToPage(currentPage,
          duration: Duration(microseconds: 500), curve: Curves.easeIn);
      startAutoPageTransition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: StreamBuilder<List<dynamic>>(
          stream: categoryStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.done:
            }

            List<Category> categories = [];
            for (dynamic data in snapshot.data!) {
              // Check if the data is of type 'Category' before adding it to the list
              if (data is Map<String, dynamic> &&
                  data['category'] is Map<String, dynamic>) {
                categories.add(Category.fromJson(data['category']));
              }
            }
            // log("data: ${categories}");

            return Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: pagecount,
                  itemBuilder: (context, index) {
                    final product = categories[index];
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(product.image),
                              fit: BoxFit.cover)),
                    );
                  },
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pagecount, (index) {
                    return GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(index,
                            duration: Duration(microseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Container(
                        width: 10,
                        height: 10,
                        margin: EdgeInsets.only(top: 180),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == currentPage
                              ? Colors.blueAccent
                              : Colors.grey,
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 10),
              ],
            );
          }),
    );
  }
}
