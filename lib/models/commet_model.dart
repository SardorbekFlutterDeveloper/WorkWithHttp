
class CommetModel {
    CommetModel({
        this.postId,
        this.id,
        this.name,
        this.email,
        this.body,
    });

    int? postId;
    int? id;
    String? name;
    String? email;
    String? body;

    factory CommetModel.fromJson(Map<String, dynamic> json) => CommetModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}
