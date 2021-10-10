import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redis_client/bloc/redis_client_bloc.dart';
import 'package:redis_client/bloc/redis_client_event.dart';

class RedisStringContainer extends StatefulWidget {
  final String redisKey;
  final String redisValue;

  const RedisStringContainer(
      {Key? key, required this.redisKey, required this.redisValue})
      : super(key: key);

  @override
  _RedisStringContainerState createState() => _RedisStringContainerState();
}

class _RedisStringContainerState extends State<RedisStringContainer> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller.text = widget.redisValue;
    focusNode.requestFocus();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.unfocus();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              cursorColor: Colors.black,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.all(20),
            minWidth: MediaQuery.of(context).size.width,
            child: Text("Update"),
            color: Theme.of(context).buttonColor,
            textColor: Theme.of(context).colorScheme.primary,
            onPressed: () {
              BlocProvider.of<RedisClientBloc>(context)
                  .add(UpdateRedisString(widget.redisKey, controller.text));
            },
          )
        ],
      ),
    );
  }
}
