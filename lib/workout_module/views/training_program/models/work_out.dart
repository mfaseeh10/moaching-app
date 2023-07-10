part of 'models.dart';

class Workout {
  final String id;
  final String userId;
  final String name;
  final String coverImage;
  final bool isArchived;
  final bool active;
  final bool locked;
  final String startTime;
  final String createdDate;
  final String updatedDate;
  final List<WorkoutExercise> exercises;
  bool? isEdited;
  Trainer trainer = Trainer();


  Workout({this.id="",this.name="",this.active=true,this.coverImage="",required this.createdDate,this.isArchived=false,
  this.locked=false,required this.startTime,required this.updatedDate,this.userId="",
   required this.exercises ,required this.trainer
  });

  factory Workout.fromJson(Map<String, dynamic> json)=> Workout(
    name: json["name"].toString(),
    coverImage: json["coverImage"].toString(),
    userId: json["userId"].toString(),
    id: json["id"].toString(),
    createdDate: json["created"].toString(),
    updatedDate: json["updated"].toString(),
    isArchived: json["isArchived"],
    active: json["active"],
    locked: json["locked"],
    exercises: json["exercises"]==null?[] :List<WorkoutExercise>.from(json["exercises"].map((x) => WorkoutExercise.fromJson(x))),

      startTime: '',
      trainer:Trainer.fromJson(),
  );


  factory Workout.empty()=>
      Workout(createdDate: "",
          startTime:"",
          updatedDate: "",
        exercises: [],
        trainer: Trainer()

      );

  Map<String, dynamic> toJsonCreate() {
    // var json = jsonEncode(exercises.map((e) => e.toJson()).toList());
    return {
      "Name":name, //Todo for create/update to json
      "Id":id,//Todo for create/update to json
      "CoverImage":coverImage,//Todo for create/update to json
      "UserId":userId,//Todo for create/update to json
    };
  }

  Map<String, dynamic> toJson() {
    // var json = jsonEncode(exercises.map((e) => e.toJson()).toList());
    return {
        "Name":name, //Todo for create/update to json
        "Id":id,//Todo for create/update to json
        "CoverImage":coverImage,//Todo for create/update to json
        "UserId":userId,//Todo for create/update to json
        "Exercises":exercises, //Todo for update/update  to json
        // "StartTime":startTime,
        "Created":createdDate,//Todo for create/update  to json
        "Updated":DateTime.now().toString(),//Todo for create/update  to json
        "IsArchived":isArchived,//Todo for create/update  to json
        "Active":active,//Todo for create/update  to json
        "Locked":locked,//Todo for create/update  to json
         "IsEditable":true,//Todo for create/update  to json
        // "Exersice":[],
        "Trainer":null,//Todo for create/update  to json
      };
  }

  @override
  String toString() {
    return '$name , $userId ,$exercises';
  }





//
//   List<IWorkoutExercise> Exercises { get; set; }
//
//   Trainer Trainer { get; set; }
//
// [JsonIgnore]
//
}
