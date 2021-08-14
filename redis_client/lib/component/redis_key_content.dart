import 'package:flutter/material.dart';

class RedisKeyContent extends StatefulWidget {
  const RedisKeyContent({Key? key}) : super(key: key);

  @override
  _RedisKeyContentState createState() => _RedisKeyContentState();
}

class _RedisKeyContentState extends State<RedisKeyContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("test"),
            )),
      ),
    );
  }
}