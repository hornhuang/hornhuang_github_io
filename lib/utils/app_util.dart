
class AppUtil {
  static String _assetsImageBaseURL = "assets/images/";

  static String getImageAssets(String path) {
    return _assetsImageBaseURL + path;
  }
}