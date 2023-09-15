import 'package:flutter/material.dart';
import 'package:flutter_restapi_storeapp/constants/app_constants.dart';
import '../widgets/card_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/product_widget.dart';

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
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: const Icon(
                    Icons.search_rounded,
                    size: 30,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ))),
            ),
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

