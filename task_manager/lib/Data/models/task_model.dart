class TaskModel {
  String? id;
  String? label;
  int? color;
  String? date;
  String? time;
  int? isDone;
  String? types;

  TaskModel(
      {this.id,
      this.label,
      this.color,
      this.date,
      this.time,
      this.isDone,
      this.types});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    color = json['color'];
    date = json['date'];
    time = json['time'];
    isDone = json['isDone'];
    types = json['types'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'color': color,
        'date': date,
        'time': time,
        'isDone': isDone,
        'types': types,
      };
}
