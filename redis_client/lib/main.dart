import 'package:flutter/material.dart';
import 'package:redis_client/screen/main_screen.dart';
import 'package:redis_client/theme/theme.dart';

void main() {
  runApp(RedisClientApp());
}

class RedisClientApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redis Client',
      theme: buildRedisClientTheme(Theme.of(context)),
      home: RedisClient(title: 'Redis Client'),
    );
  }
}

class RedisClient extends StatefulWidget {
  final String title;

  RedisClient({Key? key, required this.title}) : super(key: key);

  @override
  _RedisClientState createState() => _RedisClientState();
}

class _RedisClientState extends State<RedisClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          centerTitle: false,
          title: Text(widget.title),
        ),
        body: MainScreen());
  }
}
