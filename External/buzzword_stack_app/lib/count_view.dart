import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CountView extends StatefulWidget {
  CountView({@required this.address, Key key}) : super(key: key);
  final String address;
  @override
  _CountViewState createState() => _CountViewState();
}

class _CountViewState extends State<CountView> {

  Widget _buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildMain(BuildContext context, http.Response response) {
    var count;
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      count = jsonResponse['count'].toString();
    }
    return Center(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              (count != null) ? count : '(unknown)',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'requests made',
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
    );
  }



  Widget _futureBuilder(BuildContext context) {
    return FutureBuilder(
      future: http.post('http://${widget.address}/api/count'),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _buildMain(context, snapshot.data);
        } else {
          return _buildLoadingScreen(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _futureBuilder(context),
    );
  }

  @override
  void initState() {
    print('Initializing');
    // countValue = _getCount();
    super.initState();
  }
}