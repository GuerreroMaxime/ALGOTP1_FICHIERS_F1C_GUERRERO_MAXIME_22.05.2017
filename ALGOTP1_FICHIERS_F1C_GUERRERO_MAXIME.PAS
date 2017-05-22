Program Programme_verbe_fichier;

Uses crt;

Const																//Valeur max attribuer aux verbes
	Max=13;

{Type vebes=record
	verbes 			 :string;
End;

Type
	Tables=Array[1..Max] of vebes;									//Tentative d'utilisation de tableau

Procedure tablo(verbe: string);

Var
	table:Tables;
	i:integer;

Begin
	clrscr;
	For i:=1 to Max do
	Begin
	 WriteLn('Ecriver un verbe');
	 ReadLn(table[i].verbes);
	end;

End;


Type
  Table=Tableau[1..Max] of string;}



Function groupe(verbe, Terminaison1, Terminaison2 :string):integer;							//Fonction pour determiner un groupe

Begin
    ReadLn(fiche,s);
            while not Eof(fiche) do
            Begin
             	ReadLn(fiche,s);															//J'attribut la longueur du mot a la variable verbe
				verbe:=(fiche,s);
				Maxverbe:=lenght(verbe);													//Puis sa longueur max a Maxverbe
				Terminaison1:=length(verbe)Maxverbe-1;										//Et les 2 dernier caractere a Terminaison 1 et 2
				Terminaison2:=length(verbe)Maxverbe;										//Pour pouvoir savoir les 2 dernier caracteres

				For length(verbe)=1 to length(verbe) then
		 			If Terminaison1=E and Terminaison2=R and verbe<>'ALLER' then			//Si les 2 dernier caracteres sont 'ER' et que le mot n'est 
		  			begin 																	//Pas "Aller" alors il seras du premier groupe
		  				groupe:=1;					
		  			End;

		 			If Terminaison1=I et Terminaison2=R then								//Pareil que pour le precedent mais avec les Terminaison
		  			begin 																	//'Ir'
		  				groupe:=2;															
		  			End;

					Else																	//Ce qui ne sont pas fini en 'Er' et 'Ir' (donc le reste)
				  	begin
		  				groupe:=3;
		  			End;

				WriteLn('Le verbe est du ',groupe,'groupe');								//Les valeurs sont atribuer a la fonction pour la réutiliser
			end;

	Close(fiche);
End;



Procedure Conjugaisonverbe, Terminaison1, Terminaison2, Terminaison, Ter1, Ter2, Ter3, Ter4, Ter5, Ter6 :string)

Begin
    ReadLn(fiche);
            while not Eof(fiche) do
            Begin
    			verbe:=fiche;
    			Maxverbe:=longueur(verbe);
				Terminaison1:=longueur(verbe)Maxverbe-1;									//On refait la meme chose que pour le precedent
				Terminaison2:=longueur(verbe)Maxverbe;										//Mais on rajoute une var pour le 3eme groupe
				Terminaison:=longueur(verbe)Maxverbe-2;

    			If groupe=1 then
    			Begin

      				IF Terminaison=c then													//L'exeption avec le 'ç'
					Begin
	 					Terminaison=ç;
					End;

      				verbeconjug:=length(verbe-2);											//On commence de avant les teminaisond
      				Ter1:=e;																//Puis on aribut les terminaison
      				Ter2:=es;		
      				Ter3:=e;
      				Ter4:=ons;
      				Ter5:=ez;
      				Ter6:=ent;

      				If Terminaison=g then													//On modifie pour la lettre g (exeption)
       		 		Begin
        				Ter4:=eons;
       				End;
				End;

				If groupe=2 then
     			Begin

      				verbeconjug:=length(verbe-2);											//Pareil pour les verbes du 2eme groupe
      				Ter1:=s;
      				Ter2:=s;
      				Ter3:=t;
      				Ter4:=ssons;
      				Ter5:=ssez;
      				Ter6:=ssent;

				End;

				If groupe=3 else
				Begin

     				If Terminaison=O then
     				begin																	//Si la longueur-3 c'est que la teminaison est 'oir'
      					verbeconjug:=length(verbe-3);
     				End;

    				If verbe:=ALLER then
     				Begin
      					verbeconjug:=length(verbe-2);										//Si le verbe est aller on commence comme pour un verbe
     				End;																	//Du 1er ou 2eme groupe

      				Ter1:=s;
      				Ter2:=s;
     				Ter3:=t;
      				Ter4:=ons;
      				Ter5:=ez;
      				Ter6:=ent;
      			End;
      		End;

		WriteLn(verbejug,Ter1);																//On met le verbe sans la terminaison
		WriteLn(verbejug,Ter2);																//Puis on ajoute la terminaison
		WriteLn(verbejug,Ter3);
		WriteLn(verbejug,Ter4);
		WriteLn(verbejug,Ter5);
		WriteLn(verbejug,Ter6);
End;




Var
	fiche:textfile;
	s:string;

Begin
	 clrscr;
	 Assign(fiche,'Fichierdeverbe.txt');
	 WriteLn('Voici les verbes de votre fichier:');
	 WriteLn('');
     Reset(fiche);
         while not Eof(fiche) do
         begin
           ReadLn(fiche,s);
           WriteLn(fiche,s);
         end;
            
     close(fiche);  
     readln;

	 //tablo(s);

	 groupe(s)
	 readln;

	 Conjugaisonverbe(s)
	 readln;
End.