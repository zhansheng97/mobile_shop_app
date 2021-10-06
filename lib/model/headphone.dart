import 'package:flutter/material.dart';

class Headphone {
  final String category;
  final String title;
  final String descprition;
  final String imagePath;
  final Color color;

  const Headphone({
    required this.category,
    required this.title,
    required this.descprition,
    required this.imagePath,
    required this.color,
  });

  static final List<Headphone> headphoneList = [
    Headphone(
      category: "Humlan P",
      title: "Vibrant Colors",
      descprition: "Four on-trend colorways to seamlessly suit your style",
      imagePath: "assets/images/dark.png",
      color: Colors.black,
    ),
    Headphone(
      category: "Pampas",
      title: "Instant music sharing",
      descprition:
          "Use the empty socket to plug in a friend and share your music.",
      imagePath: "assets/images/powderpink.png",
      color: Color(0xFFE5BAC1),
    ),
    Headphone(
      category: "Humlan A",
      title: "Immersive sound",
      descprition:
          "Precisely tuned for a crisp, full-spectrum sound experience.",
      imagePath: "assets/images/indigo.png",
      color: Color(0xFF405465),
    ),
    Headphone(
      category: "Humlan C",
      title: "Ergonomic fit",
      descprition:
          "Listen in comfort all day thanks to a flexible construction that provides a customized fit.",
      imagePath: "assets/images/tomatored.png",
      color: Color(0xFFF6303E),
    ),
    Headphone(
      category: "Humlan B",
      title: "From Sweden",
      descprition:
          "The \"Platan\" in Plattan headphone is Swedish for the \"Slash\"",
      imagePath: "assets/images/white.png",
      color: Color(0xFFF9F4F1),
    ),
    Headphone(
      category: "Humlan D",
      title: "Bluetooth",
      descprition: "Listenen to your music free from cords.",
      imagePath: "assets/images/darkgrey.png",
      color: Color(0xFF77777B),
    ),
  ];
}
