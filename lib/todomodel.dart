import 'package:flutter/cupertino.dart';
import 'package:state_project/taskmodel.dart';

// class TaskDo extends ChangeNotifier {
//   List<TaskModel> task = [];

//   addTaskDo() {
//     TaskModel taskModel =
//         TaskModel('title${task.length}', 'this is the detail${task.length}');

//     task.add(taskModel);
//     notifyListeners();
//   }
// }

class TaskDo extends ChangeNotifier {
  List<TaskModel> task = [];
  addTaskDo() {
    TaskModel taskModel = TaskModel('this is the head title${task.length}',
        "this is the boy detail${task.length}");

    task.add(taskModel);
    notifyListeners();
  }
}
