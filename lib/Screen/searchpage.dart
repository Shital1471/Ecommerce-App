import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  Stream<List<dynamic>>? productStream;
  String value;
  SearchPage({
    super.key,
    required this.productStream,
    required this.value,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
