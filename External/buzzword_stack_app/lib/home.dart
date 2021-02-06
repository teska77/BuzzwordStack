import 'package:buzzword_stack_app/count_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController textController = new TextEditingController();

  Widget _buildBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                'Buzz\nword Stack',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                'Deploy all the things',
                style: Theme.of(context).textTheme.caption.copyWith(
                  fontSize: 36,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ]
        ),

        TextFormField(
          controller: textController,
          decoration: const InputDecoration(
            icon: const Icon(Icons.cloud),
            labelText: 'Server address'
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FlatButton(
            child: Text('Connect'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                print(textController.text);
                return CountView(address: textController.text);
              }));
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(context),
    );
  }
}