class Elements {
  final String? name;
  final String? key;
  final List<Reactions>? reactions;

  Elements({
    this.name,
    this.key,
    this.reactions,
  });

  Elements.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        key = json['key'] as String?,
        reactions = (json['reactions'] as List?)?.map((dynamic e) => Reactions.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'name' : name,
    'key' : key,
    'reactions' : reactions?.map((e) => e.toJson()).toList()
  };
}

class Reactions {
  final String? name;
  final List<String>? elements;
  final String? description;

  Reactions({
    this.name,
    this.elements,
    this.description,
  });

  Reactions.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        elements = (json['elements'] as List?)?.map((dynamic e) => e as String).toList(),
        description = json['description'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'elements' : elements,
    'description' : description
  };
}