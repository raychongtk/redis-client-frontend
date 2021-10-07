import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redis_client/api/redis_api_repository.dart';
import 'package:redis_client/bloc/redis_client_event.dart';
import 'package:redis_client/bloc/redis_client_state.dart';
import 'package:redis_client/model/redis_api_responses.dart';

class RedisClientBloc extends Bloc<RedisClientEvent, RedisClientState> {
  final RedisApiRepository redisApiRepository;

  RedisClientBloc(RedisClientState initialState, this.redisApiRepository)
      : super(initialState);

  @override
  Stream<RedisClientState> mapEventToState(RedisClientEvent event) async* {
    if (event is ConnectRedis) {
      ConnectRedisResponse response =
          await redisApiRepository.connectRedis(event.hostname, event.port);
      if (response.success) yield RedisConnected();
    }

    if (event is FetchRedisKeys) {
      GetRedisKeysResponse response = await redisApiRepository.getRedisKeys();
      yield RedisKeysFetched(response.keys);
    }
  }
}
