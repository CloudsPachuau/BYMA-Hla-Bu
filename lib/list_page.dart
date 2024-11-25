// pages/list_page.dart
import 'package:flutter/material.dart';
import 'reusable_list_page.dart';
import 'list_item.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ListItem> items = [
      ListItem(
        number: 1,
        title: 'Ram Ni Tla Ngai lovah Chuan',
        imagePath: 'assets/1/1.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 2,
        title: 'Ram Hla Takah Chuanin',
        imagePath: 'assets/1/2.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 3,
        title: 'Mittui A Hul Ang',
        imagePath: 'assets/1/3.jpg',
        soundPath: 'sounds/Ab.mp3',
        note: 'A♭',
      ),
      ListItem(
        number: 4,
        title: 'He Nun Hi Ni Khat Angin',
        imagePath: 'assets/1/4.jpg',
        soundPath: 'sounds/A.mp3',
        note: 'A',
      ),
      ListItem(
        number: 5,
        title: 'Jordan Lui Malin Ka Kai Lovang',
        imagePath: 'assets/1/5.jpg',
        soundPath: 'sounds/C.mp3',
        note: 'C',
      ),
      ListItem(
        number: 6,
        title: 'Lungngaih Ni Leh Lawm Lai Niah',
        imagePath: 'assets/1/6.jpg',
        soundPath: 'sounds/Db.mp3',
        note: 'D♭',
      ),
      ListItem(
        number: 7,
        title: 'An Leng Za Tawh Ang',
        imagePath: 'assets/1/7.jpg',
        soundPath: 'sounds/Eb.mp3',
        note: 'E♭',
      ),
      ListItem(
        number: 8,
        title: 'Nakinah Kan Par Ve Ang',
        imagePath: 'assets/1/8.jpg',
        soundPath: 'sounds/Eb.mp3',
        note: 'E♭',
      ),
      ListItem(
        number: 9,
        title: 'Vanah Lawmman Ka Tan A Awm',
        imagePath: 'assets/1/9.jpg',
        soundPath: 'sounds/Eb.mp3',
        note: 'E♭',
      ),
      ListItem(
        number: 10,
        title: 'Hringnun Khawvel',
        imagePath: 'assets/1/10.jpg',
        soundPath: 'sounds/E.mp3',
        note: 'E',
      ),
      ListItem(
        number: 11,
        title: 'Inkhawmpui Tiak Tawh Ngai lo Hmunah',
        imagePath: 'assets/1/11.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 12,
        title: 'Vanram Ropuiah',
        imagePath: 'assets/1/12.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 13,
        title: 'Nakinah Khua Var Hunah Chuan',
        imagePath: 'assets/1/13.jpg',
        soundPath: 'sounds/F.mp3',
        note: 'F',
      ),
      ListItem(
        number: 14,
        title: 'Beramno Isua',
        imagePath: 'assets/1/14.jpg',
        soundPath: 'sounds/C.mp3',
        note: 'C',
      ),
      ListItem(
        number: 15,
        title: 'Chatuan Ram Eng Mawi',
        imagePath: 'assets/1/15.jpg',
        soundPath: 'sounds/A.mp3',
        note: 'A',
      ),
      ListItem(
        number: 16,
        title: 'Hringnun Par Vul Lai',
        imagePath: 'assets/1/16.jpg',
        soundPath: 'sounds/A.mp3',
        note: 'A',
      ),
      ListItem(
        number: 17,
        title: 'Kan Khawvel Ni A Kin Hunah',
        imagePath: 'assets/1/17.jpg',
        soundPath: 'sounds/A.mp3',
        note: 'A',
      ),
      ListItem(
        number: 18,
        title: "Damlai Khawvel Hi Rei Lotea'n",
        imagePath: 'assets/1/18.jpg',
        soundPath: 'sounds/C.mp3',
        note: 'C',
      ),
      ListItem(
        number: 19,
        title: 'He Lei Ram Mi Kan Ni Lo',
        imagePath: 'assets/1/19.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 20,
        title: 'Ni Tlakna Piahah',
        imagePath: 'assets/1/20.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 21,
        title: 'Par Tin Vulna',
        imagePath: 'assets/1/21.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 22,
        title: 'Tlâng Thawveng',
        imagePath: 'assets/1/22.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 23,
        title: 'Par Mawi Khawvel',
        imagePath: 'assets/1/23.jpg',
        soundPath: 'sounds/Eb.mp3',
        note: 'E♭',
      ),
      ListItem(
        number: 24,
        title: 'Vanram',
        imagePath: 'assets/1/24.jpg',
        soundPath: 'sounds/F.mp3',
        note: 'F',
      ),
      ListItem(
        number: 25,
        title: 'Aw I Bei Zel Ang Thim Lal Chu',
        imagePath: 'assets/1/25.jpg',
        soundPath: 'sounds/F.mp3',
        note: 'F',
      ),
      ListItem(
        number: 26,
        title: 'Khawpui Mawi',
        imagePath: 'assets/1/26.jpg',
        soundPath: 'sounds/F.mp3',
        note: 'F',
      ),
      ListItem(
        number: 27,
        title: 'Vân Hmun Ropui',
        imagePath: 'assets/1/27.jpg',
        soundPath: 'sounds/F.mp3',
        note: 'F',
      ),
      ListItem(
        number: 28,
        title: 'Lei Piah Lam Ram',
        imagePath: 'assets/1/28.jpg',
        soundPath: 'sounds/Gb.mp3',
        note: 'G♭',
      ),
      ListItem(
        number: 29,
        title: 'Hmana Kan Nun Hlui',
        imagePath: 'assets/1/29.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 30,
        title: 'Lalnunnema',
        imagePath: 'assets/1/30.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 31,
        title: 'Chhandamtu Hmangaihna Leh Chhanhimnain',
        imagePath: 'assets/1/31.jpg',
        soundPath: 'sounds/Ab.mp3',
        note: 'A♭',
      ),
      ListItem(
        number: 32,
        title: 'Dam Lâi Thlipui A Ral Hunin',
        imagePath: 'assets/1/32.jpg',
        soundPath: 'sounds/A.mp3',
        note: 'A',
      ),
      ListItem(
        number: 33,
        title: 'Vawiin Chuan Ram Nuam Tak',
        imagePath: 'assets/1/33.jpg',
        soundPath: 'sounds/A.mp3',
        note: 'A',
      ),
      ListItem(
        number: 34,
        title: 'En Teh, Van Khawpui Tuallai',
        imagePath: 'assets/1/34.jpg',
        soundPath: 'sounds/C.mp3',
        note: 'C',
      ),
      ListItem(
        number: 35,
        title: 'Lei Hringnun',
        imagePath: 'assets/1/35.jpg',
        soundPath: 'sounds/C.mp3',
        note: 'C',
      ),
      ListItem(
        number: 36,
        title: 'Khita Vân Hmun Nuamah Khian',
        imagePath: 'assets/1/36.jpg',
        soundPath: 'sounds/C.mp3',
        note: 'C',
      ),
      ListItem(
        number: 37,
        title: 'Hla Taka Khaw Dur Leh Ruahpui Sur',
        imagePath: 'assets/1/37.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 38,
        title: 'Famkim Lohna Khawvel',
        imagePath: 'assets/1/38.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 39,
        title: 'Inkhawmpui Ṭiak Tawh Ngai Lo',
        imagePath: 'assets/1/39.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 40,
        title: 'Inkhawmpui Ṭiak Tawh Ngai Lohna',
        imagePath: 'assets/1/40.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 41,
        title: 'Kan Taksa Lei In Vaivuta Siam Hi',
        imagePath: 'assets/1/41.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 42,
        title: 'Khawvel hrehawm I Tan',
        imagePath: 'assets/1/42.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 43,
        title: 'Thlarau Chawlhna',
        imagePath: 'assets/1/43.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 44,
        title: 'Mi Thianghlimte Lenna',
        imagePath: 'assets/1/44.jpg',
        soundPath: 'sounds/Eb.mp3',
        note: 'E♭',
      ),
      ListItem(
        number: 45,
        title: 'Beram No Kan Fak Ang',
        imagePath: 'assets/1/45.jpg',
        soundPath: 'sounds/Eb.mp3',
        note: 'E♭',
      ),
      ListItem(
        number: 46,
        title: 'Hmelma Hnuhnung',
        imagePath: 'assets/1/46.jpg',
        soundPath: 'sounds/Eb.mp3',
        note: 'E♭',
      ),
      ListItem(
        number: 47,
        title: 'Van Khua',
        imagePath: 'assets/1/47.jpg',
        soundPath: 'sounds/Eb.mp3',
        note: 'E♭',
      ),
      ListItem(
        number: 48,
        title: 'Tawpna Ni',
        imagePath: 'assets/1/48.jpg',
        soundPath: 'sounds/Eb.mp3',
        note: 'E♭',
      ),
      ListItem(
        number: 49,
        title: "Angelte'n An Awmpui",
        imagePath: 'assets/1/49.jpg',
        soundPath: 'sounds/E.mp3',
        note: 'E',
      ),
      ListItem(
        number: 50,
        title: "Kan beisei Ram",
        imagePath: 'assets/1/50.jpg',
        soundPath: 'sounds/E.mp3',
        note: 'E',
      ),
      ListItem(
        number: 51,
        title: "Khawpui Mawi",
        imagePath: 'assets/1/51.jpg',
        soundPath: 'sounds/E.mp3',
        note: 'E',
      ),
      ListItem(
        number: 52,
        title: "Khualzinna Ram",
        imagePath: 'assets/1/52.jpg',
        soundPath: 'sounds/E.mp3',
        note: 'E',
      ),
      ListItem(
        number: 53,
        title: "Lungduhte Lenna",
        imagePath: 'assets/1/53.jpg',
        soundPath: 'sounds/E.mp3',
        note: 'E',
      ),
      ListItem(
        number: 54,
        title: "Damlai Nite Hi Kawlah An Her",
        imagePath: 'assets/1/54.jpg',
        soundPath: 'sounds/F.mp3',
        note: 'F',
      ),
      ListItem(
        number: 55,
        title: "Fak Leh Dil Hun Lawmawm",
        imagePath: 'assets/1/55.jpg',
        soundPath: 'sounds/F.mp3',
        note: 'F',
      ),
      ListItem(
        number: 56,
        title: "Ram Hlun Ka Sawi Nin Theih Loh",
        imagePath: 'assets/1/56.jpg',
        soundPath: 'sounds/F.mp3',
        note: 'F',
      ),
      ListItem(
        number: 57,
        title: "Lalṭhutthleng Kiangah",
        imagePath: 'assets/1/57.jpg',
        soundPath: 'sounds/F.mp3',
        note: 'F',
      ),
      ListItem(
        number: 58,
        title: "Pathian Hmel",
        imagePath: 'assets/1/58.jpg',
        soundPath: 'sounds/F.mp3',
        note: 'F',
      ),
      ListItem(
        number: 59,
        title: "Zaia Faktu An Haw Hun Chuan",
        imagePath: 'assets/1/59.jpg',
        soundPath: 'sounds/F.mp3',
        note: 'F',
      ),
      ListItem(
        number: 60,
        title: "A Hmangaihna Fakin I Zai Ang",
        imagePath: 'assets/1/60.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 61,
        title: "A Va Nuam Dawn Em",
        imagePath: 'assets/1/61.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 62,
        title: "In Ropui Tak Ka nei",
        imagePath: 'assets/1/62.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 63,
        title: "Zion Hla Mawi",
        imagePath: 'assets/1/63.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 64,
        title: "Nghakhlel Takin Ka Thlir",
        imagePath: 'assets/1/64.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 65,
        title: "Puan Var Sin",
        imagePath: 'assets/1/65.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 66,
        title: "Van In Nuam",
        imagePath: 'assets/1/66.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 67,
        title: "Isua Hmangaihna Leh Ṭhatna",
        imagePath: 'assets/1/67.jpg',
        soundPath: 'sounds/Bb.mp3',
        note: 'B♭',
      ),
      ListItem(
        number: 68,
        title: "Vân Nuamah Chuan Tute Nge Chêng",
        imagePath: 'assets/1/68.jpg',
        soundPath: 'sounds/Db.mp3',
        note: 'D♭',
      ),
      ListItem(
        number: 69,
        title: "Hringmi Hun Hi Tui Luang Angin",
        imagePath: 'assets/1/69.jpg',
        soundPath: 'sounds/F.mp3',
        note: 'F',
      ),
      ListItem(
        number: 70,
        title: "Jordan Lui Kamah Ka Ding A",
        imagePath: 'assets/1/70.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 71,
        title: "Lalpa Tawtawrawt A Rik Hunin",
        imagePath: 'assets/1/71.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 72,
        title: "Vana Ka Kumkhaw In Chu",
        imagePath: 'assets/1/72.jpg',
        soundPath: 'sounds/C.mp3',
        note: 'C',
      ),
      ListItem(
        number: 73,
        title: "Isuan Ro A Rel E",
        imagePath: 'assets/1/73.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 74,
        title: "Jerusalem Tharah",
        imagePath: 'assets/1/74.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 75,
        title: "Khawvel Hi Bo Mahse",
        imagePath: 'assets/1/75.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 76,
        title: "Ka Dawn Ṭhin Ropuina Ram",
        imagePath: 'assets/1/76.jpg',
        soundPath: 'sounds/Eb.mp3',
        note: 'E♭',
      ),
      ListItem(
        number: 77,
        title: "Chhandamtu Min Hmangaihna Chu",
        imagePath: 'assets/1/77.jpg',
        soundPath: 'sounds/E.mp3',
        note: 'E',
      ),
      ListItem(
        number: 78,
        title: "Emau Dai Reh",
        imagePath: 'assets/1/78.jpg',
        soundPath: 'sounds/E.mp3',
        note: 'E',
      ),
      ListItem(
        number: 79,
        title: "Khawvel Hrehawmna",
        imagePath: 'assets/1/79.jpg',
        soundPath: 'sounds/D_2.mp3',
        note: 'D',
      ),
      ListItem(
        number: 80,
        title: "Ni Tla Ngai Lo Zion Khawpui",
        imagePath: 'assets/1/80.jpg',
        soundPath: 'sounds/E.mp3',
        note: 'E',
      ),
      ListItem(
        number: 81,
        title: "Ṭhenna Ram",
        imagePath: 'assets/1/81.jpg',
        soundPath: 'sounds/E.mp3',
        note: 'E',
      ),
      ListItem(
        number: 82,
        title: "Dam Chhûngin Kan Tlantu Zârah",
        imagePath: 'assets/1/82.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 83,
        title: "Ka Hmaah Lui Râl Khaw Mawi",
        imagePath: 'assets/1/83.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 84,
        title: "Sual Thimah Hian Kan Vakvai",
        imagePath: 'assets/1/84.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 85,
        title: "Vânram Ngaihtuah Hian",
        imagePath: 'assets/1/85.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
      ListItem(
        number: 86,
        title: "I Lamah Min Hîp Rawh",
        imagePath: 'assets/1/86.jpg',
        soundPath: 'sounds/G.mp3',
        note: 'G',
      ),
    ];

    return ReusableListPage(title: 'Page 1', items: items);
  }
}
