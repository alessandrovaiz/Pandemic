unit Singleton.Usuario;

interface

uses
  Enum.Permissao.Usuario;

type
  TSingletonUsuario = class // Todo: Revisar, vamos ter classes que vao mapear as tabelas?
  public
    IdUsuario: Integer;
    PermissaoUsuario: TEnumPermissaoUsuario;
  end;

var
  oSingletonUsuario: TSingletonUsuario;

implementation

initialization

oSingletonUsuario := TSingletonUsuario.Create;

finalization

oSingletonUsuario.Free;

end.
