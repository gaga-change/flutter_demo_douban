import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '豆瓣',
          style:
              TextStyle(color: Color(0xff00b600), fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          child: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: false,
            title: Text(
              '影院热映',
              style: TextStyle(color: Color.fromRGBO(73, 73, 73, 1)),
            ),
            backgroundColor: Colors.white,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      )),
    );
  }
}
