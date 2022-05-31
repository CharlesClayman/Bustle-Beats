import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:bustle_beats/models/track.dart';
import 'package:bustle_beats/screens/playing_song_screen.dart';
import 'package:bustle_beats/utils/colors.dart';
import 'package:bustle_beats/utils/photo_urls.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String? artistPhotoUrl;
  final String? artistName;
  const ProfileScreen({required this.artistName, required this.artistPhotoUrl});

  List<Track> tracks() {
    List<Track> tracks = [];
    tracks.add(const Track(
        title: "Insononia",
        artistName: "Valetudo Beats",
        price: r"$30",
        photoUrl: trap));
    tracks.add(const Track(
        title: "Cuban Vibes",
        artistName: "Valetudo Beats",
        price: r"$25",
        photoUrl: loFi));
    tracks.add(const Track(
        title: "For the Night",
        artistName: "Valetudo Beats",
        price: r"$35",
        photoUrl: gate));
    tracks.add(const Track(
        title: "Who Knows",
        artistName: "Valetudo Beats",
        price: r"$30",
        photoUrl: crowd));

    tracks.add(const Track(
        title: "Miss You",
        artistName: "Valetudo Beats",
        price: r"$40",
        photoUrl: chillWave));
    return tracks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(),
                    Expanded(child: Container()),
                    const Text("BeatMaker'Profile"),
                    Expanded(child: Container()),
                    IconButton(onPressed: () {}, icon: Icon(Icons.more)),
                  ],
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(artistPhotoUrl!),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(color: secondaryAppColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text("PRO SELLER")),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: Text(
                            artistName!,
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 3),
                            child: const Text("Canada")),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: Wrap(
                            alignment: WrapAlignment.spaceAround,
                            children: [
                              Column(
                                children: const [
                                  Text("54",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text("Tracks"),
                                ],
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Column(
                                children: const [
                                  Text("3",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text("Albums"),
                                ],
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Column(
                                children: const [
                                  Text("12K",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text("Subcribers"),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: secondaryAppColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Subscribe',
                          style: TextStyle(
                              color: mainAppColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            // color: secondaryAppColor,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Start a chat',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        const TabBar(indicatorColor: secondaryAppColor, tabs: [
                          Tab(child: Text('Tracks')),
                          Tab(child: Text('Albums')),
                          Tab(child: Text('Reviews')),
                          Tab(child: Text('Contacts')),
                        ]),
                        Expanded(
                          child: TabBarView(children: [
                            ListView.builder(
                                itemCount: tracks().length,
                                itemBuilder: ((context, index) {
                                  return ListTile(
                                    onTap: (() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PlayingSongScreen(
                                                    trackName:
                                                        tracks()[index].title!,
                                                    beatMakerName:
                                                        tracks()[index]
                                                            .artistName!,
                                                    trackPhotoUrl:
                                                        tracks()[index]
                                                            .photoUrl!,
                                                  )));
                                    }),
                                    leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            tracks()[index].photoUrl!)),
                                    title: Text(
                                      tracks()[index].title!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                        "${tracks()[index].artistName!}  ${tracks()[index].price}"),
                                    trailing: SizedBox(
                                      width: 100,
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                  Icons.add_shopping_cart)),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.more))
                                        ],
                                      ),
                                    ),
                                  );
                                })),
                            const Center(child: Text('2')),
                            const Center(child: Text('3')),
                            const Center(child: Text('4')),
                          ]),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BlurryContainer(
          color: Colors.black.withOpacity(0.8),
          blur: 1,
          height: 90,
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
