import 'package:flutter/material.dart';
import 'package:latihan_responsi/api_data_source.dart';
import 'package:latihan_responsi/model/list_character.dart';
import 'package:latihan_responsi/model/list_weapons.dart';

class ListWeapon extends StatelessWidget {
  const ListWeapon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Weapon"),
      ),

      body: _buildListCharacterBody(),
    );
  }

  Widget _buildListCharacterBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadWeapons(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasError){
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            // bentuk json diubah ke bentuk variabel
            Weapons weapons = Weapons.fromJson(snapshot.data);
            return _buildSuccessSection(weapons);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection(){
    return Text("Error");
  }

  Widget _buildLoadingSection(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }


  Widget _buildSuccessSection(Weapons data) {
    //String imageUrl = "${data.skillTalents![index]}";
    var text = SizedBox(
      //width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  // child: Image.network(
                  //  // imageUrl,
                  //  // width: 130.0,
                  //   fit: BoxFit.contain,
                  // ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${data.name!}",
                        style: const TextStyle(fontSize: 28.0)),
                    Text("${data.passiveName! }",
                        style: const TextStyle(fontSize: 28.0)),
                    Text("${data.type!}"),

                  ],
                ),

              )),
          // Expanded(child: Text(value2.toTitleCase(), style: const TextStyle(fontSize: 26.0))),
        ],
      ),
    );
    return text;
  }

}

