class Nations {
  final String? name;
  final String? element;
  final String? archon;
  final String? controllingEntity;

  Nations({
    this.name,
    this.element,
    this.archon,
    this.controllingEntity,
  });

  Nations.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        element = json['element'] as String?,
        archon = json['archon'] as String?,
        controllingEntity = json['controllingEntity'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'element' : element,
    'archon' : archon,
    'controllingEntity' : controllingEntity
  };
}