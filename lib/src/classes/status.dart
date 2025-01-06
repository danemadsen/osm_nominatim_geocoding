class Status {
  int status;
  String message;
  DateTime dataUpdated;
  String softwareVersion;
  String databaseVersion;

  Status({
    required this.status,
    required this.message,
    required this.dataUpdated,
    required this.softwareVersion,
    required this.databaseVersion,
  });

  factory Status.fromMap(Map<String, dynamic> map) => Status(
    status: map["status"],
    message: map["message"],
    dataUpdated: DateTime.parse(map["data_updated"]),
    softwareVersion: map["software_version"],
    databaseVersion: map["database_version"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data_updated": dataUpdated.toIso8601String(),
    "software_version": softwareVersion,
    "database_version": databaseVersion,
  };
}