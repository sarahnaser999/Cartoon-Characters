import 'package:flutter/material.dart';
import 'package:omar_st_b/contants/colors.dart';
import 'package:omar_st_b/contants/strings.dart';
import 'package:omar_st_b/data/models/characters.dart';

class CharactersItem extends StatelessWidget {
  final Character character;
  const CharactersItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.mywhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap:()=>Navigator.pushNamed(context, charactersDetailsScreen,arguments:character),
        child: GridTile(
          child: Hero(
            tag:character.id,
            child: Container(
              color: MyColors.mygery,
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: "assets/images/loading.gif",
                      image: character.image,
                      fit: BoxFit.cover,
                    )
                  : Image.asset("assets/images/placeholder.jpg"),
            ),
          ),
          footer:Container(
            width:double.infinity,
            padding:EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            color:Colors.black54,
            alignment:Alignment.bottomCenter,
            child:Text('${character.name}',style:TextStyle(
              height:1.3,
              fontSize: 16,
              color:MyColors.mywhite,
              fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign:TextAlign.center,
              ),
          ),
        ),
      ),
    );
  }
}
