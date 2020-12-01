unit Utils.Generics;

interface

type
  TUtilsGenerics = class
  public
    class function IfThen<T>(const AValue: Boolean; AResultTrue, AResultFalse: T): T;
  end;

implementation

{ UtilsIfThen }

class function TUtilsGenerics.IfThen<T>(const AValue: Boolean; AResultTrue, AResultFalse: T): T;
begin
  if (AValue) then
    Result := AResultTrue
  else
    Result := AResultFalse;
end;

end.
