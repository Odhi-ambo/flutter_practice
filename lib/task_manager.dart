import 'dart:convert';
import 'dart:io';

import 'package:to_do_list/model/task.dart';

class TaskManager {
  List<Task> tasks = [];
  TaskManager();

  //load tasks from json file
  Future<void> loadTasks() async {
    try {
      final file = File('tasks.json');
      if (await file.exists()) {
        final content = await file.readAsString();
        final List<dynamic> jsonData = jsonDecode(content);
        tasks = jsonData.map((e) => Task.fromJson(e)).toList();
      }
    } catch (e) {
      print('Error loading tasks: $e');
    }
  }

  //save tasks to a json file
  Future<void> saveTasks() async {
    try {
      final file = File('tasks.json');
      final jsonData = tasks.map((e) => e.toJson()).toList();
      final jsonString = jsonEncode(jsonData);
      await file.writeAsString(jsonString);
    } catch (e) {
      print('Error saving tasks: $e');
    }
  }

  //add a new task
  void addTask(String name, String description) {
    if (name.isEmpty || description.isEmpty) {
      print('error: name or description is empty');
      return;
    }
    tasks.add(Task(name: name, description: description, id: '', descrption: ''));
    print('task added: $name');
  }
  //remove a task by name
  void removeTask(String name){
    final task = tasks.firstWhere((e) => e.name == name, orElse: () => Task(name: '', id: '', description: '', descrption: ''));
    if(task.name.isEmpty){
      print('error: task not found');
      return;
    }
    tasks.remove(task);
    print('task removed: $name');
  }
  //mark a task as completed
  void markAsCompleted(String name){
    final task = tasks.firstWhere((e) => e.name == name, orElse: () => Task(name: '', description: '', id: '', descrption: ''));
    if(task.name.isEmpty){
      print('error: task not found');
      return;
    }
    task.isCompleted = true;
    print('task completed: $name');
  }
  //diplay all tasks
  void displayTasks(){
    if(tasks.isEmpty){
      print('no tasks');
      return;
    }
    for(final task in tasks){
      print('name: ${task.name}, description: ${task.description}, completed: ${task.isCompleted}');
    }
  }
}
