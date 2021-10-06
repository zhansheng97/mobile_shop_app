import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_animation_app/model/headphone.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  int currentSelectedIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(pageListener);
    super.initState();
  }

  void pageListener() {
    currentSelectedIndex = _pageController.page!.floor();
    print(_pageController.page);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var headphones = Headphone.headphoneList;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: Headphone.headphoneList.length,
              itemBuilder: (context, index) {
                final headphone = headphones[index];
                return SafeArea(
                  child: Column(
                    children: [
                      Spacer(flex: 1),
                      Stack(
                        children: [
                          Image.asset(
                            headphone.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      Spacer(flex: 1),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.2,
                          right: size.width * 0.05,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              headphone.title.toUpperCase(),
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                            Text(
                              headphone.descprition,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(flex: 4),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 40,
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  "Urbanears".toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                    letterSpacing: 1.3,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              right: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ...List.generate(
                    headphones.length,
                    (index) {
                      return ColorDot(
                        onTap: () {
                          setState(
                            () {
                              currentSelectedIndex = index;
                              _pageController.animateToPage(
                                currentSelectedIndex,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.linear,
                              );
                            },
                          );
                        },
                        headphone: headphones[index],
                        isSelected: index == currentSelectedIndex,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ColorBar extends StatefulWidget {
//   int currentIndex;
//   final List<Headphone> headphones;

//   ColorBar({
//     Key? key,
//     required this.currentIndex,
//     required this.headphones,
//   }) : super(key: key);

//   @override
//   _ColorBarState createState() => _ColorBarState();
// }

// class _ColorBarState extends State<ColorBar> {
//   @override
//   Widget build(BuildContext context) {
//     int currentIndex = widget.currentIndex;

//     return
//   }
// }

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.onTap,
    this.isSelected = false,
    required this.headphone,
  }) : super(key: key);

  final VoidCallback onTap;
  final bool isSelected;
  final Headphone headphone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? (headphone.color == Color(0xFFF9F4F1))
                      ? Colors.grey
                      : headphone.color
                  : Colors.transparent,
            ),
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(2.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: headphone.color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
