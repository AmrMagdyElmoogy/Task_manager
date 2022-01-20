import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nanoid/non_secure.dart';
import 'package:task_manager/Data/Business%20Logic/app_cubit.dart';
import 'package:task_manager/Data/Business%20Logic/app_states.dart';
import 'package:task_manager/Data/models/task_model.dart';

class AddTask extends StatefulWidget {
  // AddTask(
  //     {Key? key,
  //     this.id,
  //     this.label,
  //     this.chosenColor,
  //     this.date,
  //     this.time,
  //     this.types})
  //     : super(key: key);
  String? id;
  String? label;
  int? chosenColor = Colors.grey[400]!.value;
  String? date;
  String? time;
  late String types;

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  List<Color> colors = [
    Colors.yellow,
    Colors.blue,
    Colors.greenAccent,
    Colors.purple,
    Colors.lightGreen,
    Colors.black,
    Colors.red,
    Colors.orange,
  ];
  List<String> chipsLabel = [
    'Basic',
    'Urgent',
    'Important',
    'School',
    'Ship',
    'Entertainment',
    'Study',
  ];
  Color primary = Colors.grey;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController labelController = TextEditingController();

  bool valueOne = false;
  bool valueTwo = false;
  bool valueThird = false;
  bool valueFourth = false;
  bool valueFifth = false;
  bool valueSixth = false;
  bool valueSeventh = false;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Task',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {
              if (state is addTasksSuccessfully) {
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              var cubit = AppCubit.get(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Color Task',
                    style: textTheme.headline2!.copyWith(color: primary),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          circleColor(colors[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 5,
                      ),
                      itemCount: colors.length,
                    ),
                  ),
                  sperator(),
                  Text(
                    'Label',
                    style: textTheme.headline2!.copyWith(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: labelController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onEditingComplete: () {
                            setState(() {
                              widget.label = labelController.text;
                            });
                          },
                          style: textTheme.headline2!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(Icons.label, color: Colors.black, size: 35),
                    ],
                  ),
                  sperator(),
                  Text(
                    'Date',
                    style: textTheme.headline2!.copyWith(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: dateController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onEditingComplete: () {
                            setState(() {
                              widget.date = dateController.text;
                            });
                          },
                          style: textTheme.headline2!
                              .copyWith(fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2023))
                                .then((value) {
                              setState(() {
                                dateController.text =
                                    DateFormat('yyyy-MM-dd').format(value!);
                                ;
                              });
                            });
                          },
                        ),
                      ),
                      Icon(Icons.calendar_today_rounded,
                          color: Colors.black, size: 35),
                    ],
                  ),
                  sperator(),
                  Text(
                    'Time',
                    style: textTheme.headline2!.copyWith(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: timeController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onEditingComplete: () {
                            setState(() {
                              widget.time = timeController.text;
                            });
                          },
                          style: textTheme.headline2!
                              .copyWith(fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              setState(() {
                                timeController.text = value!.format(context);
                              });
                            });
                          },
                        ),
                      ),
                      Icon(
                        Icons.watch_later_rounded,
                        size: 35,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  sperator(),
                  Text(
                    'Task Type',
                    style: textTheme.headline2!.copyWith(color: Colors.grey),
                  ),
                  Wrap(
                    spacing: 5,
                    direction: Axis.horizontal,
                    children: [
                      ChoiceChip(
                        label: Text(
                          'Basic',
                          style: valueFifth
                              ? textTheme.headline2!
                                  .copyWith(color: Colors.white)
                              : textTheme.headline2!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        selectedColor: Colors.black,
                        selected: valueFifth,
                        onSelected: (select) {
                          setState(
                            () {
                              valueFifth = !valueFifth;
                            },
                          );
                        },
                      ),
                      ChoiceChip(
                        label: Text(
                          'Urgent',
                          style: valueSixth
                              ? textTheme.headline2!
                                  .copyWith(color: Colors.white)
                              : textTheme.headline2!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        selectedColor: Colors.black,
                        selected: valueSixth,
                        onSelected: (select) {
                          setState(
                            () {
                              valueSixth = !valueSixth;
                            },
                          );
                        },
                      ),
                      ChoiceChip(
                        label: Text(
                          'Important',
                          style: valueSeventh
                              ? textTheme.headline2!
                                  .copyWith(color: Colors.white)
                              : textTheme.headline2!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        selectedColor: Colors.black,
                        selected: valueSeventh,
                        onSelected: (select) {
                          setState(
                            () {
                              valueSeventh = !valueSeventh;
                            },
                          );
                        },
                      ),
                      ChoiceChip(
                        label: Text(
                          'School',
                          style: valueOne
                              ? textTheme.headline2!
                                  .copyWith(color: Colors.white)
                              : textTheme.headline2!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        selectedColor: Colors.black,
                        selected: valueOne,
                        onSelected: (select) {
                          setState(
                            () {
                              valueOne = !valueOne;
                            },
                          );
                        },
                      ),
                      ChoiceChip(
                        label: Text(
                          'Shop',
                          style: valueTwo
                              ? textTheme.headline2!
                                  .copyWith(color: Colors.white)
                              : textTheme.headline2!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        selectedColor: Colors.black,
                        selected: valueTwo,
                        onSelected: (select) {
                          setState(
                            () {
                              valueTwo = !valueTwo;
                            },
                          );
                        },
                      ),
                      ChoiceChip(
                        label: Text(
                          'Entertainment',
                          style: valueThird
                              ? textTheme.headline2!
                                  .copyWith(color: Colors.white)
                              : textTheme.headline2!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        selectedColor: Colors.black,
                        selected: valueThird,
                        onSelected: (select) {
                          setState(
                            () {
                              valueThird = !valueThird;
                            },
                          );
                        },
                      ),
                      ChoiceChip(
                        label: Text(
                          'Study',
                          style: valueFourth
                              ? textTheme.headline2!
                                  .copyWith(color: Colors.white)
                              : textTheme.headline2!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        selectedColor: Colors.black,
                        selected: valueFourth,
                        onSelected: (select) {
                          setState(
                            () {
                              valueFourth = !valueFourth;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  sperator(),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: ElevatedButton(
                      onPressed: () {
                        addChipItem();
                        TaskModel taskModel = new TaskModel(
                          id: nanoid(),
                          label: widget.label,
                          date: widget.date,
                          time: widget.time,
                          color: widget.chosenColor,
                          types: widget.types,
                        );
                        cubit.insertToDB(taskModel);
                        cubit.todayTasks();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: Text('Save Task',
                          style: textTheme.headline2!.copyWith(
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget circleColor(Color color) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.chosenColor = color.value;
          primary = color;
        });
      },
      child: CircleAvatar(
        radius: 18,
        backgroundColor: color,
      ),
    );
  }

  Widget sperator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey[300],
      ),
    );
  }

  void addChipItem() {
    if (valueFifth) widget.types += chipsLabel[0] + ',';
    if (valueSixth) widget.types += chipsLabel[1] + ',';
    if (valueSeventh) widget.types += chipsLabel[2] + ',';
    if (valueOne) widget.types += chipsLabel[3] + ',';
    if (valueTwo) widget.types += chipsLabel[4] + ',';
    if (valueThird) widget.types += chipsLabel[5] + ',';
    if (valueFourth) widget.types += chipsLabel[6] + ',';
  }
}
