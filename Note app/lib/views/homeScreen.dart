import 'package:flutter/material.dart';
import 'package:summaryapp/views/addNoteScreen.dart';
import 'package:summaryapp/views/flashCard.dart';
import 'package:summaryapp/views/listview.dart';
import 'package:summaryapp/widget/customDrawer.dart';
import 'package:summaryapp/services/hiveDatabase.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HiveDatabase _hiveDb = HiveDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: new Text("Course Name"),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Listvview(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
          elevation: 0.0,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async{
            // var data = await _hiveDb.getNotes();
            // print(data);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AddNote(),
              ),
            );
          },
        ),
        drawer: CustomDrawer(),
        // bottomNavigationBar: new TabBar(
        //   controller: controller,
        //   tabs: <Widget>[
        //     new Tab(icon: Icon(Icons.slideshow, color: Colors.deepPurple)),
        //     new Tab(icon: Icon(Icons.list, color: Colors.deepPurple)),
        //     new Tab(icon: Icon(Icons.favorite, color: Colors.deepPurple)),
        //   ],
        //   // ),
        // ),
        body: SlideView()
        // TabBarView(
        //   // controller: controller,
        //   children: <Widget>[
        //     new slideview.SlideView(),
        //     new listvview.Listvview(),
        //     new favorite.Favorite()
        //   ],
        // ),
        );
  }
}
