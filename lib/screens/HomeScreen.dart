// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haber/Variables/variables.dart';
import 'package:haber/screens/DetayScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Controller/Controller.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  habercek() async {
    var gelen = await http.get(
      Uri.parse(newsApi),
    );

    gelenhaberler = jsonDecode(gelen.body);
    haberler = gelenhaberler["articles"];
    setState(() {});
    print(haberler);
    print(gelenhaberler.runtimeType);
  }

  @override
  void initState() {
    habercek();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/skyloop.jpg',
                          ),
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      child: SizedBox(),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/images/skyloop.jpg',
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        width: 50,
                      ),
                      title: Text("OgimetiS"),
                      onTap: () async {
                        await launchUrl(
                          Uri.parse("https://github.com/oguzhan1097"),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Image.network(
          "https://picsum.photos/250?image=9",
          fit: BoxFit.cover,
          height: 50,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
          controller: mainController,
          itemBuilder: (context, index) {
            return haberler[index]["author"] != null &&
                    haberler[index]["urlToImage"] != null
                ? InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetayScreen(
                            veri1: haberler[index]["urlToImage"] ?? "",
                            veri2: haberler[index]["source"]["name"] ?? "",
                            veri3: haberler[index]["publishedAt"] ?? "",
                            veri4: haberler[index]["title"] ?? "",
                            veri5: haberler[index]["description"] ?? "",
                            veri6: haberler[index]["url"] ?? "",
                            veri7: haberler[index]["author"] ?? "",
                            veri8: haberler[index]["content"] ?? "",
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Center(
                            child: Image.network(haberler[index]["urlToImage"]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(haberler[index]["source"]["name"]),
                              Text(haberler[index]["publishedAt"])
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(haberler[index]["title"]),
                          SizedBox(
                            height: 10,
                          ),
                          Text(haberler[index]["description"]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [Text(haberler[index]["author"])],
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox();
          },
          separatorBuilder: (context, index) =>
              haberler[index]["author"] != null &&
                      haberler[index]["urlToImage"] != null
                  ? Divider()
                  : SizedBox(),
          itemCount: haberler.length),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          mainController.animateTo(
            0,
            duration: Duration(seconds: 1),
            curve: Curves.easeOut,
          );
        },
        child: Icon(
          Icons.expand_less,
          size: 30,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
