import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:layout/layout.dart';
import 'package:manga_reader/manga_list/manga_list.dart';

import 'mock_data.dart';

void main() {
  runApp(
    const Layout(
      child: MaterialApp(
        title: 'Navigation Basics',
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appStructure = <Widget>[
      CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('My manga'),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MangaList(mangaList: mangaRead(context)),
        ),
      ),
      CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Manga listing'),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MangaList(mangaList: mangaList),
        ),
      ),
      const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Manga listing'),
        ),
        child: Center(
          child: Text(
            'Settings',
          ),
        ),
      ),
    ];

    return MaterialApp(
      title: 'Manga reader demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.ten_k),
              label: 'My manga',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ten_k),
              label: 'Manga listing',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ten_k),
              label: 'Settings',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return appStructure[index];
            },
          );
        },
      ),
    );
  }
}
