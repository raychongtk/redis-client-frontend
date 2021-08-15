import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redis_client/bloc/redis_client_event.dart';
import 'package:redis_client/bloc/redis_client_state.dart';

class RedisClientBloc extends Bloc<RedisClientEvent, RedisClientState> {
  RedisClientBloc(RedisClientState initialState) : super(initialState);

  @override
  Stream<RedisClientState> mapEventToState(RedisClientEvent event) async* {
    if (event is FetchRedisKeys) {
      // TODO fetch redis keys
    }
  }
}
