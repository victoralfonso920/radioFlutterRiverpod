

import 'resources/img_routes.dart';

String getImageAssets(String name){
  switch(name.toLowerCase()){
    case "super":
      return logoRadioSuper;
      case "abc":
      return logoRadioAbc;
    case "chevere":
      return logoRadioChevere;
    case "full":
      return logoRadioFull;
    case "la urbana":
      return logoRadioUrban;
    case "102 nueve":
      return logoRadio102;
    case "caliente":
      return logoRadioHot;
    case "soda estereo":
      return logoRadioSoda;
    default:
      return "";
  }
}

String getBannerAssets(String name){
  switch(name.toLowerCase()){
    case "super":
      return bannerSuper;
    case "abc":
      return bannerAbc;
    case "chevere":
      return bannerChevere;
    case "full":
      return bannerFull;
    case "la urbana":
      return bannerUrban;
    case "102 nueve":
      return banner102;
    case "caliente":
      return bannerHot;
    case "soda estereo":
      return bannerSoda;
    default:
      return "";
  }
}


