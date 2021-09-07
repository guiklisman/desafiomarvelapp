class HeroiModel {
  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceURI;
  Comics? comics;
  Comics? series;
  Comics? stories;
  Comics? events;
  List<Urls>? urls;

  HeroiModel(
      {required this.id,
        required this.name,
        required this.description,
        required this.modified,
        required this.thumbnail,
        required this.resourceURI,
        required this.comics,
        required this.series,
        required this.stories,
        required this.events,
        required this.urls});

  HeroiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = (json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null)!;
    resourceURI = json['resourceURI'];
    comics =
    (json['comics'] != null ? new Comics.fromJson(json['comics']) : null)!;
    series =
    (json['series'] != null ? new Comics.fromJson(json['series']) : null)!;
    stories =
    (json['stories'] != null ? new Comics.fromJson(json['stories']) : null)!;
    events =
    (json['events'] != null ? new Comics.fromJson(json['events']) : null)!;
    if (json['urls'] != null) {
      urls = <Urls>[];
      json['urls'].forEach((v) {
        urls!.add(new Urls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['modified'] = this.modified;
    data['thumbnail'] = this.thumbnail!.toJson();
    data['resourceURI'] = this.resourceURI;
    data['comics'] = this.comics!.toJson();
    data['series'] = this.series!.toJson();
    data['stories'] = this.stories!.toJson();
    data['events'] = this.events!.toJson();
    data['urls'] = this.urls!.map((v) => v.toJson()).toList();
    return data;
  }
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({required this.path, required this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['extension'] = this.extension;
    return data;
  }
}

class Comics {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  Comics({required this.available, required this.collectionURI, this.items, required this.returned});

  Comics.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['collectionURI'] = this.collectionURI;
    data['items'] = this.items!.map((v) => v.toJson()).toList();
    data['returned'] = this.returned;
    return data;
  }
}

class Items {
  String? resourceURI;
  String? name;

  Items({required this.resourceURI, required this.name});

  Items.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceURI'] = this.resourceURI;
    data['name'] = this.name;
    return data;
  }
}


class Urls {
  String? type;
  String? url;

  Urls({this.type, this.url});

  Urls.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}