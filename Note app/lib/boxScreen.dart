import 'package:flutter/material.dart';
import './views/listview.dart' as listvview;
import './views/slideView.dart' as slideview;
class BoxScreen extends StatefulWidget {
  @override
  _BoxScreenState createState() => _BoxScreenState();
}

class _BoxScreenState extends State<BoxScreen>
    with SingleTickerProviderStateMixin {
  // TabController controller;
  // @override
  // void initState() {
  //   super.initState();
  //   controller = new TabController(vsync: this, length: 3);
  // }

  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

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
                        builder: (context) => listvview.Listvview()));
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
          elevation: 0.0,
        ),
        drawer: new Drawer(
            child: Container(
          color: Colors.white,
          child: ListView(children: <Widget>[
            Image(
              image: AssetImage("assets/icon/cav.png"),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: ListTile(
                onTap: () {},
                title: Text(
                  "Philosophy of Science",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: ListTile(
                onTap: () {},
                title: Text(
                  "Operating System",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: ListTile(
                onTap: () {},
                title: Text(
                  "Software Evolution",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: ListTile(
                onTap: () {},
                title: Text(
                  "Christian Faith",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: ListTile(
                onTap: () {},
                title: Text(
                  "Life and Teaching of christ",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: ListTile(
                onTap: () {},
                title: Text(
                  "Fundamentals of software Engineering",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: ListTile(
                onTap: () {},
                title: Text(
                  "Philosophy of christian Education",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ]),
        )),
        // bottomNavigationBar: new TabBar(
        //   controller: controller,
        //   tabs: <Widget>[
        //     new Tab(icon: Icon(Icons.slideshow, color: Colors.deepPurple)),
        //     new Tab(icon: Icon(Icons.list, color: Colors.deepPurple)),
        //     new Tab(icon: Icon(Icons.favorite, color: Colors.deepPurple)),
        //   ],
        //   // ),
        // ),
        body: slideview.SlideView()
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
