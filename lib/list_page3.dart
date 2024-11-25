// pages/list_page3.dart
import 'package:flutter/material.dart';
import 'reusable_list_page.dart';
import 'list_item.dart';

class ListPage3 extends StatelessWidget {
  const ListPage3({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ListItem> items = [
      ListItem(
        number: 171,
        title: 'Mizoram Tan',
        imagePath: 'assets/3/171.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 172,
        title: 'An Lunglêng Ve Ngei Ang',
        imagePath: 'assets/3/172.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 173,
        title: 'Rualtin khumtu Y.M.A',
        imagePath: 'assets/3/173.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 174,
        title: 'Lenrual An Kim Ta Lo',
        imagePath: 'assets/3/174.jpg',
        soundPath: 'sounds/F.mp3',
        note: 'F',
      ),
      ListItem(
        number: 175,
        title: 'Kan Zotlang Ram Nuam',
        imagePath: 'assets/3/175.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 176,
        title: 'Lei Mawina, Thinlai Tihlimtu',
        imagePath: 'assets/3/176.jpg',
        soundPath: 'sounds/Eb.mp3',
        note: 'E♭',
      ),
      ListItem(
        number: 177,
        title: 'Sem Sem Dam Dam',
        imagePath: 'assets/3/177.jpg',
        soundPath: 'sounds/E.mp3',
        note: 'E',
      ),
      ListItem(
        number: 178,
        title: 'E Khai! Hlim Rawh U',
        imagePath: 'assets/3/178.jpg',
        soundPath: 'sounds/Ab.mp3',
        note: 'A♭',
      ),
      ListItem(
        number: 179,
        title: 'Kan Pianna Zoram Nuam',
        imagePath: 'assets/3/179.jpg',
        soundPath: 'sounds/A.mp3',
        note: 'A',
      ),
      ListItem(
        number: 180,
        title: 'RÛNMAWI',
        imagePath: 'assets/3/180.jpg',
        soundPath: 'sounds/E.mp3',
        note: 'E',
      ),
    ];

    return ReusableListPage(title: 'Page 3', items: items);
  }
}
