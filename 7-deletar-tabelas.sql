DO $$ 
DECLARE 
    r RECORD;
BEGIN 
    -- loop para passar por todas as tabelas do esquema 'public'
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') 
    LOOP 
        -- executa o comando DROP TABLE CASCADE para cada tabela
        EXECUTE 'DROP TABLE IF EXISTS public.' || r.tablename || ' CASCADE'; 
    END LOOP; 
END $$;