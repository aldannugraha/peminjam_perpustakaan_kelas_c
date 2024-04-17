class Endpoint {
  static const String baseUrlApi = "http://192.168.6.27:8000/api/v1/user/";
  static const String baseUrlApiptg = "https://192.168.6.27:8000//api/v1/petugas/";
  static const String image = "http://192.168.6.27:8000/images/";

  // page user

  static const String login = "${baseUrlApi}login";
  static const String register = "${baseUrlApi}register";
  static const String book = "${baseUrlApi}book";
  static const String addbook = "${baseUrlApi}addbook";
  static const String pinjam = "${baseUrlApi}pinjam";
  static const String imagesBaseUrl = "http://192.168.6.27:8000/images/";

  // page petugas

  static const String loginptg = "${baseUrlApiptg}login";
  static const String bookptg = "${baseUrlApiptg}book";
  static const String pinjamptg = "${baseUrlApiptg}pinjam";
}
