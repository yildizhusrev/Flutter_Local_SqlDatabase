import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/word.dart';

class WordDetail extends StatefulWidget {
  Word word;

  WordDetail(this.word);

  @override
  State<StatefulWidget> createState() => WordDetailState(word);
}

enum Choise{Delete,Update}

class WordDetailState extends State {
  Word word;
  WordDetailState(this.word);
  @override
  Widget build(BuildContext context) {
    final List<String> entries = [word.english, word.turkish, 'Örnek Cümle'];
    final  List<Color> colorCodes = [Colors.green, Colors.lime, Colors.lightBlue];
    return Scaffold(
        appBar: AppBar(
          title: Text("Kelime Detayları"),
          actions: <Widget>[
            PopupMenuButton<Choise>(
              onSelected: (Choise choise){
                AlertDialog alert = AlertDialog(
                  title: Text("Seçim"),
                  content: Text(choise.toString()),
                );
                showDialog(context: context,builder: (_)=>alert);
              },
              itemBuilder: (BuildContext context)=><PopupMenuEntry<Choise>>[
                PopupMenuItem<Choise>(
                  value: Choise.Delete,
                  child: Text("Delete Word"),
                ),
                 PopupMenuItem<Choise>(
                  value: Choise.Update,
                  child: Text("Update Word"),
                )

              ],
            )
          ],
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8.0),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: colorCodes[index],
              
              child: Center(child: Text('${entries[index]}')),              
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        )
        );
  }
}
