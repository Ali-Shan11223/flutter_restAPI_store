import 'package:flutter/material.dart';

import '../widgets/product_widget.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Products')),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.75),
          itemCount: 3,
          itemBuilder: (context, index) {
            return const ProductWidget();
          }),
    );
  }
}
