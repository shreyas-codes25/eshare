class DriveData {
  final String? url;
  final String shortUrl;
  final String name;
  final String modifiedDate;
  final int size;
  final String id;
  final dynamic nextToken;

  DriveData({
    required this.url,
    required this.shortUrl,
    required this.name,
    required this.modifiedDate,
    required this.size,
    required this.id,
    this.nextToken,
  });

  /// Factory method to create an instance from JSON
  factory DriveData.fromJson(Map<String, dynamic> json) {
    return DriveData(
      url: json['url'] as String?,
      shortUrl: json['shortUrl'] as String,
      name: json['name'] as String,
      modifiedDate: json['modifiedDate'] as String,
      size: json['size'] as int,
      id: json['id'] as String,
      nextToken: json['nextToken'],
    );
  }

  /// Convert an instance to JSON format
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'shortUrl': shortUrl,
      'name': name,
      'modifiedDate': modifiedDate,
      'size': size,
      'id': id,
      'nextToken': nextToken,
    };
  }
}
