import 'package:flutter/material.dart';

class RedisKeyBrowser extends StatefulWidget {
  const RedisKeyBrowser({Key? key}) : super(key: key);

  @override
  _RedisKeyBrowserState createState() => _RedisKeyBrowserState();
}

class _RedisKeyBrowserState extends State<RedisKeyBrowser> {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(1000, (i) => "Key $i");
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    title: Text(items[index]),
                  ),
                  onTap: () => debugPrint("${items[index]}"),
                ));
          },
        ),
      ),
    );
  }
}
