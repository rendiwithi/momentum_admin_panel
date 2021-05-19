class StatusModel {
  final int id;
  String code;
  String time;
  List<ItemModel> item;

  StatusModel({
    this.id,
    this.code,
    this.time,
    this.item,
  });
}

class ItemModel {
  final int id;
  String name;
  String total;

  ItemModel({
    this.id,
    this.name,
    this.total,
  });
}

var paidItem = [
  StatusModel(
    id: 0,
    code: "AC9885120098",
    time: "24 Jun 2020 , 10:00",
    item: [
      ItemModel(
        id: 0,
        name: "Belia Maybelline Hypercurl Volum Express",
        total: "10",
      ),
      ItemModel(
        id: 1,
        name: "Belia Maybelline Hypercurl Volum Express",
        total: "10",
      ),
    ],
  ),
  StatusModel(
    id: 1,
    code: "AC9885120099",
    time: "24 Agu 2020 , 10:00",
    item: [
      ItemModel(
        id: 0,
        name: "Belia Maybelline Hypercurl Volum Express",
        total: "10",
      ),
      ItemModel(
        id: 1,
        name: "Belia Maybelline Hypercurl Volum Express",
        total: "10",
      ),
    ],
  ),
];

var waitingItem = [
  StatusModel(
    id: 0,
    code: "AC9885120198",
    time: "24 Jun 2020 , 10:00",
    item: [
      ItemModel(
        id: 0,
        name: "Maybelline Hypercurl Volum Express",
        total: "100",
      ),
      ItemModel(
        id: 1,
        name: "Belia Maybelline Volum Express",
        total: "109",
      ),
    ],
  ),
  StatusModel(
    id: 1,
    code: "AC9885120199",
    time: "24 Agu 2020 , 10:00",
    item: [
      ItemModel(
        id: 0,
        name: "Belia Maybelline Hypercurl Volum ",
        total: "120",
      ),
      ItemModel(
        id: 1,
        name: "Belia Maybelline Hypercurl Express",
        total: "130",
      ),
    ],
  ),
];

var expiredItem = [
  StatusModel(
    id: 0,
    code: "AC9885120998",
    time: "24 Jun 2020 , 10:00",
    item: [
      ItemModel(
        id: 0,
        name: "Maybelline Hypercurl Volum Express",
        total: "100",
      ),
      ItemModel(
        id: 1,
        name: "Belia Maybelline Express",
        total: "209",
      ),
    ],
  ),
  StatusModel(
    id: 1,
    code: "AC9885120999",
    time: "24 Agu 2020 , 10:00",
    item: [
      ItemModel(
        id: 0,
        name: "Belia Maybelline Hypercurl",
        total: "820",
      ),
      ItemModel(
        id: 1,
        name: "Belia Maybelline Hypercurl Express",
        total: "130",
      ),
    ],
  ),
  StatusModel(
    id: 0,
    code: "AC9885120998",
    time: "24 Jun 2020 , 10:00",
    item: [
      ItemModel(
        id: 0,
        name: "Maybelline Hypercurl Volum Express",
        total: "100",
      ),
      ItemModel(
        id: 1,
        name: "Belia Maybelline Express",
        total: "209",
      ),
    ],
  ),
  StatusModel(
    id: 1,
    code: "AC9885120999",
    time: "24 Agu 2020 , 10:00",
    item: [
      ItemModel(
        id: 0,
        name: "Belia Maybelline Hypercurl",
        total: "820",
      ),
      ItemModel(
        id: 1,
        name: "Belia Maybelline Hypercurl Express",
        total: "130",
      ),
    ],
  ),
  StatusModel(
    id: 0,
    code: "AC9885120998",
    time: "24 Jun 2020 , 10:00",
    item: [
      ItemModel(
        id: 0,
        name: "Maybelline Hypercurl Volum Express",
        total: "100",
      ),
      ItemModel(
        id: 1,
        name: "Belia Maybelline Express",
        total: "209",
      ),
    ],
  ),
  StatusModel(
    id: 1,
    code: "AC9885120999",
    time: "24 Agu 2020 , 10:00",
    item: [
      ItemModel(
        id: 0,
        name: "Belia Maybelline Hypercurl",
        total: "820",
      ),
      ItemModel(
        id: 1,
        name: "Belia Maybelline Hypercurl Express",
        total: "130",
      ),
    ],
  ),
  StatusModel(
    id: 0,
    code: "AC9885120998",
    time: "24 Jun 2020 , 10:00",
    item: [
      ItemModel(
        id: 0,
        name: "Maybelline Hypercurl Volum Express",
        total: "100",
      ),
      ItemModel(
        id: 1,
        name: "Belia Maybelline Express",
        total: "209",
      ),
    ],
  ),
  StatusModel(
    id: 1,
    code: "AC9885120999",
    time: "24 Agu 2020 , 10:00",
    item: [
      ItemModel(
        id: 0,
        name: "Belia Maybelline Hypercurl",
        total: "820",
      ),
      ItemModel(
        id: 1,
        name: "Belia Maybelline Hypercurl Express",
        total: "130",
      ),
    ],
  ),
];
