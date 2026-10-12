enum PetType {
  dog(typeName: "สุนัข"),
  cat(typeName: "แมว"),
  bird(typeName: "นก"),
  rabbit(typeName: "กระต่าย");

  const PetType({required this.typeName});
  final String typeName;
}

class PetModel {
  String name;
  String breed;
  int age;
  PetType petType;

  PetModel({
    required this.name,
    required this.breed,
    required this.age,
    required this.petType,
  });
}

List<PetModel> petList = [
  PetModel(
    name: "ส้มส้ม",
    breed: "เปอร์เซีย",
    age: 2,
    petType: PetType.cat,
  ),
];