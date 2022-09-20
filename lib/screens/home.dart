import 'package:flutter/material.dart';
import 'package:glassmorphism/widgets/glass_morphism.dart';
import 'package:glassmorphism/widgets/home_screen_widgets.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController controller;
  final HomeScreenWidgets _homeScreenWidgets = HomeScreenWidgets();
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(
        "assets/pexels-anna-nekrashevich-8516364.mp4")
      ..initialize().then((value) {
        setState(() {});
      });
    controller.play();
    controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: VideoPlayer(
                controller,
              ),
            ),
            GlassMorphism(
              blur: 50,
              opacity: 0.3,
              color: Colors.black,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: _homeScreenWidgets.buildheader(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: _homeScreenWidgets.buildDiscover(
                              context: context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: _homeScreenWidgets.buildRecommended(
                              context: context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 20, right: 20),
                          child:
                              _homeScreenWidgets.buildRecents(context: context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
