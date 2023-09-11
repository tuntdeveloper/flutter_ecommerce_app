import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({Key? key, this.title, this.titleWidget})
      : super(key: key);

  final String? title;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: titleWidget ??
          Text(
            title ?? '',
            style: const TextStyle(color: Colors.black),
          ),
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => const Size(double.maxFinite, 60);
}
