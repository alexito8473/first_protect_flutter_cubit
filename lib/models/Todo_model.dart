enum Filter {
  ALL,
  ACTIVE,
  COMPLETED;

  String content() {
    switch (this) {
      case Filter.ALL:
        return "All";
      case Filter.ACTIVE:
        return "Active";
      case Filter.COMPLETED:
        return "Completed";
    }
  }
}

class TodoModel {
  final String id;
  final String desc;
  bool completed;
  TodoModel({required this.id, required this.desc, this.completed = false});
}
