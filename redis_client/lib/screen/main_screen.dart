import 'package:flutter/material.dart';
import 'package:redis_client/component/redis_key_browser.dart';
import 'package:redis_client/component/redis_key_content.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: RedisKeyBrowser(),
        ),
        Expanded(
          flex: 7,
          child: RedisKeyContent(),
        ),
      ],
    );
  }
}
