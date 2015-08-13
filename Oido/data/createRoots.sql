
CALL createRootCategory('lingo','128.128.63',11,@idLingo);
CALL createRootCategory('word-collection','128.128.128',11,@idWords);
CALL createRootCategory('try','128',65,@idTry);
CALL storeCategory('oido',@idTry,@lastOido,@idOido);
CALL storeCategory('struct',@idTry,@lastStruct,@idStruct);
CALL storeCategory('begriff',@idOido,@lastIdea,@idBegriff);
CALL storeCategory('language',@idOido,@lastIdea,@idLanguage);
CALL storeWordInt('Begriff',@idBegriff,@lastIdea,@idIdea);
CALL storeWordInt('Kategorie',@idBegriff,@lastIdea,@idIdea);
CALL storeWordInt('Sprache',@idLanguage,@lastIdea,@idIdea);

