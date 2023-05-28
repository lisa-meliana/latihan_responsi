import 'package:flutter/material.dart';
import 'halaman_list_character.dart';
import 'halaman_list_weapon.dart';

class Home extends StatefulWidget {
  final int index;
  Home({Key? key, required this.index}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int index = widget.index;


  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'lib/images/halaman.jpg'),
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.softLight),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Image.network(
                   'lib/images/Genshin_Impact_logo.svg.png',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 240),

                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 7),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ElevatedButton(
                               style: ElevatedButton.styleFrom(),
                                 onPressed: () {
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => const ListCharacter()),
                                   );
                                 },
                                 child: const Text('Karakter'),
                              ),
                              SizedBox(height: 12),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ListWeapon()),
                                  );
                                },
                                child: const Text('Weapon'),
                              ),
                           ],
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(height: 30),

              ],
            ),
          ),
        ),
      ),

    );
  }
}


