program Demo;
uses
//  System.SysUtils, math, crt;
     crt;

procedure desplazamiento(des : byte; var fila, columna : integer);
begin
    if (des = 1) then begin
      inc(columna); //columna := columna + 1;
    end else if (des = 2) then begin
      dec(columna); //columna := columna - 1;
    end else if (des = 3) then begin
      inc(fila);
    end else if (des = 4) then begin
      dec(fila);
    end else if (des = 5) then begin
      inc(columna);
      inc(fila);
    end else if (des = 6) then begin
      inc(columna);
      dec(fila);
    end else if (des = 7) then begin //inferiorIzquierda
      dec(columna);
      dec(fila);
    end else if (des = 8) then begin
      dec(columna);
      inc(fila);
    end;
end;

procedure desplazamiento1(des : byte; var fila, columna : integer);
begin
    if (des = 1)or(des = 5)or(des = 6) then begin
      inc(columna);
    end;
    if (des = 3)or(des = 5)or(des = 8) then begin
      inc(fila);
    end;
    if (des = 2)or(des = 7)or(des = 8) then begin
      dec(columna);
    end;
    if (des = 4)or(des = 6)or(des = 7) then begin
      dec(fila);
    end;
end;

procedure Principal();
var
  c, f : integer;
  d, fa, fb, ca, cb : byte;
  t : char;
  tiempoEspera : word; //1 segundo = 1000 ms
begin
  ca := 2; cb := 60; fa := 2; fb := 30;
  f := 15;  c := 2;   //
  d := 1;
  t := 'y';
  tiempoEspera := 100;
  repeat
    gotoxy(c, f); write('O');
    delay(tiempoEspera); //>= 0    (-1)
    gotoxy(c, f); write(' ');
    //writeln(f,',',c);
    desplazamiento(d, f, c);
    if (c <= ca) then begin    //esta en inicio de columna
      if (d = 2) then
        d := 1
      else if (d = 7) then
        d := 6
      else//d = 8
        d := 5;
    end;

    if (c >= cb) then begin   //esta en limite de columna
      if (d = 1) then
        d := 2
      else if (d = 5) then
        d := 8
      else//d = 6
        d := 7;
    end;
    if (f <= fa) then begin   //esta en inicio de fila
      if (d = 4) then
        d := 3
      else if (d = 6) then
        d := 5
      else //d = 7
        d := 8;
    end;
    if (f >= fb) then begin   //esta en limite de fila
      if (d = 3) then
        d := 4
      else if (d = 5) then
        d := 6
      else //d = 8
        d := 7;
    end;


    if (KeyPressed) then begin
      t := ReadKey;
      if (t = 'h')and(tiempoEspera >= 20) then
        tiempoEspera := tiempoEspera - 20
      else if (t = 'l') then
         tiempoEspera := tiempoEspera + 20
      else begin
        case t of
           'd': d := 1;
           'a': d := 2;
           's': d := 3;
           'w': d := 4;
           'x': d := 5;
           'e': d := 6;
           'q': d := 7;
           'z': d := 8;
        end;
      end;
    end;
  until (t = 'f');
  writeln('Fin');
end;

//llamado oficial----------------------------------
var aux : byte;
begin
  Principal();
readln;
end.
