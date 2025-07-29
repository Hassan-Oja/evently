class Event {
  static const String collectionName = 'Event';

  String eventID;

  int eventImage;

  int eventName;

  String eventTitle;

  String eventDescription;

  DateTime eventDateTime;

  String eventTime;

  bool isFavorite;

  Event({
    this.eventID = '',
    required this.eventImage,
    required this.eventName,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventDateTime,
    required this.eventTime,
    this.isFavorite = false,
  });

  // todo : json => object
  Event.fromjson(Map<String, dynamic> data)
    : this(
        eventID: data['id'],
        eventImage: data['image'],
        eventName: data['name'],
        eventTitle: data['title'],
        eventDescription: data['description'],
        eventDateTime: DateTime.fromMillisecondsSinceEpoch(data['time']),
        eventTime: data['time'],
        isFavorite: data['isFavorite'],
      );

  //todo : object => json
  Map<String, dynamic> tojson() {
    return {
      'id': eventID,
      'image': eventImage,
      'name': eventName,
      'title': eventTitle,
      'description': eventDescription,
      'date': eventDateTime.millisecondsSinceEpoch,
      'time': eventTime,
      'isFavorite': isFavorite,
    };
  }
}
