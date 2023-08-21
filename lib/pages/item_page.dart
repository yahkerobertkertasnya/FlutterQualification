import 'package:flutter/material.dart';
import 'package:post_training_qualif/model/servant_container_model.dart';
import 'package:post_training_qualif/model/servant_model.dart';
import 'package:post_training_qualif/pages/detail_page.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
  String username;
  ItemPage({super.key, required this.username});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {

  late List<Servant> servantList;

  @override
  void initState() {
    servantList = Provider.of<ServantContainer>(context, listen: false).getAllServant();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Center(
            child: Text("Hero List",
              style: TextStyle(
                fontSize: 20,
              )
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: servantList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return DetailPage(servant: servantList[index], username: widget.username);
                        })
                      );
                    },
                    leading: Image.network(servantList[index].image),
                    title: Text(servantList[index].name),
                    subtitle: Text(servantList[index].className),
                    trailing: Text(servantList[index].rarity),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}