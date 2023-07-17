import 'package:flutter/material.dart';
import 'package:suitmedia_flutter/components/custom_button.dart';
import 'package:suitmedia_flutter/components/text_input.dart';
import 'package:suitmedia_flutter/utils/constants/app_images.dart';
import 'package:suitmedia_flutter/utils/constants/app_screens.dart';
import 'package:suitmedia_flutter/utils/is_palindrome.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final palindromeController = TextEditingController();

    checkPalindrome(String text) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Hello ${nameController.text},\n $text Is ${isPalindrome(text) ? 'Palindrome' : 'Not Palindrome'}',
                textAlign: TextAlign.center,
              ),
            );
          });
    }

    checkName(String text) {
      if (text.isEmpty) {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                title:
                    Text('Name cannot be empty', textAlign: TextAlign.center)));
      }

      return null;
    }

    return Scaffold(
        body: Container(
      height: double.maxFinite,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImages.bgGradient,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.icPhoto, width: 116, height: 116),
          const SizedBox(height: 51),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextInput(
                  hintText: "Name",
                  controller: nameController,
                  type: TextInputType.text,
                ),
                const SizedBox(height: 15),
                TextInput(
                  hintText: "Palindrome",
                  controller: palindromeController,
                  type: TextInputType.text,
                ),
                const SizedBox(height: 45),
                CustomButton(
                  text: "CHECK",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      checkPalindrome(palindromeController.text);
                    }
                  },
                ),
                const SizedBox(height: 15),
                CustomButton(
                  text: "NEXT",
                  onPressed: () {
                    if (nameController.text.isEmpty) {
                      checkName(nameController.text);
                    } else {
                      Navigator.pushNamed(context, AppScreens.secondScreen,
                          arguments: nameController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
