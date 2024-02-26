import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/img_techtool.png',
          height: 100,
        ),
        Image.asset(
          'assets/images/img_techtool.png',
          height: 70,
        ),
      ],
    );
  }
}
