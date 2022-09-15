


class ScreenMedia{

  static const GRID_COLUMNS = 24;

  static ScreenMediaType getScreenMediaType(double width){
    if(width<_ScreenMediaBreakPoint.SM)
      return ScreenMediaType.XS;
    else if(width<_ScreenMediaBreakPoint.MD)
      return ScreenMediaType.SM;
    else if(width<_ScreenMediaBreakPoint.LG)
      return ScreenMediaType.MD;
    else if(width<_ScreenMediaBreakPoint.XL)
      return ScreenMediaType.LG;
    else if(width<_ScreenMediaBreakPoint.XXL)
      return ScreenMediaType.XL;
    else if(width<_ScreenMediaBreakPoint.XXXL)
      return ScreenMediaType.XXL;
    else if(width<_ScreenMediaBreakPoint.XXXXL)
      return ScreenMediaType.XXXL;
    return ScreenMediaType.XXXXL;
  }

  static int getSizeFromScreenMediaType(ScreenMediaType screenMediaType){
    switch(screenMediaType){

      case ScreenMediaType.XS:
        return _ScreenMediaBreakPoint.XS;
      case ScreenMediaType.SM:
        return _ScreenMediaBreakPoint.SM;
      case ScreenMediaType.MD:
        return _ScreenMediaBreakPoint.MD;
      case ScreenMediaType.LG:
        return _ScreenMediaBreakPoint.LG;
      case ScreenMediaType.XL:
        return _ScreenMediaBreakPoint.XL;
      case ScreenMediaType.XXL:
        return _ScreenMediaBreakPoint.XXL;
      case ScreenMediaType.XXXL:
        return _ScreenMediaBreakPoint.XXXL;
      case ScreenMediaType.XXXXL:
        return _ScreenMediaBreakPoint.XXXXL;
    }
    return _ScreenMediaBreakPoint.XXXXL;
  }

  static bool isMinimumSize(ScreenMediaType screenMediaType,{double currentWidth,ScreenMediaType currentScreenMediaType}){

    double width = currentWidth??getSizeFromScreenMediaType(currentScreenMediaType).toDouble();

    switch(screenMediaType){
      case ScreenMediaType.XS:
        return width<_ScreenMediaBreakPoint.SM;
      case ScreenMediaType.SM:
        return width<_ScreenMediaBreakPoint.MD;
      case ScreenMediaType.MD:
        return width<_ScreenMediaBreakPoint.LG;
      case ScreenMediaType.LG:
        return width<_ScreenMediaBreakPoint.XL;
      case ScreenMediaType.XL:
        return width<_ScreenMediaBreakPoint.XXL;
      case ScreenMediaType.XXL:
        return width<_ScreenMediaBreakPoint.XXL;
      case ScreenMediaType.XXXL:
        return width<_ScreenMediaBreakPoint.XXXL;
      case ScreenMediaType.XXXXL:
        return width<_ScreenMediaBreakPoint.XXXXL;

    }
    return width<_ScreenMediaBreakPoint.XXXXL;
  }







}

enum ScreenMediaType{
  XS,SM,MD,LG,XL,XXL,XXXL,XXXXL
}

class _ScreenMediaBreakPoint{
  static const int XS = 0;
  static const int SM = 576;
  static const int MD = 768;
  static const int LG = 992;
  static const int XL = 1200;
  static const int XXL = 1400;
  static const int XXXL = 1600;
  static const int XXXXL = 1800;

}
