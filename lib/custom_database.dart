class TabunganModel {
  int tabungan_id;
  String user_email;
  String nama_tabungan;
  String keterangan;
  int target_tabungan;
  String status;
  String dibuat;
  int biaya_terkumpul;
  String gambar;
  String rencana;
  int nominal_pengisian;

  TabunganModel(
      {required this.tabungan_id,
      required this.user_email,
      required this.nama_tabungan,
      required this.keterangan,
      required this.target_tabungan,
      required this.status,
      required this.dibuat,
      required this.biaya_terkumpul,
      required this.gambar,
      required this.rencana,
      required this.nominal_pengisian});
}
