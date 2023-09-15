import 'package:flutter/material.dart';
import 'package:flutter_restapi_storeapp/constants/app_constants.dart';
import '../widgets/card_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/product_widget.dart';
import '../widgets/search_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

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
                const Icon(Icons.notifications_on_outlined)
              ],
            ),
            height(14),
            const SearchTextField(),
            height(14),
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
                Text('See All', style: buttonTextStyle)
              ],
            ),
            height(12),
            Expanded(
              child: GridView.builder(
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
            )
          ],
        ),
      )),
    );
  }
}
