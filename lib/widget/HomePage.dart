import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List _data = [];

  _getList() async {
    var url =
        "https://movie.douban.com/j/search_subjects?type=movie&tag=%E7%83%AD%E9%97%A8&page_limit=50&page_start=0";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      this.setState(() {
        this._data = jsonResponse['subjects'];
      });
      print("Number of books about http: $jsonResponse.");
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  _getStars(String rateStr) {
    var rate =  double.parse(rateStr);
    List<Widget> starWidget = [];
    var  starts = (rate / 2).floor();
    for(var i = 0 ; i < 5; i ++) {
      var color;
      if (i < starts) {
        color = 0xffffb712;
      } else {
        color = 0xffe5e5e5;
      }
      starWidget.add(Expanded(
          child: Icon(Icons.star, color: Color(color)),
        ));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: starWidget,
    );
  }

  @override
  void initState() {
    super.initState();
    this._getList();
  }

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
              maxCrossAxisExtent: 125.0,
              // mainAxisSpacing: 10.0,
              // crossAxisSpacing: 10.0,
              childAspectRatio: .7,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var item = this._data[index];
                return Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Image.network(item['cover']),
                        ),
                      ),
                      Expanded(
                          child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Center(
                                child: Text(
                              item['title'],
                              style: TextStyle(fontSize: 12),
                            )),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: this._getStars(item['rate'])
                                ),
                                Expanded(
                                  child: Text(item['rate']),
                                )
                              ],
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                );
              },
              childCount: this._data.length,
            ),
          ),
        ],
      )),
    );
  }
}
