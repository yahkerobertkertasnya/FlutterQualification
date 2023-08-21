import 'package:flutter/material.dart';
import 'package:post_training_qualif/model/comment_model.dart';
import 'package:post_training_qualif/model/servant_container_model.dart';
import 'package:post_training_qualif/model/servant_model.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  String username;
  Servant servant;
  DetailPage({super.key, required this.servant, required this.username});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late List<Comment> commentList;
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    commentList = widget.servant.comments;
    super.initState();
  }

  void handleComment() {
    String comment = commentController.text;

    if (comment.isEmpty) {
      SnackBar snackBar = const SnackBar(
        content: Text("Comment cannot be empty"),
        duration: Duration(seconds: 2),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    commentController.clear();
    Comment newComment = Comment(name: widget.username, content: comment);
    setState(() {
      commentList.add(newComment);
      Provider.of<ServantContainer>(context, listen: false)
          .updateComment(widget.servant, commentList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.servant.name),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.person),
              ),
              Tab(
                icon: Icon(Icons.comment),
              ),
            ],
          ),
        ),
        body: TabBarView(
          viewportFraction: 1,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.network(widget.servant.image),
                Text(widget.servant.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "${widget.servant.className} - ${widget.servant.gender} - ${widget.servant.rarity} - ${widget.servant.type}"),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(widget.servant.description),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: commentController,
                        decoration: const InputDecoration(
                          hintText: "Add Comment",
                          labelText: "Add Comment",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          handleComment();
                        },
                        child: const Text("Comment")),
                  ],
                )
              ],
            ),
            Column(
              children: [
                const Center(
                  child: Text("Comments",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: commentList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(commentList[index].name),
                          subtitle: Text(commentList[index].content),
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
