import 'package:flutter/material.dart';
import 'package:latihan_responsi/api_data_source.dart';
import 'package:latihan_responsi/model/list_character.dart';

class ListCharacter extends StatelessWidget {
  const ListCharacter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Character"),
      ),

      body: _buildListCharacterBody(),
    );
  }

Widget _buildListCharacterBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadCharacters(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasError){
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            // bentuk json diubah ke bentuk variabel
            Character characters = Character.fromJson(snapshot.data);
            return _buildSuccessSection(characters);
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


  Widget _buildSuccessSection(Character data){
    return ListView.builder(
      itemCount: data.skillTalents?.length,  // ! >> dipastikan datanya ada, ? >> datanya bisa jadi tidak ada
      itemBuilder: (BuildContext context, int index) {
        return _buildItemCharacter(data.skillTalents![index]);
      },
    );
  }

  Widget _buildItemCharacter(SkillTalents characterSkillTalents){
    return InkWell(
      //onTap: () => PageDetailCharacter(id: userData.id!),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(characterSkillTalents.name! + " " + characterSkillTalents.unlock!),
                Text(characterSkillTalents.description!),
                Text(characterSkillTalents.type!),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

