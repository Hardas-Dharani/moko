abstract class ContentCreatorRepository {
  Future<Map<String, dynamic>> addPlayList(Map<String, dynamic> jsonParser);
  Future<Map<String, dynamic>> channelPlayList();
  Future<Map<String, dynamic>> myPlayList();
  Future<Map<String, dynamic>> deleteVideo(String slug);
  Future<Map<String, dynamic>> myChannel();
  Future<Map<String, dynamic>> updateChannel(Map<String, dynamic> jsonParser);
  Future<Map<String, dynamic>> updateVideos(
      Map<String, dynamic> jsonParser, String slug);
  Future<Map<String, dynamic>> uploadVideos(Map<String, dynamic> jsonParser);
  Future<Map<String, dynamic>> videoDetail(String slug);
  Future<Map<String, dynamic>> videoLst();
}
