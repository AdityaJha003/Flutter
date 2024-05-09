import 'package:bloc/bloc.dart';
import 'package:weatherapp/api/models/city_suggestiond_model.dart';
import 'package:weatherapp/api/weather_api.dart';
import 'package:weatherapp/bloc/suggestion_cities/suggestion_cities_state.dart';

class CitySuggestionCubit extends Cubit<CitySuggestionState> {
  final WeatherApi weatherApi = WeatherApi();

  CitySuggestionCubit() : super(CitySuggestionEmptyState());

  List<CityList> internalList = [];

  Future<void> setWeather(List<CityList> list) async {
    if (list.isEmpty) {
      emit(
        CitySuggestionErrorState(
          errorMessage: 'ERROR',
        ),
      );
    } else {
      emit(CitySuggestionEmptyState());
      final listCities = list;
      emit(CitySuggestionLoadedState(cityListModel: listCities));
      internalList = list;
    }
  }

  Future<List<CityList>> getSuggestionsCityList() async {
    return internalList;
  }
}
