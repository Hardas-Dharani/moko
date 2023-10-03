abstract class HomeRepository {
  Future<Map<String, dynamic>> getCategory();
  Future<Map<String, dynamic>> getChannelId(String channelId, String slugw);
  Future<Map<String, dynamic>> getDashBoard();
  Future<Map<String, dynamic>> getSearch(String serachName);
  Future<Map<String, dynamic>> getMovieDetail(String serachName);
}
