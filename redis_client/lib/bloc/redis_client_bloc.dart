import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redis_client/api/redis_api_repository.dart';
import 'package:redis_client/api/redis_string_api_repository.dart';
import 'package:redis_client/bloc/redis_client_event.dart';
import 'package:redis_client/bloc/redis_client_state.dart';
import 'package:redis_client/model/redis_api_responses.dart';
import 'package:redis_client/model/redis_string_api_responses.dart';

class RedisClientBloc extends Bloc<RedisClientEvent, RedisClientState> {
  final RedisApiRepository redisApiRepository;
  final RedisStringApiRepository redisStringApiRepository;

  RedisClientBloc(RedisClientState initialState, this.redisApiRepository,
      this.redisStringApiRepository)
      : super(initialState);

  @override
  Stream<RedisClientState> mapEventToState(RedisClientEvent event) async* {
    if (event is ConnectRedis) {
      ConnectRedisResponse response =
          await redisApiRepository.connectRedis(event.hostname, event.port);
      if (response.success) yield RedisConnected();
    }

    if (event is FetchRedisKeys) {
      GetRedisKeysResponse response =
          await redisApiRepository.getRedisKeys(event.pattern);
      yield RedisKeysFetched(response.keys);
    }

    if (event is GetRedisKeyType) {
      GetKeyTypeResponse response =
          await redisApiRepository.getRedisKeyType(event.key);
      yield RedisKeyTypeFetched(event.key, response.dataType);
    }

    if (event is GetRedisString) {
      GetStringValueResponse response =
          await redisStringApiRepository.get(event.key);
      yield RedisStringFetched(event.key, response.value);
    }

    if (event is UpdateRedisString) {
      redisStringApiRepository.set(event.key, event.value);
      yield RedisStringFetched(event.key, event.value);
    }
  }
}
