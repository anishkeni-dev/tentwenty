abstract class AppBarEvents{}

class SearchButtonClickEvent extends AppBarEvents {}

class StartSearchEvent extends AppBarEvents{
   String searchInput = "";

   StartSearchEvent(this.searchInput);
}
class AppBarSearchCloseEvent extends AppBarEvents{}

