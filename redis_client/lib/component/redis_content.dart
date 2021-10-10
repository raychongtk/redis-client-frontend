import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redis_client/bloc/redis_client_bloc.dart';
import 'package:redis_client/bloc/redis_client_state.dart';
import 'package:redis_client/component/redis_string_container.dart';

class RedisContent extends StatefulWidget {
  const RedisContent({Key? key}) : super(key: key);

  @override
  _RedisContentState createState() => _RedisContentState();
}

class _RedisContentState extends State<RedisContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RedisClientBloc, RedisClientState>(
        builder: (context, state) {
      if (state is RedisStringFetched) {
        return RedisStringContainer(
          redisKey: state.key,
          redisValue: state.value,
        );
      }

      return Container();
    });
  }
}
