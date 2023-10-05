import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

// page imports start
import '../widgets/carasole.dart';
import '../controllers/BlogController.dart';
import '../models/BlogModel.dart';
import '../util/shimmer_loadings.dart';
import '../providers/BlogDataProvider.dart';


class BlogListPage extends StatelessWidget {
  BlogListPage({
    super.key,
  });

  var BlogState;
  var BlogStateUpdate;

  @override
  Widget build(BuildContext context) {
    BlogState = Provider.of<BlogDataProvider>(context);
    BlogStateUpdate = Provider.of<BlogDataProvider>(context, listen: true);
    final Shimmer = Shimmer_Loading();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          elevation: 0,
          // backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Blogs for you ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  child: FutureBuilder<List<BlogModel>>(
                      future: BlogState.BlogData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<BlogModel> blogs = snapshot.data!;

                          // print("${blogModel.}");
                          return Column(
                            children: [
                              carosoleSlider(blogs: blogs),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  itemCount: blogs.length,
                                  itemBuilder: (context, index) {
                                    BlogModel blog = blogs[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              height: size.height * 0.1,
                                              // color: Colors.red,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${blog.imageUrl}'),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 7,
                                            child: Container(
                                              height: size.height * 0.1,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    /*  BoxShadow(
                                                          color: Colors.grey,
                                                          spreadRadius: 2,
                                                          blurRadius: 5,
                                                          blurStyle: BlurStyle.outer,
                                                          offset: Offset(5, -5)) */
                                                  ]),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${blog.title}",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return Shimmer.myShimmer(context, size);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
