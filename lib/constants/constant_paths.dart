


class ConstantPath
{
  static const String assetpath = 'assets/';
  static const String baseurl = "https://moachingtestapi.azurewebsites.net/";

  static String getPath(String path) {
    return assetpath+path;
  }

}