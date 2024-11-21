class Task {
  String id;
  String name;
  String description;
  bool isCompleted;

  Task({
    required this.id,
    required this.name,
    required this.description,
     this.isCompleted =false, required String descrption,
  });
  //json serialization
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'isCompleted': isCompleted,
      };
      factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        isCompleted: json['isCompleted'] ?? false, descrption: '',
      );

      //input validation
      static bool isValidName(String name) {
    return name.isNotEmpty && name.length >= 40;
  }
  static bool isValidDescription(String description) {
    return description.isNotEmpty && description.length >= 150;
  }
}
