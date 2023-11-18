import 'package:tentwenty/Model/MovieList.dart';

abstract class AppBarStates{}

class AppBarInitialState extends AppBarStates{}
class AppBarSearchActiveState extends AppBarStates{}
class SearchingForResultsState extends AppBarStates{

}
class AppBarSearchInActiveState extends AppBarStates{}
class SearchResultsLoadedState extends AppBarStates{
  List searchData = [];
  SearchResultsLoadedState(this.searchData);
}