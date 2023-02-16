import 'package:flutter_clean_architecture/src/data/model/models.dart';

CollectionDataModel createCollection = const CollectionDataModel(
  id: 1,
  name: 'Name',
  posterPath: '',
  backdropPath: '',
);

CompanyDataModel createCompany = const CompanyDataModel(
  id: 1,
  name: 'Name',
  logoPath: '',
  originalCountry: '',
);

CountryDataModel createCountry = const CountryDataModel(
  name: 'Name',
  code: 'n',
);

GenreDataModel createGenre = const GenreDataModel(
  id: 1,
  name: 'Fantasy',
);

LanguageDataModel createLanguage = const LanguageDataModel(
  name: 'En',
  countryCode: 'en',
  engName: 'Name',
);