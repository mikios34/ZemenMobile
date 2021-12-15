import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCard extends StatelessWidget {
  final pics = [
    "assets/images/pic1.jpg",
    "assets/images/pic2.jpg",
    "assets/images/pic3.jpg",
    "assets/images/pic4.jpg",
    "assets/images/pic5.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5)),

                    height: 107,
                    width: 90,
                    // decoration: BoxDecoration(boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.shade300,
                    //     blurRadius: 7,
                    //   )
                    // ]),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //alignment: Alignment.bottomCenter,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 12,
                    width: 87,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(3)),
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
