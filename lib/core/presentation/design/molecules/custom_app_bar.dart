import 'package:challenge_keppri/core/presentation/design/atoms/custom_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onPressed;
  const CustomAppBar({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const CustomText(
        "Bienvenido a tu nuevo comienzo",
        fontSize: 14,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
        ),
        color: Colors.white,
        onPressed: onPressed ?? () {},
      ),
    );
  }
}
