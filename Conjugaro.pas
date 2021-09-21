unit Conjugaro;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils;
const
     verb1 : array[1..10] of string[10] =  {verbos de primera terminacion}
              ('copi','borr','busc','clasific','ingres',
               'analiz','llam','enseñ','ayud','interactu');
     verb2 : array[1..1] of string[10] =    {verbos de segunda terminacion}
              ('met');
     verb3 : array[1..1] of string[10] =    {verbos de tercera terminacion}
              ('viv');

type
  //Modos verbales.
  TModoVerb = (
    modIndicat,   //Indicativo
    modSubjunt,   //Subjuntivo
    modImperat    //Imperativo
  );
  //Tiempo verbal
  TTpoVerb = (
    //Tiempos simples
    tpoPresente,    //Presente     (amo, amas, ama, ...)
    tpoPretImper,   //Pretérito imperfecto (amaba, amabas, ...)
    tpoPretPerfSim, //Pretérito perfecto simple (amé, amaste, ...)
    tpoFuturSim,    //Futuro simple (amaré, amarás, )
    tpoCondSim,     //Condicional simple (amaría, amarías, ...)
    //Tiempos compuestos
    tpoPretPerfCom, //Pretérito perfecto compuesto (he amado, has amado, ...)
    tpoPretPluscua, //Pretérito pluscuamperfecto (había amado, habías amado, ...)
    tpoPretAnt,     //Pretérito anterior (hube amado, hubiste amado, ...)
    tpoFuturPerf,   //Futuro perfecto (abré amado, habrás amado, ...)
    tpoCondPerf     //Condicional perfecto (habría amado, habrías amado, ...)
  );
  //Persona
  TPersVerb = (
    per1Sing,       //Primera persona en singular
    per2Sing,       //Segunda persona en singular
    per3Sing,       //Tercera persona en singular
    per1Plur,       //Primera persona en plural
    per2Plur,       //Segunda persona en plural
    per3Plur        //Tercera persona en plural
  );
const
    pasad = 1;
    prese = 2;
    futur = 3;

type cad14 = string[14];
     cad10 = string[10];
     cad12 = string[12];

var
    palabra : array[1..20] of cad10;
    oracion : string ;

procedure termVerbReg1(modo: TModoVerb; tiempo: TTpoVerb; persona: TPersVerb;
                      out aux, term: cad10);
Procedure Conjugar(var verbo: string; modo: TModoVerb; tie: TTpoVerb; per: TPersVerb);

implementation
procedure termVerbReg1(modo: TModoVerb; tiempo: TTpoVerb; persona: TPersVerb;
                      out aux, term: cad10);
{Retorna la terminación verbal para un verbo regular de la primera terminación, como
por ejemplo "Cantar" o "Amar".
Las termianciones a devolver dependerán del modo del tiempo y de la persona.
La terminación (morfema) se devuelve en el parámetro "term". Si hay un auxiliar como
"haya", este se retorna en "aux";
}
begin
  aux := '';  //Por defecto
  case modo of
    modIndicat:
      case tiempo of
      //Tiempos simples
      tpoPresente:    //Presente     (amo, amas, ama, ...)
        case persona of
        per1Sing: term := 'o';   //amo
        per2Sing: term := 'as';  //amas
        per3Sing: term := 'a';
        per1Plur: term := 'amos';
        per2Plur: term := 'áis';
        per3Plur: term := 'an';
        end;
      tpoPretImper:   //Pretérito imperfecto (amaba, amabas, ...)
        case persona of
        per1Sing: term := 'aba';
        per2Sing: term := 'abas';
        per3Sing: term := 'aba';
        per1Plur: term := 'ábamos';
        per2Plur: term := 'abais';
        per3Plur: term := 'aban';
        end;
      tpoPretPerfSim: //Pretérito perfecto simple (amé, amaste, ...)
        case persona of
        per1Sing: term := 'é';
        per2Sing: term := 'aste';
        per3Sing: term := 'ó';
        per1Plur: term := 'amos';
        per2Plur: term := 'asteis';
        per3Plur: term := 'aron';
        end;
      tpoFuturSim:    //Futuro simple (amaré, amarás, )
        case persona of
        per1Sing: term := 'aré';
        per2Sing: term := 'arás';
        per3Sing: term := 'ará';
        per1Plur: term := 'aremos';
        per2Plur: term := 'aréis';
        per3Plur: term := 'arán';
        end;
      tpoCondSim:     //Condicional simple (amaría, amarías, ...)
        case persona of
        per1Sing: term := 'aría';
        per2Sing: term := 'arías';
        per3Sing: term := 'aría';
        per1Plur: term := 'aríamos';
        per2Plur: term := 'aríais';
        per3Plur: term := 'arían';
        end;
      //Tiempos compuestos
      tpoPretPerfCom: //Pretérito perfecto compuesto (he amado, has amado, ...)
        case persona of
        per1Sing: begin aux := 'he'; term := 'ado'; end;
        per2Sing: begin aux := 'has'; term := 'ado'; end;
        per3Sing: begin aux := 'ha'; term := 'ado'; end;
        per1Plur: begin aux := 'hemos'; term := 'ado'; end;
        per2Plur: begin aux := 'habéis'; term := 'ado'; end;
        per3Plur: begin aux := 'han'; term := 'ado'; end;
        end;
      tpoPretPluscua: //Pretérito pluscuamperfecto (había amado, habías amado, ...)
        case persona of
        per1Sing: begin aux := 'había'; term := 'ado'; end;
        per2Sing: begin aux := 'habías'; term := 'ado'; end;
        per3Sing: begin aux := 'había'; term := 'ado'; end;
        per1Plur: begin aux := 'habíamos'; term := 'ado'; end;
        per2Plur: begin aux := 'habíais'; term := 'ado'; end;
        per3Plur: begin aux := 'habían'; term := 'ado'; end;
        end;
      tpoPretAnt:     //Pretérito anterior (hube amado, hubiste amado, ...)
        case persona of
        per1Sing: begin aux := 'hube'; term := 'ado'; end;
        per2Sing: begin aux := 'hubiste'; term := 'ado'; end;
        per3Sing: begin aux := 'hubo'; term := 'ado'; end;
        per1Plur: begin aux := 'hubimos'; term := 'ado'; end;
        per2Plur: begin aux := 'hubisteis'; term := 'ado'; end;
        per3Plur: begin aux := 'hubieron'; term := 'ado'; end;
        end;
      tpoFuturPerf:   //Futuro perfecto (abré amado, habrás amado, ...)
        case persona of
        per1Sing: begin aux := 'habré'; term := 'ado'; end;
        per2Sing: begin aux := 'habrás'; term := 'ado'; end;
        per3Sing: begin aux := 'habrá'; term := 'ado'; end;
        per1Plur: begin aux := 'habremos'; term := 'ado'; end;
        per2Plur: begin aux := 'habréis'; term := 'ado'; end;
        per3Plur: begin aux := 'habrán'; term := 'ado'; end;
        end;
      tpoCondPerf:     //Condicional perfecto (habría amado, habrías amado, ...)
        case persona of
        per1Sing: begin aux := 'habría'; term := 'ado'; end;
        per2Sing: begin aux := 'habrías'; term := 'ado'; end;
        per3Sing: begin aux := 'habría'; term := 'ado'; end;
        per1Plur: begin aux := 'habríamos'; term := 'ado'; end;
        per2Plur: begin aux := 'habríais'; term := 'ado'; end;
        per3Plur: begin aux := 'habrían'; term := 'ado'; end;
        end;
      end;
    modSubjunt: ;
    modImperat: ;
  end;

end;

Procedure Descomponer(cad:string; var n:byte);
var l : byte ;
begin
   n:=1;l:=pos(' ',cad);
   if l<>0 then
      repeat palabra[n] := copy(cad,1,l-1);
             delete(cad,1,l);
             l := pos(' ',cad);
             inc(n)
      until l=0;
   palabra[n]:=cad;
end;

function EnVerbo(v:string ;VAR ter,n:byte):boolean;
var t:byte;
begin n:=1;
  EnVerbo:=false;
  repeat
    if v=verb1[n] then
      begin EnVerbo:=true;ter:=1;end;
    n:=n+1
  until n=10;
end;

Procedure Conjugar(var verbo: string; modo: TModoVerb; tie: TTpoVerb; per: TPersVerb);
{Conjuga el verbo indicado en el parámetro "verbo". El verbo debe pasarse en
infinitivo, es decir, con terminación "ar", "er" o "ir".
}
var
   raiz  : string[10];  //Raiz del verbo
   termin: string[10];   //Terminación del verbo
   morf , aux: string [10];
begin
   termin := copy(verbo,length(verbo)-1,2);
   raiz:= copy(verbo,1,length(verbo)-2);
        if termin = 'ar' then termVerbReg1(modo, tie, per, aux, morf);
        if termin = 'er' then termVerbReg1(modo, tie, per, aux, morf);
        if termin = 'ir' then termVerbReg1(modo, tie, per, aux, morf);
        if aux<>'' then begin
          verbo := raiz + morf;
        end else begin
          verbo := raiz + morf;
        end;
end;

//function EsVerbo(a: cad12; var term, modo;
//                      tiem: TTpoVerb; per: byte): boolean;
//var
//  b,c,d:cad12;
//  tiempo: TTpoVerb;
//  pers: TPersVerb;
//  n:byte;
//begin
//  b:=a;
//  Result := false;
//  repeat
//    b:=copy(b, 1, length(b)-1);
//    if EnVerbo(b, term, n) then begin
//      case term of
//           1 : c:=b + 'ar';
//           2 : c:=b + 'er';
//           3 : c:=b + 'ir';
//      end;
//      for tiempo:=1 to 3 do for pers := 1 to 6 do begin
//          d:=c;Conjugar(d, modIndicat, tiempo, pers);
//          writeln(d);
//          if d = a then begin
//            modo:=1;tiem:=tiempo;
//            per:=pers;Result:=true
//          end;
//      end;
//      for tiempo:=1 to 3 do for pers := 1 to 6 do begin
//          d:=c;Conjugar(d, modImperat,tiempo,pers) ;writeln(d);
//          if d = a then begin
//            modo:=3;tiem:=tiempo;
//            per:=pers;Result:=true
//          end;
//      end;
//    end;
//  until length (b)<=2;
//end;

end.

