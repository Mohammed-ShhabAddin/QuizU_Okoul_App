abstract class ApiConsumer {
  Future get(String path, {Map<String, dynamic>? queryParameters});
  Future post(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters});

  Future put(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters});
}
