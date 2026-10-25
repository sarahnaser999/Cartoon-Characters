import 'package:flutter/material.dart';
import 'package:omar_st_b/contants/colors.dart';
import 'package:omar_st_b/data/models/characters.dart';

class CharacterDateailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDateailsScreen({super.key, required this.character});
  //const CharacterDateailsScreen({super.key});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.mygery,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          style: TextStyle(
            color: MyColors.mywhite,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(character.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children:[
      TextSpan(
        text:title,
        style:TextStyle(
          color:MyColors.mywhite,
          fontWeight:FontWeight.bold,
          fontSize:18),),
           TextSpan(
        text:value,
        style:TextStyle(
          color:MyColors.mywhite,
          fontSize:16),),
              ],
            ),
    );
  }
  Widget buildDivider(double endIndent){
    return Divider(
      color:MyColors.myyellow,
      height:30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mygery,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo('status : ',character.status),
                    buildDivider(380),
                    characterInfo('species : ',character.species),
                    buildDivider(370),
                    characterInfo('gender : ',character.gender),
                    buildDivider(380),
                    characterInfo('url : ',character.url),
                    buildDivider(400),
                    characterInfo('created : ',character.created),
                    buildDivider(380),
                    characterInfo('episode : ',character.episode.join(' / ')),
                    buildDivider(360),
                    SizedBox(height: 20,)
                    ],
                ),
              ),
              SizedBox(height:600,)
            ]),
          ),
        ],
      ),
    );
  }
}
