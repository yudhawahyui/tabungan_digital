class TabunganListModel {
  String record_id;
  String tabungan_id;
  int nominal;
  String keterangan;
  String status;
  String tanggal;
  String docId;
  String validator;

  TabunganListModel(
      {required this.record_id,
      required this.tabungan_id,
      required this.nominal,
      required this.keterangan,
      required this.status,
      required this.docId,
      required this.tanggal,
      required this.validator});
}
