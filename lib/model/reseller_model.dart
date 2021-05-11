class ResellerModel {
  final int id;
  final String name;
  final String email;
  final String profit;
  final String imgUrl;
  final String dateCreated;
  final String gender;
  final String phoneNumber;
  final String identityNumber;
  final String bankName;
  final String bankAccountNumber;
  final String bankUser;
  final String profuctSells;
  final String discount;
  final String codeDiscount;
  String instagram;
  String youtube;
  String tiktok;
  bool isValidate;

  ResellerModel({
    this.id,
    this.name,
    this.email,
    this.profit,
    this.imgUrl,
    this.dateCreated,
    this.gender,
    this.phoneNumber,
    this.identityNumber,
    this.bankName,
    this.bankAccountNumber,
    this.bankUser,
    this.instagram,
    this.tiktok,
    this.youtube,
    this.isValidate,
    this.codeDiscount,
    this.discount,
    this.profuctSells,
  });

  // ResellerModel({
  //   this.id,
  //   this.name,
  //   this.email,
  //   this.profit,
  //   this.imgUrl,
  //   this.isValidate,
  // });
}

var resellerMomentumModel = [
  ResellerModel(
    id: 0,
    name: "Nivada Mayang C",
    email: "nivadamayang@gmail.com",
    profit: "50.000.000",
    profuctSells: "512",
    codeDiscount: "MMTNIVADA",
    discount: "15",
    imgUrl:
        "https://images.pexels.com/photos/6707077/pexels-photo-6707077.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    isValidate: false,
    dateCreated: "12 April 2020",
    gender: "Perempuan",
    phoneNumber: "082142135122",
    identityNumber: "412662416666123",
    bankName: "BCA",
    bankAccountNumber: "8781912051",
    bankUser: "Nivada Mayang Canasta",
    instagram: "@NivadaStore",
    youtube: "Nivada Store",
    tiktok: "NVDStore",
  ),
  ResellerModel(
    id: 1,
    name: "Andromeda Feryl",
    email: "andromedaferyl@gmail.com",
    profit: "5.312.000",
    profuctSells: "80",
    codeDiscount: "MMTFERLY",
    discount: "15",
    imgUrl:
        "https://images.pexels.com/photos/3671217/pexels-photo-3671217.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    isValidate: false,
    dateCreated: "13 April 2020",
    gender: "Perempuan",
    phoneNumber: "082142135122",
    identityNumber: "412662416666123",
    bankName: "BCA",
    bankAccountNumber: "8781912051",
    bankUser: "Andromeda Feryl",
    instagram: "@FERYL_STORE",
    youtube: "Feryl Store",
    tiktok: "FerylStore",
  ),
  ResellerModel(
    id: 2,
    name: "Yuki",
    email: "Yuki@gmail.com",
    profit: "50.987.000",
    profuctSells: "234",
    codeDiscount: "MMTYUKI",
    discount: "15",
    imgUrl:
        "https://images.pexels.com/photos/4101146/pexels-photo-4101146.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    isValidate: true,
    dateCreated: "19 April 20220",
    gender: "Laki Laki",
    phoneNumber: "082142135122",
    identityNumber: "412662416666123",
    bankName: "BCA",
    bankAccountNumber: "8781912051",
    bankUser: "Yuki Canasta",
    instagram: "@YukiStore",
    youtube: "Yuki Store",
    tiktok: "YukiStore",
  ),
  ResellerModel(
    id: 3,
    name: "Nikita Sari",
    email: "Nikita Sari@gmail.com",
    profit: "90.000.000",
    profuctSells: "269",
    codeDiscount: "MMTNIKI",
    discount: "15",
    imgUrl:
        "https://images.pexels.com/photos/1547971/pexels-photo-1547971.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    isValidate: true,
    dateCreated: "29 April 20220",
    gender: "Perempuan",
    phoneNumber: "082142135122",
    identityNumber: "412662416666123",
    bankName: "BCA",
    bankAccountNumber: "8781912051",
    bankUser: "Nikita Sari",
    instagram: "@NikiStore",
    youtube: "Niki Store",
    tiktok: "NikiStore",
  ),
];
