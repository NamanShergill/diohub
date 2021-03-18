// Todo: Redo Model. Ref: https://app.quicktype.io/

import 'dart:convert';

class EventsModel {
  String? id;
  EventsType? type;
  Actor? actor;
  Repo? repo;
  Map? payload;
  bool? public;
  String? createdAt;

  EventsModel(
      {this.id,
      this.type,
      this.actor,
      this.repo,
      this.payload,
      this.public,
      this.createdAt});

  // Todo: Add more event types.
  EventsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    String? eventType = json['type'];
    if (eventType == 'CreateEvent')
      type = EventsType.CreateEvent;
    else if (eventType == 'DeleteEvent')
      type = EventsType.DeleteEvent;
    else if (eventType == 'ForkEvent')
      type = EventsType.ForkEvent;
    else if (eventType == 'GollumEvent')
      type = EventsType.GollumEvent;
    else if (eventType == 'IssueCommentEvent')
      type = EventsType.IssueCommentEvent;
    else if (eventType == 'IssuesEvent')
      type = EventsType.IssuesEvent;
    else if (eventType == 'MemberEvent')
      type = EventsType.MemberEvent;
    else if (eventType == 'PublicEvent')
      type = EventsType.PublicEvent;
    else if (eventType == 'PullRequestEvent')
      type = EventsType.PullRequestEvent;
    else if (eventType == 'PullRequestReviewCommentEvent')
      type = EventsType.PullRequestReviewCommentEvent;
    else if (eventType == 'PushEvent')
      type = EventsType.PushEvent;
    else if (eventType == 'ReleaseEvent')
      type = EventsType.ReleaseEvent;
    else if (eventType == 'SponsorshipEvent')
      type = EventsType.SponsorshipEvent;
    else if (eventType == 'WatchEvent')
      type = EventsType.WatchEvent;
    else
      type = EventsType.Undefined;

    actor = json['actor'] != null ? new Actor.fromJson(json['actor']) : null;
    repo = json['repo'] != null ? new Repo.fromJson(json['repo']) : null;
    payload = json['payload'] != null ? json['payload'] : null;
    public = json['public'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.actor != null) {
      data['actor'] = this.actor!.toJson();
    }
    if (this.repo != null) {
      data['repo'] = this.repo!.toJson();
    }
    if (this.payload != null) {
      data['payload'] = this.payload;
    }
    data['public'] = this.public;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Actor {
  int? id;
  String? login;
  String? displayLogin;
  String? gravatarId;
  String? url;
  String? avatarUrl;

  Actor(
      {this.id,
      this.login,
      this.displayLogin,
      this.gravatarId,
      this.url,
      this.avatarUrl});

  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    displayLogin = json['display_login'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['display_login'] = this.displayLogin;
    data['gravatar_id'] = this.gravatarId;
    data['url'] = this.url;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}

class Repo {
  int? id;
  String? name;
  String? url;

  Repo({this.id, this.name, this.url});

  Repo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

// Todo: Handle cases for different types of payloads.
class Payload {
  int? pushId;
  int? size;
  int? distinctSize;
  String? ref;
  String? head;
  String? before;
  List<Commits>? commits;

  Payload(
      {this.pushId,
      this.size,
      this.distinctSize,
      this.ref,
      this.head,
      this.before,
      this.commits});

  Payload.fromJson(Map<String, dynamic> json) {
    pushId = json['push_id'];
    size = json['size'];
    distinctSize = json['distinct_size'];
    ref = json['ref'];
    head = json['head'];
    before = json['before'];
    if (json['commits'] != null) {
      // ignore: deprecated_member_use
      commits = <Commits>[];
      json['commits'].forEach((v) {
        commits!.add(new Commits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['push_id'] = this.pushId;
    data['size'] = this.size;
    data['distinct_size'] = this.distinctSize;
    data['ref'] = this.ref;
    data['head'] = this.head;
    data['before'] = this.before;
    if (this.commits != null) {
      data['commits'] = this.commits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Commits {
  String? sha;
  Author? author;
  String? message;
  bool? distinct;
  String? url;

  Commits({this.sha, this.author, this.message, this.distinct, this.url});

  Commits.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    message = json['message'];
    distinct = json['distinct'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sha'] = this.sha;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['message'] = this.message;
    data['distinct'] = this.distinct;
    data['url'] = this.url;
    return data;
  }
}

class Author {
  Author({
    this.name,
    this.email,
    this.date,
  });

  String? name;
  String? email;
  DateTime? date;

  Author copyWith({
    String? name,
    String? email,
    DateTime? date,
  }) =>
      Author(
        name: name ?? this.name,
        email: email ?? this.email,
        date: date ?? this.date,
      );

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "date": date == null ? null : date!.toIso8601String(),
      };
}

// Ref: https://docs.github.com/en/developers/webhooks-and-events/github-event-types
enum EventsType {
  CommitCommentEvent,
  CreateEvent,
  DeleteEvent,
  ForkEvent,
  GollumEvent,
  IssueCommentEvent,
  IssuesEvent,
  MemberEvent,
  PublicEvent,
  PullRequestEvent,
  PullRequestReviewCommentEvent,
  PushEvent,
  ReleaseEvent,
  SponsorshipEvent,
  WatchEvent,
  Undefined
}
