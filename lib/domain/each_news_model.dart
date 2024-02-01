class EachNewsModel {
  bool? status;
  Blog? blog;

  EachNewsModel({this.status, this.blog});

  EachNewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    blog = json['blog'] != null ? Blog.fromJson(json['blog']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (blog != null) {
      data['blog'] = blog!.toJson();
    }
    return data;
  }
}

class Blog {
  int? id;
  String? createdAt;
  String? image;
  String? title;
  String? content;
  int? category;

  Blog(
      {this.id,
      this.createdAt,
      this.image,
      this.title,
      this.content,
      this.category});

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    image = json['image'];
    title = json['title'];
    content = json['content'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['created_at'] = createdAt;
    data['image'] = image;
    data['title'] = title;
    data['content'] = content;
    data['category'] = category;
    return data;
  }
}
