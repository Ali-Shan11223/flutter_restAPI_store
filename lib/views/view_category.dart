import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products_model.dart';
import '../services/api_handler.dart';
import '../widgets/product_widget.dart';

class ViewCategory extends StatefulWidget {
  final String title;
  final String id;
  const ViewCategory({super.key, required this.id, required this.title});

  @override
  State<ViewCategory> createState() => _ViewCategoryState();
}

class _ViewCategoryState extends State<ViewCategory> {
  List<ProductsModel>? productsModel;

  @override
  void didChangeDependencies() {
    getCategoryProducts();
    super.didChangeDependencies();
  }

  Future<List<ProductsModel>> getCategoryProducts() async {
    return productsModel =
        await APIHandler.getProductsByCategory(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<ProductsModel>>(
          future: getCategoryProducts(),
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
