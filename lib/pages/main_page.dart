import 'package:flutter/material.dart';
import 'package:post_training_qualif/model/theme_model.dart';
import 'package:post_training_qualif/pages/home_page.dart';
import 'package:post_training_qualif/pages/item_page.dart';
import 'package:post_training_qualif/pages/login_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  String username;
  MainPage({super.key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  late List<Widget> pageList;


  @override
  void initState() {
    pageList = [HomePage(), ItemPage(username: widget.username)];
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    setState(() {
                      Provider.of<ThemeView>(context, listen: false)
                          .changeTheme(ThemeData.light());
                    });
                  },
                  value: "light",
                  child: Text("Light"),
                ),
                PopupMenuItem(
                  onTap: () {
                    setState(() {
                      Provider.of<ThemeView>(context, listen: false)
                          .changeTheme(ThemeData.dark());
                    });
                  },
                  value: "dark",
                  child: Text("Dark"),
                ),
              ];
            },
          )
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              "Welcome ${widget.username}!",
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }), (route) => false);
            },
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            tooltip: 'Home',
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            tooltip: 'List',
            label: "Items",
          ),
        ],
      ),
      body: pageList[currentPage],
    );
  }
}
