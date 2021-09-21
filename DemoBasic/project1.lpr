program project1;
{Programa de demostracion de la librería "Conjugaro".
                          Creado por Tito Hinostroza. 20/09/2021
}
uses Conjugaro, LazUTF8;
var
  verbo: String;
  persona: TPersVerb;
  tpo: TTpoVerb;
begin
  writeln('CANTAR:');
  writeln('(Modo indicativo):');
  for tpo := tpoPresente to tpoCondPerf do begin
    writeln('==' + nombreTiempo(tpo));
    for persona := per1Sing to per3Plur do begin
      verbo := 'cantar';
      conjugar(verbo, modIndicat, tpo, persona);
      write('' + utf8toconsole(verbo)+', ');
    end;
    writeln('');
  end;
  //writeln('=== Modo indicativo ====');
  ReadLn;
end.

