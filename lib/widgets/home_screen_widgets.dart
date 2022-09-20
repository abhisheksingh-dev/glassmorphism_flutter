import 'package:flutter/material.dart';

import 'glass_morphism.dart';

class HomeScreenWidgets {
  Widget buildheader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.bento_rounded,
          color: Colors.white,
          size: 50,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: const Color(0xffA8F452),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.person),
        ),
      ],
    );
  }

  Widget buildDiscover({required BuildContext context}) {
    List<String> dummyText = ["all", "growth", "study", "beauty", "fresh"];
    return Column(
      children: [
        Row(
          children: const [
            Text(
              "Discover",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            for (var i = 0; i < dummyText.length; i++)
              returnRowItems(isSelected: (i == 0), text: dummyText[i]),
          ],
        ),
      ],
    );
  }

  returnRowItems({required bool isSelected, required String text}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: (isSelected) ? BorderRadius.circular(100) : null,
        color: (isSelected) ? Colors.white.withOpacity(0.2) : null,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget buildRecommended({required BuildContext context}) {
    //I was lazy to make models :p
    List<Color> colors = [const Color(0xffAE47CD), const Color(0xffF278B0)];
    List<String> heading = ["A stress-free life", "Early bird"];
    List<String> subtitle = [
      "Challenges with meditation and reading books",
      "Morning wakeup tasks"
    ];
    List<IconData> icons = [Icons.dark_mode_outlined, Icons.more_time];
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Recommended",
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 170,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 20),
                height: 170,
                width: 230,
                decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            heading[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            subtitle[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        icons[index],
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget buildRecents({required BuildContext context}) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Recents",
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GlassMorphism(
                blur: 10,
                color: Colors.black,
                opacity: 0.2,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Best Challenge",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Never Say Never",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            Text(
                              "Lorem Ipsum is simply"
                              "dummy text of the printing"
                              " and typesetting industry. "
                              "Lorem Ipsum has been the industry's "
                              "standard dummy text ever since the 1500s, "
                              "when an unknown printer took a galley of "
                              "type and scrambled it to make a type specimen "
                              "book. It has survived not only five centuries",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
