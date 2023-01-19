class PetDataModel {
  String? name;
  String? type;
  String? breed;
  String? sex;
  String? ownerName;
  String? price;
  int? age;
  bool? isAdopted;
  String? weight;
  String? location;
  String? image;

  PetDataModel(
      {this.name,
      this.type,
      this.breed,
      this.sex,
      this.ownerName,
      this.price,
      this.age,
      this.weight,
      this.isAdopted,
      this.location,
      this.image});

  PetDataModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    name = json['name'];
    type = json['type'];
    breed = json['breed'];
    isAdopted = json['is_adopted'] ?? false;
    sex = json['sex'];
    ownerName = json['owner_name'];
    price = json['price'];
    age = json['age'];
    weight = json['weight'];
    location = json['location'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['breed'] = breed;
    data['sex'] = sex;
    data['is_adopted'] = isAdopted;
    data['owner_name'] = ownerName;
    data['price'] = price;
    data['age'] = age;
    data['weight'] = weight;
    data['location'] = location;
    data['image'] = image;
    return data;
  }
}
