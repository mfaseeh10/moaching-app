import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'package:moaching_app/workout_module/views/exercise/model/equipments.dart';
import 'package:moaching_app/workout_module/views/exercise/model/model.dart';

enum WorkoutIntensity { Low, Medium, High }

enum ExerciseType { Exercise, Set, Interval }

// enum ExerciseState { Ready, Done }

class WorkoutExercise {
  final String exerciseKey;
  final List<Sets> sets;
  final String time;
  final String intensity;
  final WorkoutTempo tempo;
  final List<Equipments> options;
  final String notes;
  final String name;
  final List<Equipments> equipment;
  final String primaryMuscle;
  final int category;
  final String youtubeLink;
  final int state;
  final String exerciseEnded;
  final String exerciseStarted;
  final String exerciseId;
  final int exerciseType;

  WorkoutExercise(
      {required this.name,
      required this.sets,
      required this.category,
      required this.youtubeLink,
      required this.notes,
      required this.equipment,
      required this.exerciseKey,
      required this.intensity,
      required this.options,
      required this.primaryMuscle,
      required this.tempo,
      required this.time,
      required this.state,
      required this.exerciseEnded,
      required this.exerciseId,
      required this.exerciseStarted,
      required this.exerciseType});

  factory WorkoutExercise.fromJson(Map<String, dynamic> json) {
    return WorkoutExercise(
        name: json["name"].toString(),
        time: json["time"].toString(),
        category: json["category"],
        youtubeLink: json["youtubeLink"].toString(),
        exerciseKey: json["exerciseKey"].toString(),
        sets:json["sets"]==null?[]: List<Sets>.from(
            json["sets"].map((x) => Sets.fromJson(x))),
        intensity: json["intensity"].toString(),
        notes: json["notes"].toString(),
        equipment:json["equipment"]==null?[]: List<Equipments>.from(
            json["equipment"].map((x) => Equipments.fromJson(x))),
        options:json["options"]==null?[] : List<Equipments>.from(
            json["options"].map((x) => Equipments.fromJson(x))),
        primaryMuscle: json["primaryMuscle"].toString(),
        tempo:WorkoutTempo.fromJson(json["tempo"]),
        state: json['state']??0,
        exerciseId: json['exerciseId'].toString(),
        exerciseStarted: json['exerciseStarted'].toString(),
        exerciseEnded: json['exerciseEnded'].toString(),
        exerciseType: json['exerciseType']??0
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ExerciseKey'] = exerciseKey;
    if (sets != null) {
      data['Sets'] = sets.map((v) => v.toJson()).toList();
    }
    data['Time'] = null;
    data['Intensity'] = null;
    if (tempo != null) {
      data['Tempo'] = tempo.toJson();
    }

      data['Options'] =null;

    data['Notes'] = notes;
    data['Name'] = name;
    if (equipment != null) {
      data['Equipment'] = equipment.map((v) => v.toJson()).toList();
    }
    data['PrimaryMuscle'] = primaryMuscle;
    data['Category'] = 0;
    data['YoutubeLink'] = youtubeLink;
    data['ExerciseType'] = exerciseType;
    data['ExerciseId'] = "eeb70677-7f3e-4d9e-a432-7e8c56136d8c";
    data['ExerciseStarted'] = null;
    data['ExerciseEnded'] = null;
    data['State'] = state;
    return data;
  }
}

class Sets {
  final double weight;
  final int reps;
  final double breaks;

  Sets({required this.weight ,required this.reps , required this.breaks ,});

  factory Sets.fromJson(Map<String, dynamic> json) => Sets(
      weight: json['Weight'] ?? 0.0,
      reps :json['Reps']??0,
      breaks : json['Break']??0.0,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Weight'] = weight;
    data['Reps'] = reps;
    data['Break'] = breaks;
    return data;
  }

}





class WorkoutTempo {
  final int? eccentric;
  final int? midpoint;
  final int? concentric;
  final int? startingPoint;

  WorkoutTempo(
      {required this.concentric,
      required this.eccentric,
      required this.midpoint,
      required this.startingPoint});

  factory WorkoutTempo.fromJson(Map<String, dynamic> json) {

   return  WorkoutTempo(
        eccentric: json['eccentric'],
        midpoint: json['midpoint'],
        concentric: json['concentric'],
        startingPoint: json['startingPoint']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Eccentric'] = eccentric;
    data['Midpoint'] = midpoint;
    data['Concentric'] = concentric;
    data['StartingPoint'] = startingPoint;
    return data;
      }
}













//
// class Interval extends WorkoutExercise {
//   final String name;
//   final int set;
//   final double duration;
//   final double breakBetweenExercises;
//   final List<WorkoutExercise> exercises;
//
//   Interval(
//       {required this.set,
//       required this.exercises,
//       required this.name,
//       required this.breakBetweenExercises,
//       required this.duration})
//       : super(
//           name: "",
//           sets: [],
//           category: "",
//           youtubeLink: "",
//           notes: "",
//           equipment: [],
//           exerciseKey: "",
//           intensity: "",
//           options: [],
//           primaryMuscle: "",
//           tempo: WorkoutTempo(
//               concentric: 0, eccentric: 0, midpoint: 0, startingPoint: 0),
//           time: "",
//           exerciseType: 0,
//           state: 0,
//           exerciseStarted: "",
//           exerciseEnded: "",
//           exerciseId: "",
//         );
//
//   factory Interval.fromJson(Map<String, dynamic> json) => Interval(
//         name: json["name"].toString(),
//         set: int.parse(json["set"].toString()),
//         breakBetweenExercises: double.parse(json["breakBetweenExercises"]),
//         exercises: json["exercises"],
//         duration: json["duration"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "set": set,
//         "breakBetweenExercises": breakBetweenExercises,
//         "exercises": exercises,
//         "duration": duration,
//       };
// }
//
// class WorkoutSet {
//   final double weight;
//   final int reps;
//   final double breaks;
//   WorkoutSet({required this.reps, required this.weight, required this.breaks});
//
//   factory WorkoutSet.fromJson(Map<String, dynamic> json) => WorkoutSet(
//         weight: double.parse(json["weight"]),
//         reps: int.parse(json["reps"].toString()),
//         breaks: double.parse(json["breaks"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "weight": weight,
//         "reps": reps,
//         "breaks": breaks,
//       };
// }

