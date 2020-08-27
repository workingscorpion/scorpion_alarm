class Env {
  // static final String baseUrl = isDev
  //     ? "http://localhost:8080/api/v1"
  //     : "http://localhost:8080/api/v1";

  static const bool isDev =
      String.fromEnvironment('dart.vm.product') == 'false';

  static const String protocol = isDev ? "http" : "https";
  static const String host = isDev ? "localhost" : "";
  static const int port = isDev ? 8080 : 443;

  static const String baseImageUrl =
      isDev ? "https://s3-address/" : "https://s3-address/";
}
