class Category {
  int id;
  String name;
  String nameAr;
  int? parentId;
  List<Category>? children;

  Category({
    required this.id,
    required this.name,
    required this.nameAr,
    this.children,
    this.parentId,
  });
  factory Category.fromJson(Map<String, dynamic> json) => Category(
      id: json['id'],
      name: json['name'],
      nameAr: json['nameAr'],
      parentId: json['parent_id']);

  @override
  String toString() {
    return 'Category{id: $id, name: $name, nameAr: $nameAr, parendId: $parentId, children: $children}';
  }
}
