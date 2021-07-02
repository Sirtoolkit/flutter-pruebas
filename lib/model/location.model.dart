import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
    Location({
        this.id,
        this.location,
    });

    int? id;
    String? location;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"] == null ? null : json["id"],
        location: json["location"] == null ? null : json["location"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "location": location == null ? null : location,
    };
}
