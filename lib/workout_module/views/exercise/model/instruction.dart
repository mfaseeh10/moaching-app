


class Instruction
{
  final String step;
  final String text;

  Instruction({required this.text ,required this.step});

  factory Instruction.fromJson(Map<String, dynamic> json)=> Instruction(
    step: json["step"].toString(),
    text: json["text"].toString(),
  );


}