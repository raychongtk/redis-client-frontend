import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redis_client/bloc/redis_client_bloc.dart';
import 'package:redis_client/bloc/redis_client_event.dart';
import 'package:redis_client/bloc/redis_client_state.dart';
import 'package:redis_client/common/redis_key_type.dart';

class RedisKeyBrowser extends StatefulWidget {
  const RedisKeyBrowser({Key? key}) : super(key: key);

  @override
  _RedisKeyBrowserState createState() => _RedisKeyBrowserState();
}

class _RedisKeyBrowserState extends State<RedisKeyBrowser> {
  Timer? inputTimer;
  List<String> keys = [];
  int selectedIndex = -1;

  void updateSelectedItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

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
        if (state is RedisKeyTypeFetched) {
          if (state.dataType == RedisDataType.STRING) {
            BlocProvider.of<RedisClientBloc>(context)
                .add(GetRedisString(state.key));
          }
        }
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
        child: Container(
          padding: EdgeInsets.all(8),
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
          child: Column(
            children: [
              Container(
                child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                    cursorColor: Colors.black,
                    onChanged: (pattern) {
                      inputTimer?.cancel();
                      inputTimer = Timer(Duration(milliseconds: 500), () {
                        BlocProvider.of<RedisClientBloc>(context)
                            .add(FetchRedisKeys(pattern: pattern));
                      });
                    }),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: keys.length,
                  itemBuilder: (context, index) {
                    return Material(
                      color: index == selectedIndex
                          ? Theme.of(context).colorScheme.primaryVariant
                          : Theme.of(context).colorScheme.primary,
                      child: Ink(
                        child: ListTile(
                          title: Text(keys[index]),
                          hoverColor:
                          Theme.of(context).colorScheme.primaryVariant,
                          onTap: () {
                            BlocProvider.of<RedisClientBloc>(context)
                                .add(GetRedisKeyType(keys[index]));
                            updateSelectedItem(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.all(20),
                minWidth: MediaQuery.of(context).size.width,
                child: Text("Create"),
                color: Theme.of(context).buttonColor,
                textColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  debugPrint("create");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
