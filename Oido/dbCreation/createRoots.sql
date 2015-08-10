
use 'oido';
CALL createrootcategory('lingo','128.128.63.10',@id);
CALL createrootcategory('collection','128.128.128.10',@id);
CALL createrootcategory('try','128.63',@id);
CALL storecategory('oido',@id,@oid,@idout);
CALL storecategory('struct',@id,@oid,@idout);

