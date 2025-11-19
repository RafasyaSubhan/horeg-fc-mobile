import 'dart:convert';

List<ProductEntry> ProductEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));
String ProductEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String model;
    String pk;
    Fields fields;

    ProductEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String user;
    String name;
    int price;
    String description;
    String thumbnail;
    String category;
    bool isFeatured;
    DateTime dateTime;
    int viewers;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.thumbnail,
        required this.category,
        required this.isFeatured,
        required this.dateTime,
        required this.viewers,
    });

    factory Fields.fromJson(Map<String, dynamic> json) {
        String userVal;
        
        // Cek apakah Django mengirim List ["username"]
        if (json["user"] is List && (json["user"] as List).isNotEmpty) {
            userVal = json["user"][0].toString();
        } 
        // Cek apakah Django mengirim ID (int)
        else if (json["user"] is int) {
            userVal = json["user"].toString();
        } 
        // Default jika string biasa
        else {
            userVal = json["user"].toString();
        }

        return Fields(
            user: userVal, // Gunakan hasil parsing di atas
            name: json["name"],
            price: json["price"],
            description: json["description"],
            // Tambahkan handle null safety untuk thumbnail jika kosong
            thumbnail: json["thumbnail"] ?? "", 
            category: json["category"],
            isFeatured: json["is_featured"],
            dateTime: DateTime.parse(json["date_time"]),
            // Tambahkan handle null safety untuk viewers
            viewers: json["viewers"] ?? 0, 
        );
    }

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "is_featured": isFeatured,
        "date_time": dateTime.toIso8601String(),
        "viewers": viewers,
    };
}
