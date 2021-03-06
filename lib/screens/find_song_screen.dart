import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:bustle_beats/models/commercial.dart';
import 'package:bustle_beats/screens/artist_profile_screen.dart';
import 'package:bustle_beats/utils/colors.dart';
import 'package:bustle_beats/utils/photo_urls.dart';
import 'package:flutter/material.dart';

class FindSongScreen extends StatelessWidget {
  List<Commercial> commercials() {
    List<Commercial> list = [];
    list.add(const Commercial(name: "Cloud Pop", photoUrl: cloudPopImageUrl));
    list.add(const Commercial(name: "Trap", photoUrl: trap));
    list.add(const Commercial(name: "lo-Fi", photoUrl: loFi));
    list.add(const Commercial(name: "Chillwave", photoUrl: chillWave));
    list.add(const Commercial(name: "Gate", photoUrl: gate));
    list.add(const Commercial(name: "Crowd", photoUrl: crowd));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        //Appbar
        appBar: AppBar(
            backgroundColor: mainAppColor,
            leading: const Icon(
              Icons.music_note,
              color: secondaryAppColor,
            ),
            actions: [
              //Search button
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              //Shopping cart icon with badge
              IconButton(
                onPressed: () {},
                icon: Stack(children: <Widget>[
                  const Icon(Icons.shopping_cart),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Container(
                      alignment: Alignment.center,
                      width: 15,
                      height: 15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: secondaryAppColor,
                      ),
                      child: const Text(
                        '3',
                        style: TextStyle(color: mainAppColor),
                      ),
                    ),
                  )
                ]),
              )
            ]),
        body: //Body
            Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: mainAppColor,
            shape: BoxShape.rectangle,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Find the best music for your banger',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.transparent,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            child: const TabBar(
                                indicatorColor: secondaryAppColor,
                                tabs: [
                                  Tab(
                                    child: Text(
                                      'Commercial',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Free license',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )
                                ]),
                          ),
                          Expanded(
                            child: TabBarView(children: [
                              GridView.builder(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 40),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 1,
                                    crossAxisSpacing: 1,
                                    childAspectRatio: 1,
                                  ),
                                  itemCount: commercials().length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileScreen(
                                                    artistName:
                                                        commercials()[index]
                                                            .name,
                                                    artistPhotoUrl:
                                                        commercials()[index]
                                                            .photoUrl,
                                                  ))),
                                      child: Stack(
                                        children: [
                                          CircleAvatar(
                                            radius: 90,
                                            backgroundImage: NetworkImage(
                                                commercials()[index].photoUrl!),
                                          ),
                                          Positioned(
                                              left: 55,
                                              right: 25,
                                              top: 80,
                                              child: Text(
                                                commercials()[index].name!,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ))
                                        ],
                                      ),
                                    );
                                  }),
                              const Text('License'),
                            ]),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BlurryContainer(
          color: Colors.black.withOpacity(0.8),
          blur: 1,
          height: 120,
          width: double.infinity,
          borderRadius: const BorderRadius.all(Radius.circular(0)),
          child: SizedBox(
            height: 58,
            child: BottomNavigationBar(
              backgroundColor: Colors.black,
              selectedItemColor: secondaryAppColor,
              currentIndex: 1,
              onTap: (value) {},
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home_outlined),
                ),
                BottomNavigationBarItem(
                    label: 'Navigator',
                    icon: Icon(
                      Icons.navigation_outlined,
                    )),
                BottomNavigationBarItem(
                  label: 'Chats',
                  icon: Icon(Icons.chat_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(Icons.person_outline),
                ),
              ],
            ),
          ),
        ));
  }
}
