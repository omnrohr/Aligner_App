class AlignerUser {
  final String id;
  final String fName;
  final String lName;
  final String imageUrl;

  const AlignerUser(
      {required this.id,
      required this.fName,
      required this.lName,
      required this.imageUrl});
}

const users = [
  userGordon,
  userSalvatore,
  userSacha,
  userDeven,
  userSahil,
  userReuben,
  userNash,
];

const userGordon = AlignerUser(
  id: 'gordon',
  fName: 'Gordon',
  lName: 'Hayes',
  imageUrl:
      'https://th.bing.com/th/id/R.5c5d7914159627405da800c8caef7b3a?rik=DzbsnfgDErRNdA&riu=http%3a%2f%2ftravelslebanon.weebly.com%2fuploads%2f2%2f7%2f1%2f6%2f27166575%2f786855_orig.jpg&ehk=OU9IIrH65SMhsavcbyNO4oYDj6WpFmqslXV%2f0kL0gu0%3d&risl=&pid=ImgRaw&r=0',
);

const userSalvatore = AlignerUser(
  id: 'salvatore',
  fName: 'Salvatore',
  lName: 'Giordano',
  imageUrl: 'https://64.media.tumblr.com/avatar_ccb5bc104e67_128.pnj',
);

const userSacha = AlignerUser(
  id: 'sacha',
  fName: 'Sacha',
  lName: 'Arbonel',
  imageUrl:
      'https://th.bing.com/th/id/R.b9f0ee1f8a77fa18ea1860668dba3676?rik=6XozqcU%2foHsLKA&riu=http%3a%2f%2fcdn2.stylecraze.com%2fwp-content%2fuploads%2f2013%2f06%2fTop-10-Most-Beautiful-Japanese-Women-150x150.jpg&ehk=jUR8cM1NKAIkKcDV5OMK2WaBqsrXdavephDA%2bBXhDWs%3d&risl=&pid=ImgRaw&r=0',
);

const userDeven = AlignerUser(
  id: 'deven',
  fName: 'Deven',
  lName: 'Joshi',
  imageUrl:
      'https://cdn3.peopleimages.com/DATA/models/1391/stock-photo-model-simone-dk-6580-box_175_175.jpg',
);

const userSahil = AlignerUser(
  id: 'sahil',
  fName: 'Sahil',
  lName: 'Kumar',
  imageUrl: 'https://www.carexm.com/wp-content/uploads/2020/06/nurses.png',
);

const userReuben = AlignerUser(
  id: 'reuben',
  fName: 'Reuben',
  lName: 'Turner',
  imageUrl:
      'https://th.bing.com/th/id/OIP._g8WmfW3zclUPqNA4YFp5gAAAA?pid=ImgDet&rs=1',
);

const userNash = AlignerUser(
  id: 'nash',
  fName: 'Nash',
  lName: 'Ramdial',
  imageUrl:
      'https://www.pflegekraft-consulting.at/wp-content/uploads/2018/06/shutterstock_582891865_1000x1000-300x300.jpg',
);
