import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/Data/Business%20Logic/app_states.dart';
import 'package:task_manager/Data/models/task_model.dart';
import 'package:task_manager/Network/database_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  DatabaseHelper dbhelper = DatabaseHelper.instance;

  List<TaskModel> tasks = [];
  Future<void> todayTasks() async {
    tasks.clear();
    final tasksModel = await dbhelper.parseTasks();
    tasksModel.forEach((element) {
      tasks.add(element);
    });
    emit(addTasksSuccessfully());
  }

  void insertToDB(TaskModel taskModel) async {
    int id = await dbhelper.insertTask(taskModel);
    print(id);
    emit(insertToDbState());
  }


}
