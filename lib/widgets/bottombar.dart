import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotstar/screens/downloads_screen.dart';
import 'package:hotstar/screens/home_screen.dart';
import 'package:hotstar/screens/newandhot_screen.dart';
import 'package:hotstar/screens/profile_screen.dart';

class BottombarScreens extends StatefulWidget {
  const BottombarScreens({super.key});

  @override
  BottombarScreensState createState() => BottombarScreensState();
}

class BottombarScreensState extends State<BottombarScreens> {
  var currentIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    const Newandhotscreen(),
    const DownloadsScreen(),
    const ProfileScreen(),
  ];

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.playlist_play_rounded,
    Icons.cloud_download_rounded,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: IndexedStack(
        index: currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        // margin: const EdgeInsets.all(5),
        height: screenWidth * .155,
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              listOfIcons.length,
              (index) => InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: screenWidth * .2125,
                          child: Center(
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              height:
                                  index == currentIndex ? screenWidth * .12 : 0,
                              width: index == currentIndex
                                  ? screenWidth * .2125
                                  : 0,
                              decoration: BoxDecoration(
                                color: index == currentIndex
                                    ? Colors.black
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth * .2125,
                          alignment: Alignment.center,
                          child: Icon(
                            listOfIcons[index],
                            size: screenWidth * .076,
                            color: index == currentIndex
                                ? Colors.blueAccent
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
