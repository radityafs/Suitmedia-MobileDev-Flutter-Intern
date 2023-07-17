import 'package:flutter/material.dart';
import 'package:suitmedia_flutter/components/custom_app_bar.dart';
import 'package:suitmedia_flutter/components/custom_button.dart';
import 'package:suitmedia_flutter/models/user_model.dart';
import 'package:suitmedia_flutter/utils/constants/app_screens.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  User? selectedUser;

  Widget _userCard() {
    if (selectedUser is User) {
      return Column(children: [
        CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              selectedUser!.avatar,
            )),
        const SizedBox(height: 16),
        Text(
          "${selectedUser!.firstName} ${selectedUser!.lastName}",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          selectedUser!.email.toUpperCase(),
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ]);
    } else {
      return const Text(
        "No User Selected",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: const CustomAppBar(title: "Second Screen"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 13,
                ),
                child: Flex(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  direction: Axis.vertical,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 5),
                          Text(args.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18)),
                        ]),
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            "Selected User",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 12),
                          _userCard(),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        CustomButton(
                            text: "Choose a user",
                            onPressed: () {
                              Navigator.pushNamed(
                                      context, AppScreens.thirdScreen)
                                  .then((value) {
                                setState(() {
                                  if (value != null) {
                                    selectedUser =
                                        userFromJson(value.toString());
                                  }
                                });
                              });
                            }),
                        const SizedBox(height: 30)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
