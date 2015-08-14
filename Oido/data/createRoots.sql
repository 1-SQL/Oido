
CALL createRootCategory('lingo','128.128.63',11,@idLingo);
CALL createRootCategory('word-collection','128.128.128',11,@idWords);
CALL createRootCategory('try','128',65,@idTry);
CALL storeCategoryId('oido',@idTry,@lastOido,@idOido);
CALL storeCategoryId('struct',@idTry,@lastStruct,@idStruct);
CALL storeCategoryId('begriff',@idOido,@lastIdea,@idBegriff);
CALL storeCategoryId('language',@idOido,@lastIdea,@idLanguage);
CALL storeWordInt('Begriff',@idBegriff,@lastIdea,@idIdea);
CALL storeWordInt('Kategorie',@idBegriff,@lastIdea,@idIdea);
CALL storeWordInt('Sprache',@idLanguage,@lastIdea,@idIdea);

