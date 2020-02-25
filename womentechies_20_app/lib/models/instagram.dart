// To parse this JSON data, do
//
//     final instagram = instagramFromJson(jsonString);

import 'dart:convert';

Instagram instagramFromJson(String str) => Instagram.fromJson(json.decode(str));

String instagramToJson(Instagram data) => json.encode(data.toJson());

class Instagram {
    List<Datum> data;

    Instagram({
        this.data,
    });

    factory Instagram.fromJson(Map<String, dynamic> json) => Instagram(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String permalink;
    String caption;
    int commentsCount;
    int likeCount;
    String mediaType;
    String mediaUrl;
    String id;

    Datum({
        this.permalink,
        this.caption,
        this.commentsCount,
        this.likeCount,
        this.mediaType,
        this.mediaUrl,
        this.id,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        permalink: json["permalink"],
        caption: json["caption"],
        commentsCount: json["comments_count"],
        likeCount: json["like_count"],
        mediaType: json["media_type"],
        mediaUrl: json["media_url"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "permalink": permalink,
        "caption": caption,
        "comments_count": commentsCount,
        "like_count": likeCount,
        "media_type": mediaType,
        "media_url": mediaUrl,
        "id": id,
    };
}
