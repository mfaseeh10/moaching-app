part of'model.dart';

enum ExerciseCategory { Cardio , Strength }


class Exercise
{
  final String key ;
  final String name ;
  final String category ;
  final String description ;
  final String youtubeLink ;
  final List<Instruction> instructions;
  final List<Equipments> equipments;
  final List<Target> targets;



  Exercise({
    required this.name,
    required this.category,
    required this.description,
    required this.key,
    required this.youtubeLink,
    required this.instructions,
    required this.equipments,
    required this.targets
  });

  factory Exercise.fromJson(Map<String, dynamic> json)=> Exercise(
      name: json["name"].toString(),
      description: json["description"].toString(),
      category: json["category"].toString(),
      youtubeLink: json["youtubeLink"].toString(),
      key: json["key"].toString(),
      targets: List<Target>.from(json["targets"].map((x) => Target.fromJson(x))),
      equipments: List<Equipments>.from(json["equipment"].map((x) => Equipments.fromJson(x))),
      instructions: List<Instruction>.from(json["instructions"].map((x) => Instruction.fromJson(x))),
  );


}