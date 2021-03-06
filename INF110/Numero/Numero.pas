unit Numero;

interface
uses math;
  function DigitoMayorDe4Dig(n : Cardinal): byte;
  function CantidadDeDigitos(n : cardinal): byte;


implementation


  function DigitoMayorDe4Dig(n : Cardinal): byte;
  var
    may, c, d : byte;
   begin
    may := 0;
    c := 0;
    while (n >0)and(c < 4) do
    begin
      d := n mod 10;
      if (d > may) then
       may := d;
      n := n div 10;
      c := c + 1;
    end;
     result := may;
   end;

  function CantidadDeDigitos(n : cardinal): byte;
  begin
  if n = 0 then
    n := 1;
    result := trunc(log10(n*10));  //trunc(5.123) --> 5
  end;

end.
