import 'package:flutter/material.dart';
import 'package:flutter_restapi_storeapp/constants/app_constants.dart';

import '../widgets/card_widget.dart';

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
            const CardWidget()
          ],
        ),
      )),
    );
  }
}

