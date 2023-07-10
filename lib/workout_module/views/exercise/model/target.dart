

class Target
{
  final String key;
  final bool primary;
  final String name;



  Target({required this.key ,required this.name ,required this.primary});

  factory Target.fromJson(Map<String, dynamic> json)=>Target(
    key: json["key"].toString(),
    primary: json["primary"],
    name: json["name"].toString()
  );

}