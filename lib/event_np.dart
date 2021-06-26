class EventNp {
  DateTime start;
  DateTime end;
  String? description;

  Duration get duration => end.difference(start);

  EventNp._(
    this.start,
    this.end,
    this.description,
  );

  factory EventNp({
    required DateTime start,
    DateTime? end,
    String? description,
  }) {
    end = end ?? start.add(const Duration(hours: 1));
    if (end.isBefore(start) || end.isAtSameMomentAs(start))
      throw ArgumentError("END must happen after START");

    return EventNp._(start, end, description);
  }
}
