import 'package:flutter/material.dart';

class RedisStringContainer extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const RedisStringContainer(
      {Key? key, required this.controller, required this.focusNode})
      : super(key: key);

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
              debugPrint("submit");
            },
          )
        ],
      ),
    );
  }
}
