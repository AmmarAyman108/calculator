import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    bool v = AdaptiveTheme.of(context).mode.isDark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              v = !v;
              setState(() {});
              if (v) {
                AdaptiveTheme.of(context).setDark();
              } else {
                AdaptiveTheme.of(context).setLight();
              }
            },
            icon: (v)
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode)),
      ],
    );
  }
}
