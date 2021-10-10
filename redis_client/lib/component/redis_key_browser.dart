import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redis_client/bloc/redis_client_bloc.dart';
import 'package:redis_client/bloc/redis_client_event.dart';
import 'package:redis_client/bloc/redis_client_state.dart';

class RedisKeyBrowser extends StatefulWidget {
  const RedisKeyBrowser({Key? key}) : super(key: key);

  @override
  _RedisKeyBrowserState createState() => _RedisKeyBrowserState();
}

class _RedisKeyBrowserState extends State<RedisKeyBrowser> {
  List<String> keys = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<RedisClientBloc, RedisClientState>(
      listener: (context, state) {
        if (state is RedisConnected) {
          BlocProvider.of<RedisClientBloc>(context).add(FetchRedisKeys());
        }
        if (state is RedisKeysFetched) {
          setState(() {
            keys = state.keys;
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListView.builder(
            itemCount: keys.length,
            itemBuilder: (context, index) {
              return Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(keys[index]),
                    ),
                    onTap: () => debugPrint("${keys[index]}"),
                  ));
            },
          ),
        ),
      ),
    );
  }
}
