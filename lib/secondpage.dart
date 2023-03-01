import 'package:favoritesong_app/main.dart';
import 'package:favoritesong_app/musics/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    final favrsult=Provider.of<Music_oprations>(context);
    final List favmusic=favrsult.picture;
    final List favtxt=favrsult.name;
    return Scaffold(
      body: Column(
          children: [
          ListView.builder(
          shrinkWrap: true,
          itemCount: favtxt.length,
          itemBuilder:(context,index){
            return
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(favmusic[index]),
                  ),
                  title: Text(favtxt[index],style: TextStyle(
                    fontFamily: "Julee",
                  ),),
                  trailing: IconButton(onPressed: (){
                    favrsult.pictureMusic(favmusic[index]);
                    favrsult.nameMusic(favtxt[index]);


                  }, icon: favrsult.colorChange(favmusic[index])?
                  Icon(Icons.favorite ,color: Colors.red,):
                  Icon(Icons.favorite),

                  ),
                ),
              );
          } ),



      ],
    ),
    );
  }
}
