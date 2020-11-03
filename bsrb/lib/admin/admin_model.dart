class AdminModel {
  final String norek;
  final String password;
  final String nama;
  final String alamat;
  final String notel;

  AdminModel({
    this.norek,
    this.password,
    this.nama,
    this.alamat,
    this.notel,
  });

  factory AdminModel.formJson(Map<String, dynamic> json) {
    return new AdminModel(
        norek: json['norek'],
        password: json['password'],
        nama: json['nama'],
        alamat: json['alamat'],
        notel: json['notel']);
  }
}
