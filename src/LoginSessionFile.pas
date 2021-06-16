unit LoginSessionFile;

interface

Type
  LoginSession = Class
    public
      constructor Create;
      function GetKey() : integer;
      function GetSpecialKey() : integer;
      function IsLoggedIn() : boolean;
      procedure Login( userKeyIn: integer );
      procedure Logout();
      procedure SetSpecialKey( specialKeyIn: integer );
    private
      userKey : integer;
      specialKey : integer;
  end;

implementation
constructor LoginSession.Create;
begin
  userKey := -1;
end;

function LoginSession.GetKey() : integer;
begin
  Result := userKey;
end;

function LoginSession.GetSpecialKey() : integer;
begin
  Result := specialKey;
end;

function LoginSession.IsLoggedIn() : boolean;
begin
  if userKey <> -1 then
    begin
      Exit( True );
    end
  else
    begin
      Exit( False );
    end;
end;

procedure LoginSession.Login( userKeyIn: Integer );
begin
  userKey := userKeyIn;
end;

procedure LoginSession.Logout;
begin
  userKey := -1;
end;

procedure LoginSession.SetSpecialKey( specialKeyIn: integer );
begin
  specialKey := specialKeyIn;
end;

end.
