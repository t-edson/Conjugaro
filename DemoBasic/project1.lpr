program project1;
{Programa de demostracion de la librería "Conjugaro".
                          Creado por Tito Hinostroza. 20/09/2021
}
uses Conjugaro;
var
  verbo: String;
  persona: TPersVerb;
begin
  for persona := per1Sing to per3Plur do begin
    verbo := 'cantar';
    conjugar(verbo, modIndicat, tpoPresente, persona);
    writeln('Verbo=' + verbo);
  end;
  //writeln('=== Modo indicativo ====');
  ReadLn;
end.

