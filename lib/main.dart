
import 'package:favoritesong_app/musics/favorites.dart';
import 'package:favoritesong_app/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context)=>Music_oprations(),
      child:MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Songs()),
  ));
}

class Songs extends StatefulWidget {
  const Songs({Key? key}) : super(key: key);
  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
  List txt=["Deachwitha","Position","Vengeance","We don't talk anymore","Shangchi ","Mybag"];
  List img=["songss/suga.jpeg",
    "songss/ariana.png",
    "songss/bibi.jpeg",
    "songss/charlie.jpeg",
    "songss/shangchi.jpeg",
  "songss/mybag.jpeg"];
  @override
  Widget build(BuildContext context) {
    final favormark=Provider.of<Music_oprations>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        toolbarHeight: 70,
        title: Text("MUSIC",style:
        TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color:Colors.white,
          fontFamily:"Julee"
        ),),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: txt.length,
              itemBuilder:(context,index){
                return
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(img[index]),
                        ),
                        title: Text(txt[index],style: TextStyle(
                          fontFamily: "Julee",
                        ),),
                        trailing: IconButton(onPressed: (){
                          favormark.pictureMusic(img[index]);
                          favormark.nameMusic(txt[index]);

                        }, icon: favormark.colorChange(img[index])?
                        Icon(Icons.favorite_outline_rounded,color: Colors.red,):
                            Icon(Icons.favorite_outline_rounded),

                        ),
                      ),
                    );
              } ),
           FloatingActionButton.extended(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
          },backgroundColor:Colors.black54 , label: Text("Favorites",style: TextStyle(),))

        ],
      ),

    );
  }
}
