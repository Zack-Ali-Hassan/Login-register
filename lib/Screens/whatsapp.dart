import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [Text("Drawer Header")],
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: 108,
                decoration: BoxDecoration(
                  color: Colors.green.shade500,
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "WhatsApp",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_vert,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: TabBar(
                        labelColor: Colors.white,
                        tabs: [
                          Tab(
                            icon: Icon(Icons.group),
                          ),
                          Tab(
                            child: Row(
                              children: [
                                Text("Chats"),
                                SizedBox(
                                  width: 7,
                                ),
                                CircleAvatar(
                                  radius: 11,
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            text: "Status",
                          ),
                          Tab(
                            text: "Calls",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.score),
            label: "Scores",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam_outlined),
            label: "Watch",
          ),
        ],
      ),
    );
  }
}
