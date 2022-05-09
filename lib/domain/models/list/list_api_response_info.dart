class ListApiResponseInfoModel {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  ListApiResponseInfoModel({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });
}
