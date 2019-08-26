import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sqldatabase/db/dbHelper.dart';
import 'package:flutter_sqldatabase/models/word.dart';
import 'package:flutter_sqldatabase/screens/wordAdd.dart';
import 'package:flutter_sqldatabase/screens/wordDetail.dart';

class WordList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WordListState();
}

class WordListState extends State {
  DbHelper dbHelper = DbHelper();
  List<Word> words;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    //ilk cagırma işlemi için;
    if (words == null) {
      words = List<Word>();
      getData();
    }

    return Scaffold(
      body: wordListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gotoAdd();
        },
        tooltip: "add new word",
        child: Icon(Icons.add),
      ),
    );
  }

  ListView wordListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.amberAccent,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text("A"),
            ),
            title: Text(this.words[position].turkish +
                "|" +
                this.words[position].english),
            onTap: () {
              gotoDetail(this.words[position]);
            },
          ),
        );
      },
    );
  }

  void getData() {
    var db = dbHelper.initializeDb();
    /*
    db.then((r){
      for (var i = 0; i < 5; i++) {
         Word w = Word("Araba"+i.toString(), "Car"+i.toString());
         dbHelper.insert(w);
      }
    });
    */
    db.then((result) {
      var wordFuture = dbHelper.getWord();
      wordFuture.then((data) {
        List<Word> wordData = List<Word>();
        count = data.length;
        for (var i = 0; i < count; i++) {
          wordData.add(Word.fromObject(data[i]));
        }
        setState(() {
          words = wordData;
          count = count;
        });
      });
    });
  }

  void gotoDetail(Word word) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => WordDetail(word)));
    if (result != null && result) {
      getData();
    }
  }

  void gotoAdd() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => WordAdd()));
    if (result != null && result) {
      getData();
    }
  }
}
