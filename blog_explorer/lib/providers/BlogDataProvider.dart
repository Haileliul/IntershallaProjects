import 'package:flutter/material.dart';
import '../models/BlogModel.dart';
import '../controllers/BlogController.dart';

class BlogDataProvider extends ChangeNotifier {
  Future<List<BlogModel>?>? BlogData = BlogController.fetchBlogs();
  void updatingBlogData() {
    BlogData = BlogController.fetchBlogs();
  }

  bool isImageShow = true;
  void updateImageStatus() {
    isImageShow = false;
  }
}
