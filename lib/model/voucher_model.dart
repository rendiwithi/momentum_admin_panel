class VoucherModel {
  final int id;
  final int nominal;
  final String name;
  final String claim;
  final String start;
  final String end;
  final String desc;
  bool isValidation;  


  VoucherModel({
    this.id,
    this.nominal,
    this.name,
    this.claim,
    this.start,
    this.end,
    this.desc,
    this.isValidation,
  });
}

var voucher = [
  VoucherModel(
    id: 0,
    name: "Voucher Discount 30%",
    desc: "Voucher potongan 30% untuk semua pengguna baru produk momentum apps",
    start: "7 April 2021",
    end: "8 April 2021",
    claim: "Diklaim sebanyak : 6.512x",
    isValidation: true,
  ),
  VoucherModel(
    id: 1,
    name: "Voucher Discount 40%",
    desc: "Voucher potongan 40% untuk semua pengguna baru produk momentum apps",
    start: "9 April 2021",
    end: "10 April 2021",
    claim: "Diklaim sebanyak : 6.513x",
    isValidation: false,
  ),
  VoucherModel(
    id: 2,
    name: "Voucher Discount 50%",
    desc: "Voucher potongan 50% untuk semua pengguna baru produk momentum apps",
    start: "17 April 2021",
    end: "18 April 2021",
    claim: "Diklaim sebanyak : 6.514x",
    isValidation: true,
  ),
  VoucherModel(
    id: 3,
    name: "Momentum New Product",
    desc: "Voucher potongan 55% untuk semua pengguna baru produk momentum apps",
    start: "20 April 2021",
    end: "21 April 2021",
    claim: "Diklaim sebanyak : 100.512x",
    isValidation: true,
  ),
];