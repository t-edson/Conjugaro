program project1;
{Programa de demostracion de la librería "Conjugaro".
                          Creado por Tito Hinostroza. 20/09/2021
}
uses Conjugaro;
var
  verbo: String;
begin
  verbo := 'cantar';
  conjugar(verbo, modIndicat, tpoPresente, per1Plur);
  //writeln('=== Modo indicativo ====');
  writeln('Verbo=' + verbo);
  ReadLn;
end.

