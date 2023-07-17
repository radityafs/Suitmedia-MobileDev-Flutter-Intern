import 'package:flutter/material.dart';
import 'package:suitmedia_flutter/models/user_model.dart';

class CardUser extends StatelessWidget {
  const CardUser({super.key, required this.user, required this.onTap});

  final User user;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(user),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  user.avatar,
                )),
            title: Text(
              "${user.firstName} ${user.lastName}",
            ),
            subtitle: Text(
              user.email.toUpperCase(),
            ),
          ),
          const Divider(
            color: Color(0xffE2E3E4),
            height: 1,
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }
}
