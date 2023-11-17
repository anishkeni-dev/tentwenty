abstract class HomeEvents{}

class BottomNavClickEvent extends HomeEvents{
  int selectedIndex = 0;

  BottomNavClickEvent(this.selectedIndex);
}