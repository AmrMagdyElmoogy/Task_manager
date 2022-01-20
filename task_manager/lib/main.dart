import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/Data/Business%20Logic/app_cubit.dart';
import 'package:task_manager/Network/database_helper.dart';
import 'package:task_manager/constrants.dart';
import 'Screens/home.dart';
import 'package:rxdart/src/streams/value_stream.dart';

void main() async {
  // await DatabaseHelper.initDatabase();
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (context) => AppCubit()),
    //   ],
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     theme: AppTheme.light(),
    //     home: Home(),
    //   ),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: Home(),
    );
  }
}
