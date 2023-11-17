abstract class HomeStates{}

class PageInitialState extends HomeStates{}
class PageChangeState extends HomeStates{
  int index = 0;
  PageChangeState(this.index);
}
