import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  // Keys for SharedPreferences
  // static const String _publicIpKey = 'ip_public';
  // static const String _localPortKey = 'port_local';
  // static const String _publicPortKey = 'port_public';
  // static const String _songCacheKey = 'song_paths';

  static late SharedPreferences _prefs;

  static final Settings _instance = Settings._internal();

  factory Settings() => _instance;

  Settings._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // int get localPort => _prefs.getInt(_localPortKey) ?? 8000;
  //
  // set localPort(int port) {
  //   _prefs.setInt(_localPortKey, port);
  // }
  //
  // String get publicIP => _prefs.getString(_publicIpKey) ?? '2.184.54.221';
  //
  // set publicIP(String ip) {
  //   _prefs.setString(_publicIpKey, ip);
  // }
  //
  // int get publicPort => _prefs.getInt(_publicPortKey) ?? 900;
  //
  // set publicPort(int port) {
  //   _prefs.setInt(_publicPortKey, port);
  // }
  //
  // String get ip => ipMode ? localIP : publicIP;
  //
  // set ip(String ip) {
  //   if (ipMode) {
  //     localIP = ip;
  //   } else {
  //     publicIP = ip;
  //   }
  // }
  //
  // int get port => ipMode ? localPort : publicPort;
  //
  // set port(int port) {
  //   if (ipMode) {
  //     localPort = port;
  //   } else {
  //     publicPort = port;
  //   }
  // }
  //
  // List<String> get loadSongsPaths => _prefs.getStringList(_songCacheKey) ?? [];
  //
  // set saveSongs(Iterable<String> songsPath) {
  //   _prefs.setStringList(_songCacheKey, songsPath.toList());
  // }
  //
  // // Clear all preferences
  // Future<void> clear() async {
  //   await _prefs.clear();
  // }
  //
  // void clearSongs() {
  //   _prefs.remove(_songCacheKey);
  // }
}
