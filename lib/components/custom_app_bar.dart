import 'package:flutter/material.dart';
import 'package:suitmedia_flutter/utils/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {

    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(
          color: Color(0xffE2E3E4),
          thickness: 2,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(0),
          ),
        ),
        icon: const Icon(
          Icons.chevron_left,
          size: 32,
          color: AppColors.purpleColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
