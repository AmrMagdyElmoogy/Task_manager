import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/Data/Business%20Logic/app_cubit.dart';
import 'package:task_manager/Data/Business%20Logic/app_states.dart';
import 'package:task_manager/Widgets/task_card.dart';

class TodayTasks extends StatelessWidget {
  const TodayTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var taskslist = AppCubit.get(context).tasks;
        return taskslist.length != 0
            ? ListView.separated(
                itemBuilder: (context, index) =>
                    TaskCard(taskModel: taskslist[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                itemCount: taskslist.length)
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
