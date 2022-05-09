// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
    Booking({
       required this.success,
       required this.booking,
    });

    int success;
    List<BookingElement> booking;

    factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        success: json["success"],
        booking: List<BookingElement>.from(json["booking"].map((x) => BookingElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "booking": List<dynamic>.from(booking.map((x) => x.toJson())),
    };
}

class BookingElement {
    BookingElement({
       required this.name,
       required this.uid,
       required this.path,
       required this.detail,
    });

    String name;
    String uid;
    String path;
    String detail;

    factory BookingElement.fromJson(Map<String, dynamic> json) => BookingElement(
        name: json["name"],
        uid: json["uid"],
        path: json["path"],
        detail: json["detail"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "path": path,
        "detail": detail,
    };
}
