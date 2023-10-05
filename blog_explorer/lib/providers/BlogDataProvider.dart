import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/BlogModel.dart';
import '../controllers/BlogController.dart';

class BlogDataProvider extends ChangeNotifier {
  static late Box box;
  late Future<List<BlogModel>?>? BlogData = BlogController.fetchBlogs();
  void updatingBlogData() {
    BlogData = BlogController.fetchBlogs();
  }

  bool isImageShow = true;
  void updateImageStatus() {
    isImageShow = false;
  }
}
