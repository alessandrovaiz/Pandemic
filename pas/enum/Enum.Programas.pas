unit Enum.Programas;

interface

uses
  Enum.Permissao.Usuario,
  Controller.Programa.Menu;

type
  TEnumProgramas = (tpNenhum, tpPEP, tpCadastros, tpRelatorios, tpEstatisticas, tpAjuda);

  THelperEnumProgramas = record helper for TEnumProgramas
  public
    function GetName: String;
    function GetCaption: String;
    function GetControladorPrograma: IControllerProgramaMenu;
  end;

  TClassEnumProgramas = class
  public
    class function GetProgramasPorPermissao(const APermisaso: TEnumPermissaoUsuario): TArray<TEnumProgramas>;
  end;

implementation

uses
  SysUtils,
  Controller.Programa.Menu.PEP,
  Controller.Programa.Menu.Cadastro,
  Controller.Programa.Menu.Relatorio,
  Controller.Programa.Menu.Estatistica,
  Controller.Programa.Menu.Ajuda;

{ TClassEnumProgramas }

class function TClassEnumProgramas.GetProgramasPorPermissao(const APermisaso: TEnumPermissaoUsuario): TArray<TEnumProgramas>;
begin
  case APermisaso of
    tpuAdministrador:
      Result := [tpPEP, tpCadastros, tpRelatorios, tpEstatisticas];
  end;

  Result := Result + [tpAjuda];
end;

{ THelperEnumProgramas }

function THelperEnumProgramas.GetCaption: String;
begin
  Result := EmptyStr;
  case Self of
    tpPEP:
      Result := 'PEP';
    tpCadastros:
      Result := 'Cadastros';
    tpRelatorios:
      Result := 'Relatórios';
    tpEstatisticas:
      Result := 'Estatísticas';
    tpAjuda:
      Result := 'Ajuda';
  end;
end;

function THelperEnumProgramas.GetControladorPrograma: IControllerProgramaMenu;
begin
  Result := nil;
  case Self of
    tpPEP:
      Result := TControllerProgramaMenuPEP.Create;
    tpCadastros:
      Result := TControllerProgramaMenuCadastro.Create;
    tpRelatorios:
      Result := TControllerProgramaMenuRelatorio.Create;
    tpEstatisticas:
      Result := TControllerProgramaMenuEstatistica.Create;
    tpAjuda:
      Result := TControllerProgramaMenuAjuda.Create;
  else
    raise Exception.Create('Factory do controlador não definido!');
  end;
end;

function THelperEnumProgramas.GetName: String;
begin
  Result := EmptyStr;
  case Self of
    tpPEP:
      Result := 'PEP';
    tpCadastros:
      Result := 'cadastros';
    tpRelatorios:
      Result := 'relatorios';
    tpEstatisticas:
      Result := 'estatisticas';
    tpAjuda:
      Result := 'ajuda';
  end;
end;

end.
