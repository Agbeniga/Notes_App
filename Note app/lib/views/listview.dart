import 'package:flutter/material.dart';
import 'package:summaryapp/views/addNoteScreen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Listvview extends StatefulWidget {
  @override
  _ListvviewState createState() => _ListvviewState();
}

class _ListvviewState extends State<Listvview> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              moveToLastScreen();
            },
          ),
          title: Text("List View"),
          elevation: 0.0,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AddNote(),
              ),
            );
          },
          tooltip: 'Add Summary',
        ),
        body: Container(
          child: Center(child: getListView()),
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }

  ListView getListView() {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int position) {
        return
        //  Slidable(
        //           child:
                   Card(
            elevation: 1.0,
            color: Colors.white,
            child: ListTile(
              title: Text(
                'CourseTitle',
                style: TextStyle(color: Colors.deepPurple),
              ),
              subtitle: Text(
                'summary summarysummarysummarysummarysummary  summarysummary summary summarysummary summarysummary summary summarysummarysummary summary summarysummarysummarysummarysummary  summarysummary summary summarysummary summarysummary summary summarysummarysummary',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: GestureDetector(
                child: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
                onTap: () {},
              ),
              onTap: () {},
            ),
          // ),
        );
      },
    );
  }
}
