import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {this.title,
      this.isBackButtonExist = true,
      this.onBackButtonPressed,
      this.titleColor = Colors.black,
      this.backgroundColor = Colors.white});

  final String? title;
  final bool isBackButtonExist;
  final VoidCallback? onBackButtonPressed;
  final Color? titleColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(title!,
              style: TextStyle(
                color: titleColor,
              ))
          : null,
      centerTitle: true,
      leading: isBackButtonExist
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Theme.of(context).dialogBackgroundColor,
              onPressed: onBackButtonPressed,
            )
          : SizedBox(),
      backgroundColor: backgroundColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(1170, 50);
}
