import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:provider/provider.dart';

// page imports start
import '../widgets/SlidableListle.dart';
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
        body: Container(
          child: FutureBuilder<List<BlogModel>>(
              future: BlogState.BlogData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<BlogModel> blogs = snapshot.data!;

                  // print("${blogModel.}");
                  return ListView.builder(
                    itemCount: blogs.length,
                    itemBuilder: (context, index) {
                      BlogModel blog = blogs[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: ListTile(
                          leading: snapshot.connectionState ==
                                  ConnectionState.waiting
                              ? Image(
                                  image: NetworkImage('${blog.imageUrl}'),
                                )
                              : CircularProgressIndicator(color: Colors.amber),

                          title: Text("${blog.title}"),
                          // subtitle: Text("${blog.title}"),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return Shimmer.myShimmer(context, size);
              }),
        ),
      ),
    );
  }
}
