import 'package:flutter/material.dart';
import 'package:movies_flutter/MoviesBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Popular Movies"),
        ),
        body: StreamBuilder(
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ),
    );
  }

  Widget buildList(AsyncSnapshot<String> snapshot) {
    return Text("${snapshot.data}");
  }
}
