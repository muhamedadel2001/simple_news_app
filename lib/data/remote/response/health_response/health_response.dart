class HealthResponse {
  HealthResponse({
    String? status,
    num? totalResults,
    List<HealthArticles>? articles,
  }) {
    _status = status;
    _totalResults = totalResults;
    _articles = articles;
  }

  HealthResponse.fromJson(dynamic json) {
    _status = json['status'];
    _totalResults = json['totalResults'];
    if (json['articles'] != null) {
      _articles = [];
      json['articles'].forEach((v) {
        _articles?.add(HealthArticles.fromJson(v));
      });
    }
  }
  String? _status;
  num? _totalResults;
  List<HealthArticles>? _articles;

  String get status => _status ?? '';
  num get totalResults => _totalResults ?? 0;
  List<HealthArticles> get articles => _articles ?? [];
}

class HealthArticles {
  HealthArticles({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
  }

  HealthArticles.fromJson(dynamic json) {
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
    _content = json['content'];
  }

  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;

  String get author => _author ?? '';
  String get title => _title ?? '';
  String get description => _description ?? '';
  String get url => _url ?? '';
  String get urlToImage => _urlToImage ?? '';
  String get publishedAt => _publishedAt ?? '';
  String get content => _content ?? '';
}
