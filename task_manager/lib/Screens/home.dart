import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:task_manager/Screens/add_task.dart';
import 'package:task_manager/Screens/tody_task.dart';
import 'package:task_manager/Widgets/task_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Task Manager', style: Theme.of(context).textTheme.headline2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        'Here\'s Update Today',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Center(
                        child: Icon(
                          Icons.search,
                          size: 40,
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      ButtonsTabBar(
                        backgroundColor: Colors.black,
                        buttonMargin: EdgeInsets.all(10),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        height: 60,
                        unselectedBackgroundColor: Colors.white,
                        unselectedLabelStyle:
                            Theme.of(context).textTheme.headline3,
                        labelStyle: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.white),
                        radius: 100,
                        tabs: [
                          Tab(
                            text: 'Today',
                          ),
                          Tab(
                            text: 'Upcoming',
                          ),
                          Tab(
                            text: 'Task Done',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          TodayTasks(),
                          Center(
                            child: Text('Hi'),
                          ),
                          Center(
                            child: Text('Hi'),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddTask()),
          );
        },
        backgroundColor: Colors.black,
        icon: Icon(
          Icons.add_box_rounded,
          color: Colors.white,
        ),
        label: Text(
          'Add Task',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
