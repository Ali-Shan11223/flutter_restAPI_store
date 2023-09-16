import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api_handler.dart';
import '../widgets/user_widget.dart';
import 'package:provider/provider.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: FutureBuilder<List<UsersModel>>(
          future: APIHandler.getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text('An error occured: ${snapshot.hasError}'));
            } else if (snapshot.data == null) {
              return const Center(
                  child: Text('No users has been fetched yet!!!'));
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                      value: snapshot.data![index], child: const UserWidget());
                });
          }),
    );
  }
}
