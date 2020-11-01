import 'package:flutter/material.dart';
import 'package:summaryapp/services/hiveDatabase.dart';
import 'package:summaryapp/views/homeScreen.dart';
import './views/listts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveDatabase _hiveDb = HiveDatabase();
  _hiveDb.initHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => new HomeScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Content course;
  List<String> courses = [
    'Philosophy of Science',
    'Operating System',
    'Software Evolution',
    'Christian Faith',
    'Life and Teaching of christ',
    'Fundamentals of software Engineering',
    'Philosophy of christian Education'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image(
              image: AssetImage("assets/icon/cav.png"),
            ),
          ),
        ),
        new SliverList(
          delegate: new SliverChildBuilderDelegate(
            (context, index) => new Card(
                child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed("/a"),
              child: Container(
                padding: EdgeInsets.all(28.0),
                child: Text(courses[index]),
              ),
            )),
            childCount: courses.length,
          ),
        ),
      ],
    ));
  }
}
