import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmer_Loading {
  Widget myShimmer(BuildContext context, Size size) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white54,
            child: Container(
              height: 300,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Show All",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white54,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                              ),
                              height: size.height * 0.1,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: size.height * 0.1,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
