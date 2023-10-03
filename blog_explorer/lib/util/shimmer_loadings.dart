import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmer_Loading {
  Widget myShimmer(BuildContext context, Size size) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white70,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey,
          child: Text("This part is the Shimmer"),
        ),
      ),
    );
  }
}
