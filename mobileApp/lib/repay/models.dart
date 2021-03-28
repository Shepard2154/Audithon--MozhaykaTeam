import 'package:meta/meta.dart';

class Todo {
  const Todo({
    @required this.id,
    @required this.description,
    this.items,
  });

  final String id;

  final String description;

  final List<Item> items;
}

class Item {
  Item({
    @required this.id,
    this.description = '',
    this.completed = false,
  });

  final String id;

  final String description;

  bool completed;
}
