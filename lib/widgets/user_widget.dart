import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restapi_storeapp/models/user_model.dart';
import 'package:provider/provider.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userPorvider = Provider.of<UsersModel>(context);

    final size = MediaQuery.of(context).size;

    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FancyShimmerImage(
          height: size.width * 0.15,
          width: size.width * 0.15,
          errorWidget: const Icon(
            Icons.dangerous,
            color: Colors.red,
          ),
          imageUrl: userPorvider.avatar.toString(),
          boxFit: BoxFit.cover,
        ),
      ),
      title: Text(userPorvider.name.toString()),
      subtitle: Text(userPorvider.email.toString()),
      trailing: Text(
        userPorvider.role.toString(),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
