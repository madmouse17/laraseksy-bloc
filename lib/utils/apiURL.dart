class ApiURL {
  //rumah http://192.168.1.108:8888
  static const String baseURL = 'http://192.168.1.108:8000/api';
  // static const String baseAuthURL = '$baseURL/auth';
  //guest
  static const String login = '$baseURL/login';

  //auth
  static const String jadwal = '/auth/jadwal';
  static const String pengumuman = '/auth/pengumuman';
  static const String siswaDetails = '/auth/detailsiswa';
  static const String cekImagePoint = '/auth/cekimagepoint';
}
