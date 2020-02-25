// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
    Gitinspector gitinspector;

    Client({
        this.gitinspector,
    });

    factory Client.fromJson(Map<String, dynamic> json) => Client(
        gitinspector: Gitinspector.fromJson(json["gitinspector"]),
    );

    Map<String, dynamic> toJson() => {
        "gitinspector": gitinspector.toJson(),
    };
}

class Gitinspector {
    ReportDate repository;
    ReportDate reportDate;
    Changes changes;

    Gitinspector({
        this.repository,
        this.reportDate,
        this.changes,
    });

    factory Gitinspector.fromJson(Map<String, dynamic> json) => Gitinspector(
        repository: ReportDate.fromJson(json["repository"]),
        reportDate: ReportDate.fromJson(json["report-date"]),
        changes: Changes.fromJson(json["changes"]),
    );

    Map<String, dynamic> toJson() => {
        "repository": repository.toJson(),
        "report-date": reportDate.toJson(),
        "changes": changes.toJson(),
    };
}

class Changes {
    ReportDate message;
    Authors authors;

    Changes({
        this.message,
        this.authors,
    });

    factory Changes.fromJson(Map<String, dynamic> json) => Changes(
        message: ReportDate.fromJson(json["message"]),
        authors: Authors.fromJson(json["authors"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "authors": authors.toJson(),
    };
}

class Authors {
    List<Author> author;

    Authors({
        this.author,
    });

    factory Authors.fromJson(Map<String, dynamic> json) => Authors(
        author: List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
    };
}

class Author {
    ReportDate name;
    ReportDate gravatar;
    Commits commits;
    Commits insertions;
    Commits deletions;
    Commits percentageOfChanges;

    Author({
        this.name,
        this.gravatar,
        this.commits,
        this.insertions,
        this.deletions,
        this.percentageOfChanges,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: ReportDate.fromJson(json["name"]),
        gravatar: ReportDate.fromJson(json["gravatar"]),
        commits: Commits.fromJson(json["commits"]),
        insertions: Commits.fromJson(json["insertions"]),
        deletions: Commits.fromJson(json["deletions"]),
        percentageOfChanges: Commits.fromJson(json["percentage-of-changes"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "gravatar": gravatar.toJson(),
        "commits": commits.toJson(),
        "insertions": insertions.toJson(),
        "deletions": deletions.toJson(),
        "percentage-of-changes": percentageOfChanges.toJson(),
    };
}

class Commits {
    double empty;

    Commits({
        this.empty,
    });

    factory Commits.fromJson(Map<String, dynamic> json) => Commits(
        empty: json["\u0024"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "\u0024": empty,
    };
}

class ReportDate {
    String empty;

    ReportDate({
        this.empty,
    });

    factory ReportDate.fromJson(Map<String, dynamic> json) => ReportDate(
        empty: json["\u0024"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024": empty,
    };
}
