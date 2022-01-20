import 'package:flutter/material.dart';
import 'package:task_manager/Data/models/task_model.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({Key? key, required this.taskModel}) : super(key: key);
  final TaskModel taskModel;
  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool checkBoxState = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: parseColor(widget.taskModel.color!), 
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                // TODO: Customize
                spacing: 5,
                direction: Axis.horizontal,
                children: [
                  Chip(
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    backgroundColor: Colors.greenAccent,
                    label: Text(
                      'School',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Chip(
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    backgroundColor: Colors.greenAccent,
                    label: Text(
                      'School',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Chip(
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    backgroundColor: Colors.greenAccent,
                    label: Text(
                      'School',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ],
              ),
              Text(
                widget.taskModel.label!,
                style: Theme.of(context).textTheme.headline1,
              ),
              Row(
                children: [
                  Icon(Icons.date_range),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.taskModel.date!,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.watch_later_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.taskModel.time!,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        print('hello');
                      },
                      icon: Icon(Icons.mode_edit_outline_rounded)),
                  InkWell(
                    onTap: () {
                      setState(() {
                        checkBoxState = !checkBoxState;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: checkBoxState
                            ? Icon(
                                Icons.check,
                                size: 30.0,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.check_box_outline_blank,
                                size: 30.0,
                                color: Colors.black,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color parseColor(int v) {
    Color color = new Color(v);
    String colorString = color.toString(); // Color(0x12345678)
    String valueString =
        colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    Color otherColor = new Color(value);
    return otherColor;
  }
}
