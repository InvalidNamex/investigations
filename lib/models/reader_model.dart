class ReaderModel {
  final String readerName;
  final int tabNo;
  final int? investigations;
  final int? penalties;
  final int? phoneNo;
  final String? joinDate;
  final String? leaveDate;
  final String? image;

  const ReaderModel(
      {required this.readerName, required this.tabNo, this.investigations, this.penalties, this.phoneNo, this.joinDate, this.leaveDate, this.image});

  static ReaderModel fromJson(Map<String, dynamic> json) => ReaderModel(
      readerName: json['readerName'] as String,
      tabNo: json['tabNo'] as int,
      investigations: json['investigations'] as int?,
      penalties: json['penalties'] as int?,
      phoneNo: json['phoneNo'] as int?,
      image: json['image'] as String?,
    joinDate: json['joinDate'] as String?,
    leaveDate: json['leaveDate'] as String?,
  );

// THIS IS ONLY FOR REFERENCE OF HOW TO POST DATA FROM MODEL
Map<String, dynamic> toJson()=> {
  'readerName': readerName,
  'tabNo': tabNo,
  'investigations': investigations,
  'penalties': penalties,
  'phoneNo': phoneNo,
  'image': image,
  'joinDate': joinDate,
  'leaveDate': leaveDate,
};
}
