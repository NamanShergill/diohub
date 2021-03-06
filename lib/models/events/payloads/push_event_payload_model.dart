class PushEventPayloadModel {
  int pushId;
  int size;
  int distinctSize;
  String ref;
  String head;
  String before;
  List<Commits> commits;

  PushEventPayloadModel(
      {this.pushId,
      this.size,
      this.distinctSize,
      this.ref,
      this.head,
      this.before,
      this.commits});

  PushEventPayloadModel.fromJson(Map<String, dynamic> json) {
    pushId = json['push_id'];
    size = json['size'];
    distinctSize = json['distinct_size'];
    ref = json['ref'];
    head = json['head'];
    before = json['before'];
    if (json['commits'] != null) {
      // ignore: deprecated_member_use
      commits = new List<Commits>();
      json['commits'].forEach((v) {
        commits.add(new Commits.fromJson(v));
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
      data['commits'] = this.commits.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Commits {
  String sha;
  Author author;
  String message;
  bool distinct;
  String url;

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
      data['author'] = this.author.toJson();
    }
    data['message'] = this.message;
    data['distinct'] = this.distinct;
    data['url'] = this.url;
    return data;
  }
}

class Author {
  String email;
  String name;

  Author({this.email, this.name});

  Author.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    return data;
  }
}
