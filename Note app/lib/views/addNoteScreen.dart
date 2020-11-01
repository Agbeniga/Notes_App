import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summaryapp/services/hiveDatabase.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  var formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  static List<String> courses = [
    'Philosophy of Science',
    'Operating System',
    'Software Evolution',
    'Christian Faith',
    'Life and Teaching of christ',
    'Fundamentals of software Engineering',
    'Philosophy of christian Education'
  ];
  String onselected = courses[1];
  TextEditingController courseController = new TextEditingController();
  TextEditingController noteTextController = new TextEditingController();
  HiveDatabase _hiveDb = HiveDatabase();

  @override
  void dispose() {
    super.dispose();
    courseController.dispose();
    noteTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Add Note"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Form(
        key: formkey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: TextFormField(
                  controller: courseController,
                  decoration: InputDecoration(
                    labelText: 'Course name',
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2.0)),
                  ),
                  // validator: (String value) {
                  //   if (value.isEmpty) {
                  //     return "Course name required";
                  //   }
                  // },
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              DropdownButton<String>(
                items: courses.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: onselected,
                onChanged: (String newvalue) {
                  setState(() {
                    courseController.text = newvalue;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Flexible(
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepPurple, width: 2.0)),
                    ),
                    keyboardType: TextInputType.multiline,
                    controller: noteTextController,
                    minLines: 5,
                    autocorrect: true,
                    maxLines: null,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Summary required";
                    //   }
                    // },
                    onChanged: (value) {},
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Add", style: TextStyle(fontSize: 19.0)),
                      textColor: Colors.white,
                      color: Colors.deepPurple,
                      elevation: 5.0,
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 20.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        // setState(() {
                        if (formkey.currentState.validate()) {
                          try {
                            _hiveDb.addNote(
                              {
                                'content': noteTextController.text,
                                'course': courseController.text,
                              },
                            );
                            final snkbar = new SnackBar(
                              content: Text("Note Added"),
                            );
                            scaffold.currentState.showSnackBar(snkbar);
                            Future.delayed(Duration(seconds: 3), () {
                              Navigator.of(context).pop();
                            });
                          } catch (exception) {
                            final snkbar = new SnackBar(
                              content: Text(exception.toString()),
                            );
                            scaffold.currentState.showSnackBar(snkbar);
                          }
                        }
                        // });
                      },
                    ),
                    SizedBox(width: 20.0),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: 35.0, vertical: 20.0),
                      onPressed: () async{
                        var data = await _hiveDb.getNotes();
            print(data);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 19.0),
                      ),
                      textColor: Colors.deepPurple,
                      color: Colors.white,
                      elevation: 5.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog(String status, String message) {
    AlertDialog alertDialog =
        AlertDialog(title: Text(status), content: Text(message));
    showDialog(context: context, builder: (_) => alertDialog);
  }

  Map data() {
    return {
      'content': noteTextController.text,
      'course': courseController.text,
    };
  }
}
