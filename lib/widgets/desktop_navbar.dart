import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Portfolio",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          Row(
            children: [
              navButton("About"),

              const SizedBox(width: 20),
              navButton("Skills"),

              const SizedBox(width: 20),
              navButton("Projects"),

              const SizedBox(width: 20),
              navButton("Contact"),
            ],
          ),
        ],
      ),
    );
  }

  Widget navButton(String title) {
    return TextButton(
      onPressed: () {},
      child: Text(title, style: const TextStyle(fontSize: 16)),
    );
  }
}
