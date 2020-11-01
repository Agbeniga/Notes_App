import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView(
                  children: <Widget>[
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
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}