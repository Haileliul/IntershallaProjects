import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/BlogModel.dart';

class carosoleSlider extends StatelessWidget {
  const carosoleSlider({
    super.key,
    required this.blogs,
  });

  final List<BlogModel> blogs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 300.0,
            autoPlay: true,
            initialPage: 1,
            enableInfiniteScroll: true,
            // viewportFraction: 0.9,
            aspectRatio: 16 / 9,
            // pageSnapping: false,
            enlargeCenterPage: true,
          ),
          items: blogs.map((blog) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        image: DecorationImage(
                            image: NetworkImage('${blog.imageUrl}'),
                            fit: BoxFit.fitHeight),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('${blog.imageUrl}'),
                      ),
                      title: Text(
                        "${blog.title}",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
