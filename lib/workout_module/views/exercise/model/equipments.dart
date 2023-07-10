

class Equipments
{
  final String key;
  final String name;

  Equipments({required this.key ,required this.name});

  factory Equipments.fromJson(Map<String, dynamic> json)=> Equipments(
    key: json["Key"].toString(),
    name: json["Name"].toString(),
  );

  Map<String, dynamic> toJson() =>
      {
        "Key":key.toString() ,
        "Name":name.toString() ,
      };


}