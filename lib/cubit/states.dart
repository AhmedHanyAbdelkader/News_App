abstract class NewsStates{}

class NewsInitialState extends NewsStates{}


class NewsBottomNavState extends NewsStates{}
      // Business States
class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  NewsGetBusinessErrorState(this.e);
  final e;
}

      // Sports States
class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{
  NewsGetSportsErrorState(this.e);
  final e;
}

      // Science States
class NewsGetScienceLoadingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{
  NewsGetScienceErrorState(this.e);
  final e;
}



// Search States
class NewsGetSearchLoadingState extends NewsStates{}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  NewsGetSearchErrorState(this.e);
  final e;
}













class AppChangeModeState extends NewsStates{}


///////////////////////////////////

abstract class NewsModeStates {}
class NewsModeInitialState extends NewsModeStates{}
class NewsModeChangeState extends NewsModeStates{}