import 'dart:io';

import 'package:to_do_list/task_manager.dart';



void main() async{
  final taskManager = TaskManager();
  await taskManager.loadTasks();
  

  while(true){
    print('---task manager---');
    print('1. add task');
    print('2. remove task');
    print('3. mark as completed');
    print('4. show tasks');
    print('5. save tasks');
    print('6. exit');
    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    switch(choice){
      case '1':
        stdout.write('Enter task name: ');
        String? name = stdin.readLineSync();
        stdout.write('Enter task description: ');
        String? description = stdin.readLineSync();
        taskManager.addTask(name!, description!);
        break;
      case '2':
        stdout.write('Enter task name: ');
        String? name = stdin.readLineSync();
        taskManager.removeTask(name!);
        break;
      case '3':
        stdout.write('Enter task name: ');
        String? name = stdin.readLineSync();
        taskManager.markAsCompleted(name!);
        break;
      case '4':
        taskManager.displayTasks();
        break;
      case '5':
         taskManager.saveTasks();
        break;
      case '6':
         taskManager.saveTasks();
        exit(0);
        break;
      default:
        print('invalid choice');
    }
  }
}

