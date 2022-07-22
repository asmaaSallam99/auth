class UnityModel {
  static const String SRC_KEY = "src";
  static const String TEXTURE_KEY = "texture";

  String src;
  String texture;

  UnityModel(this.src, this.texture);

  factory UnityModel.fromMap(Map<String, dynamic> map, {String id}) {
    return UnityModel(
      map[SRC_KEY],
      map[TEXTURE_KEY],
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      SRC_KEY: src,
      TEXTURE_KEY: texture,
    };

    return map;
  }

  Map<String, dynamic> toUpdateMap() {
    final map = <String, dynamic>{};
    if (src != null) map[SRC_KEY] = src;
    if (texture != null) map[TEXTURE_KEY] = texture;
    return map;
  }
}
