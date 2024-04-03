

class NativeItem {
  String? id;
  Record? record;
  Metadata? metadata;

  NativeItem({this.id, this.record, this.metadata});

  NativeItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    record =
    json['record'] != null ? new Record.fromJson(json['record']) : null;
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.record != null) {
      data['record'] = this.record!.toJson();
    }
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    return data;
  }
}

class Record {
  List<Items>? items;

  Record({this.items});

  Record.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? title;
  String? icon;
  String? uRL;
  int? id;

  Items({this.title, this.icon, this.uRL, this.id});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    uRL = json['URL'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['URL'] = this.uRL;
    data['id'] = this.id;
    return data;
  }
}

class Metadata {
  String? name;
  int? readCountRemaining;
  int? timeToExpire;
  String? createdAt;

  Metadata(
      {this.name, this.readCountRemaining, this.timeToExpire, this.createdAt});

  Metadata.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    readCountRemaining = json['readCountRemaining'];
    timeToExpire = json['timeToExpire'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['readCountRemaining'] = this.readCountRemaining;
    data['timeToExpire'] = this.timeToExpire;
    data['createdAt'] = this.createdAt;
    return data;
  }
}