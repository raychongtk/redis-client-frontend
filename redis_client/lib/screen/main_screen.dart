import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redis_client/api/redis_api_provider.dart';
import 'package:redis_client/api/redis_api_repository.dart';
import 'package:redis_client/api/redis_string_api_provider.dart';
import 'package:redis_client/api/redis_string_api_repository.dart';
import 'package:redis_client/bloc/redis_client_bloc.dart';
import 'package:redis_client/bloc/redis_client_event.dart';
import 'package:redis_client/bloc/redis_client_state.dart';
import 'package:redis_client/component/redis_content_container.dart';
import 'package:redis_client/component/redis_key_browser.dart';
import 'package:redis_client/http/http_client.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RedisClientBloc>(
      create: (context) {
        var redisApiRepository =
            RedisApiRepository(RedisApiProvider(HttpClient()));
        var redisStringApiRepository =
            RedisStringApiRepository(RedisStringApiProvider(HttpClient()));
        return RedisClientBloc(
            Uninitialized(), redisApiRepository, redisStringApiRepository)
          ..add(ConnectRedis('localhost', '6379'));
      },
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: RedisKeyBrowser(),
          ),
          Expanded(
            flex: 7,
            child: RedisContentContainer(),
          ),
        ],
      ),
    );
  }
}
