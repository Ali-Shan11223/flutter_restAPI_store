import 'package:flutter/material.dart';
import 'package:flutter_restapi_storeapp/constants/app_constants.dart';
import '../models/products_model.dart';
import '../services/api_handler.dart';
import '../widgets/card_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/product_widget.dart';
import '../widgets/search_textfield.dart';
import 'all_products.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'all_users.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Welcome to RESTAPI Store',
                  style: titleTextStyle,
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const AllUsers(),
                              type: PageTransitionType.fade));
                    },
                    child: const Icon(Icons.supervised_user_circle_outlined))
              ],
            ),
            height(14),
            const SearchTextField(),
            height(14),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CardWidget(),
                    height(14),
                    Text(
                      'Categories',
                      style: titleTextStyle,
                    ),
                    height(14),
                    const CategoryWidget(),
                    height(12),
                    Row(
                      children: [
                        Text(
                          'Popular Products',
                          style: titleTextStyle,
                        ),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const AllProducts(),
                                      type: PageTransitionType.fade));
                            },
                            child: Text('See All', style: buttonTextStyle))
                      ],
                    ),
                    height(12),
                    FutureBuilder<List<ProductsModel>>(
                        future: APIHandler.getAllProducts(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(
                                    'An error occured: ${snapshot.hasError}'));
                          } else if (snapshot.data == null) {
                            return const Center(
                                child: Text(
                                    'No products has been fetched yet!!!'));
                          }
                          return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 0.75),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ChangeNotifierProvider.value(
                                    value: snapshot.data![index],
                                    child: const ProductWidget());
                              });
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
