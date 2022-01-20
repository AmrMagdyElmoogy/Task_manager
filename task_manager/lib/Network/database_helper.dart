import 'package:sqflite/sqlite_api.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:task_manager/Data/models/task_model.dart';

class DatabaseHelper {
  static const databaseName = 'MyTasks.db';
  static const databaseVerison = 1;
  static const String taskTableToday = 'Task_Today';
  static const String taskTableUpcoming = 'Task_Upcoming';
  static const String taskTableDone = 'Task_Done';
  static const String taskTodayId = 'Task_Today_Id';
  static const String taskTodaylabel = 'Task_Today_Label';
  static const String taskTodayColor = 'Task_Today_Color';
  static const String taskTodayDate = 'Task_Today_Date';
  static const String taskTodayTime = 'Task_Today_Time';
  static const String taskTodayIsDone = 'Task_Today_IsDone';
  static const String taskTodayTypes = 'Task_Today_Types';

  static Database? _database;
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static late BriteDatabase briteDatabase;

  static Future _onCreate(Database db, int version) async {
    await db.execute(''' 
      CREATE TABLE $taskTableToday (
        $taskTodayId INTEGER PRIMARY KEY,
        $taskTodaylabel TEXT,
        $taskTodayColor INTEGER,
        $taskTodayDate TEXT, 
        $taskTodayIsDone INTEGER,
        $taskTodayTypes TEXT)
    ''');
  }

  static Future<Database> initDatabase() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, databaseName);
    return openDatabase(path, onCreate: _onCreate);
  }

  Future<Database> get database async {
    if (_database != null)
      return _database!;
    else {
      _database = await initDatabase();
      briteDatabase = BriteDatabase(_database!);
    }
    return _database!;
  }

  Future<BriteDatabase> get streamDatabase async {
    await database;
    return briteDatabase;
  }

  Future <List<TaskModel>> parseTasks() async {
    final allTasks = await selectDataFromTable();
    final tasks = <TaskModel>[];
    allTasks.forEach((element) {
      final task = TaskModel.fromJson(element);
      tasks.add(task);
    });
    return tasks;
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    final db = await instance.streamDatabase;
    return db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> selectDataFromTable() async {
    final db = await instance.streamDatabase;
    return await db.query(taskTableToday);
  }

  Future<int> insertTask(TaskModel taskModel) {
    return insert(taskTableToday, taskModel.toJson());
  }
}
