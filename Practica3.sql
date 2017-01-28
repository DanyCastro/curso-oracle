set serveroutput on;

-- RECAPITULANDO LO QUE ES UN BLOQUE PL/SQL

DECLARE            --DECLARAN LAS VARIABLES QUE VAMOS A USAR 
nombre varchar2 (20):= ' Daniela';            -- INICIALIZAR := '';
BEGIN       --LOGICA DEL PROGRAMA 
DBMS_OUTPUT.PUT_LINE('BUENAS NOCHES'|| nombre);       --DATABASEM    || CONCATENACION UN VARCHAR CON UNA VARIABLE QUE TAMBIEN ES VARCHAR
END;
/

-- BLOQUE PL/SQL QUE CALCULE LA EDAD EN DIAS. 

DECLARE 
edad integer:= 21;
dias integer;
estatus varchar2 (12);
BEGIN
dias:= edad*365;

-- ESTRUCTURA DE CONTROL DEL IF 
IF DIAS > 10000 THEN 
  estatus:= 'VIEJO';
ELSE
  estatus:= 'JOVEN';
END IF;

DBMS_OUTPUT.PUT_LINE('Tu edad en dias es ' || dias || ' ESTAMOS:' || estatus);     -- SIEMPRE SE CONCATENA
END;
/ 

-- VEREMOS NUESTRO PRIMER PROCEDIMIENTO ALMACENADO 

create or replace procedure saludar(mensaje in varchar2)       --
AS     
BEGIN 
DBMS_OUTPUT.PUT_LINE(' HOLA BUENAS NOCHES' ||mensaje);
END;
/


-- EJECUTAMOS EL PROCEDIMIENTO

exec saludar (' DANY ');


-- CREAMOS LA SECUNCIA 

create sequence sec_persona    -- Secc y el nombre de la TABLA
start with 1   --Puede empezar en 1
increment by 1 --Incremento en 1
nomaxvalue;    --Pueden ser millones de personas 

-- CREAMOS LA TABLA

create table persona(ID_persona integer, nombre varchar2 (20), edad integer, constraint pk_id_persona
primary key (ID_PERSONA));   --CONSTRAINT ES RESTRICCION  por cada CLAVE PK O FK va un constraint separado. Siempre va antes de la PK

-- OUT Dato de salida, se genera. PK 
-- IN Ingresar datos (Alimenta la BD) TODOS LOS DEMAS DATOS DE LA TABLA
create or replace procedure guardar_persona(my_id out integer, my_nombre in varchar2, my_edad in integer)
AS 
BEGIN

select sec_persona.nextval INTO my_id from DUAL; insert into persona values (my_id, my_nombre, my_edad);
END;
/

declare 
valor integer;
begin 
guardar_persona(valor, 'Daniela',21);
end;
/
select * from persona;
