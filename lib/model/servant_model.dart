import 'package:post_training_qualif/model/comment_model.dart';

class Servant {
  String name;
  String className;
  String gender;
  String description;
  String rarity;
  String type;
  String image;
  List<Comment> comments = [];

  Servant({
    required this.name,
    required this.className,
    required this.gender,
    required this.description,
    required this.rarity,
    required this.type,
    required this.image,
  });

  addComments(Comment comment) {
    comments.add(comment);
  }
}