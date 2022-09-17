class RandomImage {
  final String message;
  final String status;

  RandomImage({
    required this.message,
    required this.status,
  });

  factory RandomImage.fromJson(Map<String, dynamic> json) {
    return RandomImage(
      message: json['message'],
      status: json['status'],
    );
  }
}
