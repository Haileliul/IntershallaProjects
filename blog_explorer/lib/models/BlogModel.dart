import 'package:hive/hive.dart';

part 'BlogModel.g.dart'; // Generated file name

@HiveType(typeId: 0) // Unique typeId for the BlogModel class
class BlogModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? imageUrl;

  @HiveField(2)
  String? title;

  BlogModel({this.id, this.imageUrl, this.title});

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      imageUrl: json['image_url'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_url': imageUrl,
      'title': title,
    };
  }
}
