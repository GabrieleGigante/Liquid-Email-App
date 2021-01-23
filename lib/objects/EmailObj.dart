import 'dart:convert';

class EmailObj {
  final String icon;
  final String sender;
  final String object;
  final String body;
  final bool isRead;
  final String category;
  final String time;
  EmailObj(
      {this.icon = '',
      this.sender = '',
      this.object = '',
      this.body = '',
      this.isRead = false,
      this.category = '',
      this.time = ''});

  EmailObj copyWith({
    String icon,
    String sender,
    String object,
    String body,
    bool isRead,
    String category,
    String time,
  }) {
    return EmailObj(
      icon: icon ?? this.icon,
      sender: sender ?? this.sender,
      object: object ?? this.object,
      body: body ?? this.body,
      isRead: isRead ?? this.isRead,
      category: category ?? this.category,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'icon': icon,
      'sender': sender,
      'object': object,
      'body': body,
      'isRead': isRead,
      'category': category,
      'time': time,
    };
  }

  factory EmailObj.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EmailObj(
      icon: map['icon'],
      sender: map['sender'],
      object: map['object'],
      body: map['body'],
      isRead: map['isRead'],
      category: map['category'],
      time: map['time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EmailObj.fromJson(String source) =>
      EmailObj.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EmailObj(icon: $icon, sender: $sender, object: $object, body: $body, isRead: $isRead, category: $category, time: $time)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EmailObj &&
        o.icon == icon &&
        o.sender == sender &&
        o.object == object &&
        o.body == body &&
        o.isRead == isRead &&
        o.category == category &&
        o.time == time;
  }

  @override
  int get hashCode {
    return icon.hashCode ^
        sender.hashCode ^
        object.hashCode ^
        body.hashCode ^
        isRead.hashCode ^
        category.hashCode ^
        time.hashCode;
  }
}
