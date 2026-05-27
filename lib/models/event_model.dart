class EventModel {
  final int id;
  final String title;
  final String description;
  final String location;
  final int totalSlots;
  final int remainingSlots;
  final String status;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.totalSlots,
    required this.remainingSlots,
    required this.status,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      totalSlots: json['totalSlots'] ?? 0,
      remainingSlots: json['remainingSlots'] ?? 0,
      status: json['status'] ?? 'Available',
    );
  }
}
