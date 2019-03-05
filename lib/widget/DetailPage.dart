import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.detail}) : super(key: key);
  final detail;
  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {

  Map<String, dynamic> _detail = {
    'title': ''
  };

  @override
  void initState() {
    super.initState();
    if (widget.detail != null) {
      this.setState((){
        this._detail = widget.detail;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_detail['title']),
      ),
      body: Container(
        child: Text('gaga'),
      ),
    );
  }
}
