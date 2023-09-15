import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/api_handler.dart';
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
      appBar: AppBar(title: const Text('All Products')),
      body: FutureBuilder(
          future: APIHandler.getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('An error has occured: ${snapshot.hasError}'),
              );
            } else if (snapshot.data == null) {
              return const Center(
                child: Text('No products has been fetched yet!!!'),
              );
            }
            return GridView.builder(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                      value: snapshot.data![index],
                      child: const ProductWidget());
                });
          }),
    );
  }
}
