import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmer_Loading {
  Widget myShimmer(BuildContext context, Size size) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white54,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: size.height * 0.1,
                        color: Colors.white,
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
    );
  }
}
