import 'package:flutter/material.dart';

import '../data.dart';

class StockDetailPage extends StatelessWidget {
  final Stock stock;
  const StockDetailPage({required this.stock, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(stock.name),),
      body: Center(
        child: Text(stock.price.toString()),
      ),
    );
  }
}