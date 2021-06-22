class Album {
  final int userId;
  final int id;
  final String title;

  Album(this.userId, this.id, this.title);

  Album.fromJson(Map<String, dynamic> json)
      : this.userId = json['userId'],
        this.id = json['id'],
        this.title = json['title'];
}
