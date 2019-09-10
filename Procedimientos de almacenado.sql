--PROCEDIMIENTO 1 (INSERTAR EMPRESA)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_INSERTAR_EMPRESA
(--Parametros para llenar la tabla EMPRESA
ID_EMPRESA_PARAMETRO            IN EMPRESA.ID_EMPRESA%TYPE,
NOMBRE_EMPRESA_PARAMETRO        IN EMPRESA.NOMBRE%TYPE,
DESCRIPCION_PARAMETRO           IN EMPRESA.DESCRIPCION%TYPE,
ID_RUBRO_EMPRESA_PARAMETRO      IN RUBRO_EMPRESA.ID_RUBRO_EMPRESA%TYPE,
RUT_EMPRESA_PARAMETRO           IN EMPRESA.RUT_EMPRESA%TYPE,
ESTADO_PARAMETRO                IN EMPRESA.ESTADO%TYPE,
LOGO_PARAMETRO                  IN EMPRESA.LOGO%TYPE,
CORREO_PARAMETRO                IN EMPRESA.CORREO%TYPE,
RAZON_SOCIAL_PARAMETRO          IN EMPRESA.RAZON_SOCIAL%TYPE,
DIRECCION_PARAMETRO             IN EMPRESA.DIRECCION%TYPE,
--Parametros para llenar la tabla CONTRATO--
ID_CONTRATO_PARAMETRO           IN CONTRATO.ID_CONTRATO%TYPE,
DESCRIPCION_CONTRATO_PARAMETRO  IN CONTRATO.DESCRIPCION%TYPE,
FECHA_INICIO_PARAMETRO          IN CONTRATO.FECHA_INICIO%TYPE,
ESTADO_CONTRATO_PARAMETRO       IN CONTRATO.ESTADO_CONTRATO%TYPE,
FECHA_TERMINO_PARAMETRO         IN CONTRATO.FECHA_TERMINO%TYPE)
IS
BEGIN
  INSERT INTO EMPRESA VALUES (ID_EMPRESA_PARAMETRO,NOMBRE_EMPRESA_PARAMETRO,DESCRIPCION_PARAMETRO,ID_RUBRO_EMPRESA_PARAMETRO,
  RUT_EMPRESA_PARAMETRO,ESTADO_PARAMETRO,LOGO_PARAMETRO,CORREO_PARAMETRO,RAZON_SOCIAL_PARAMETRO,DIRECCION_PARAMETRO);
  INSERT INTO CONTRATO VALUES (ID_CONTRATO_PARAMETRO,DESCRIPCION_CONTRATO_PARAMETRO,FECHA_INICIO_PARAMETRO,ID_EMPRESA_PARAMETRO,ESTADO_CONTRATO_PARAMETRO,FECHA_TERMINO_PARAMETRO);
END SP_INSERTAR_EMPRESA;

--LLamando al procedimiento.
exec SP_INSERTAR_EMPRESA(4,'PRUEBA STORE PROCEDURE','DESCRIPCION PRUEBA',2,70046800,1,'\IMG\LOGO4','PRUEBA@PRUEBA.CL','PRUEBA_RAZON_SOCIAL','EJERCITO 215',4,'DESCRIPCION CONTRATO PRUEBA',SYSDATE,1,SYSDATE);

--Validar Resultados
SELECT * FROM EMPRESA;
SELECT * FROM CONTRATO;



--PROCEDIMIENTO 2 (ACTUALIZAR EMPRESA)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ACTUALIZAR_EMPRESA
(NOMBRE_EMPRESA_PARAMETRO   IN EMPRESA.NOMBRE%TYPE,
DESCRIPCION_PARAMETRO       IN EMPRESA.DESCRIPCION%TYPE,
ID_RUBRO_EMPRESA_PARAMETRO  IN EMPRESA.ID_RUBRO_EMPRESA%TYPE,
RUT_EMPRESA_PARAMETRO_NUEVO IN EMPRESA.RUT_EMPRESA%TYPE,
ESTADO_PARAMETRO            IN EMPRESA.ESTADO%TYPE,
LOGO_PARAMETRO              IN EMPRESA.LOGO%TYPE,
CORREO_PARAMETRO            IN EMPRESA.CORREO%TYPE,
RAZON_SOCIAL_PARAMETRO      IN EMPRESA.RAZON_SOCIAL%TYPE,
DIRECCION_PARAMETRO         IN EMPRESA.DIRECCION%TYPE,
ID_EMPRESA_PARAMETRO        IN EMPRESA.ID_EMPRESA%TYPE)
IS
BEGIN
  UPDATE EMPRESA
  SET NOMBRE = NOMBRE_EMPRESA_PARAMETRO,
  DESCRIPCION = DESCRIPCION_PARAMETRO,
  ID_RUBRO_EMPRESA = ID_RUBRO_EMPRESA_PARAMETRO,
  RUT_EMPRESA = RUT_EMPRESA_PARAMETRO_NUEVO,
  ESTADO = ESTADO_PARAMETRO,
  LOGO = LOGO_PARAMETRO,
  CORREO = CORREO_PARAMETRO,
  RAZON_SOCIAL = RAZON_SOCIAL_PARAMETRO,
  DIRECCION = DIRECCION_PARAMETRO
  WHERE ID_EMPRESA = ID_EMPRESA_PARAMETRO;
END SP_ACTUALIZAR_EMPRESA;

--LLamando al procedimiento.
exec SP_ACTUALIZAR_EMPRESA('SERBIMA','SERBIMA DESCRIPCION',1,16123456,0,'\LOGO\PRUEBA01','CORREO@PRUEBA.CL','SERBIMA S.A','PRUEBA 123',4);

--Validar Resultados
SELECT * FROM EMPRESA;





--PROCEDIMIENTO 3 (ELIMINAR EMPRESA (ELIMINACIÓN FISICA))
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_EMPRESA
(ID_EMPRESA_PARAMETRO IN EMPRESA.ID_EMPRESA%TYPE) 
IS
BEGIN
  DELETE FROM EMPRESA WHERE ID_EMPRESA = ID_EMPRESA_PARAMETRO ;
END SP_ELIMINAR_EMPRESA;

--LLamando al procedimiento.
exec SP_ELIMINAR_EMPRESA(4);

--Validar Resultados
SELECT * FROM EMPRESA;



--PROCEDIMIENTO 3.1 (ELIMINAR EMPRESA (ELIMINACIÓN LOGICA))
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_EMPRESA_LOGICA
(ID_EMPRESA_PARAMETRO IN EMPRESA.ID_EMPRESA%TYPE) 
IS
BEGIN
  UPDATE EMPRESA
  SET ESTADO = 0
  WHERE ID_EMPRESA = ID_EMPRESA_PARAMETRO;
END SP_ELIMINAR_EMPRESA_LOGICA;

--LLamando al procedimiento.
exec SP_ELIMINAR_EMPRESA_LOGICA(4);

--Validar Resultados
SELECT * FROM EMPRESA;



















--PROCEDIMIENTO 4 (INSERTAR PROFESIONAL)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_INSERTAR_PROFESIONAL
(--Parametros para llenar la tabla PROFESIONAL
ID_PROFESIONAL_PARAMETRO      IN PROFESIONAL.ID_PROFESIONAL%TYPE,
PRIMER_NOMBRE_PARAMETRO       IN PROFESIONAL.PRIMER_NOMBRE%TYPE,
APELLIDO_PATERNO_PARAMETRO    IN PROFESIONAL.APELLIDO_PATERNO%TYPE,
APELLIDO_MATERNO_PARAMETRO    IN PROFESIONAL.APELLIDO_MATERNO%TYPE,
FECHA_NACIMIENTO_PARAMETRO    IN PROFESIONAL.FECHA_NACIMIENTO%TYPE,
ESTADO_PARAMETRO              IN PROFESIONAL.ESTADO%TYPE,
RUT_PROFESIONAL_PARAMETRO     IN PROFESIONAL.RUT_PROFESIONAL%TYPE,
SEGUNDO_NOMBRE_PARAMETRO      IN PROFESIONAL.SEGUNDO_NOMBRE%TYPE,
CORREO_ELECTRONICO_PARAMETRO  IN PROFESIONAL.CORREO_ELECTRONICO%TYPE,
DIRECCION_PARAMETRO           IN PROFESIONAL.DIRECCION%TYPE,
--Parametros para llenar la tabla CONTRATO_PROFESIONAL
ID_CONTRATO_PARAMETRO         IN CONTRATO_PROFESIONAL.ID_CONTRATO%TYPE,
FECHA_INICIO_PARAMETRO        IN CONTRATO_PROFESIONAL.FECHA_INICIO%TYPE,
FECHA_TERMINO_PARAMETRO       IN CONTRATO_PROFESIONAL.FECHA_TERMINO%TYPE,
ESTADO_PROF_PARAMETRO         IN CONTRATO_PROFESIONAL.ESTADO%TYPE) 
IS
BEGIN
  INSERT INTO PROFESIONAL VALUES (ID_PROFESIONAL_PARAMETRO,PRIMER_NOMBRE_PARAMETRO,APELLIDO_PATERNO_PARAMETRO,APELLIDO_MATERNO_PARAMETRO,FECHA_NACIMIENTO_PARAMETRO,
  ESTADO_PARAMETRO,RUT_PROFESIONAL_PARAMETRO,SEGUNDO_NOMBRE_PARAMETRO,CORREO_ELECTRONICO_PARAMETRO,DIRECCION_PARAMETRO);
  
  INSERT INTO CONTRATO_PROFESIONAL VALUES (ID_CONTRATO_PARAMETRO,FECHA_INICIO_PARAMETRO,FECHA_TERMINO_PARAMETRO,ESTADO_PROF_PARAMETRO,ID_PROFESIONAL_PARAMETRO); 
END SP_INSERTAR_PROFESIONAL;

--LLamando al procedimiento.
exec SP_INSERTAR_PROFESIONAL(4,'NOMBRE 1','APELLIDO 1','APELLIDO 2',SYSDATE,1,169199957,'NOMBRE 2','PRUEBA@PRUEBA.CL','DIRECCION_PRUEBA',4,SYSDATE,SYSDATE,1);

--Validar Resultados
SELECT * FROM PROFESIONAL;
SELECT * FROM CONTRATO_PROFESIONAL;




--PROCEDIMIENTO 5 (ACTUALIZAR PROFESIONAL)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ACTUALIZAR_PROFESIONAL
(NOMBRE_PARAMETRO IN PROFESIONAL.NOMBRE%TYPE,
APELLIDO_PATERNO_PARAMETRO IN PROFESIONAL.APELLIDO_PATERNO%TYPE,
APELLIDO_MATERNO_PARAMETRO IN PROFESIONAL.APELLIDO_MATERNO%TYPE,
FECHA_NACIMIENTO_PARAMETRO IN PROFESIONAL.FECHA_NACIMIENTO%TYPE,
ESTADO_PARAMETRO IN PROFESIONAL.ESTADO%TYPE,
RUT_PROFESIONAL_PARAMETRO IN PROFESIONAL.RUT_PROFESIONAL%TYPE,
DIGITO_VERIFICADOR_PARAMETRO IN PROFESIONAL.DIGITO_VERIFICADOR%TYPE,
RUT_PROFESIONAL_VIEJO IN PROFESIONAL.RUT_PROFESIONAL%TYPE,
DIGITO_VERIFICADOR_VIEJO IN PROFESIONAL.DIGITO_VERIFICADOR%TYPE) 
IS
BEGIN
  UPDATE PROFESIONAL
  SET NOMBRE = NOMBRE_PARAMETRO,
  APELLIDO_PATERNO = APELLIDO_PATERNO_PARAMETRO,
  APELLIDO_MATERNO = APELLIDO_MATERNO_PARAMETRO,
  FECHA_NACIMIENTO = FECHA_NACIMIENTO_PARAMETRO,
  ESTADO = ESTADO_PARAMETRO,
  RUT_PROFESIONAL = RUT_PROFESIONAL_PARAMETRO,
  DIGITO_VERIFICADOR = DIGITO_VERIFICADOR_PARAMETRO
  WHERE RUT_PROFESIONAL = RUT_PROFESIONAL_VIEJO AND DIGITO_VERIFICADOR = DIGITO_VERIFICADOR_VIEJO ;
END SP_ACTUALIZAR_PROFESIONAL;

--LLamando al procedimiento.
exec SP_ACTUALIZAR_PROFESIONAL('CLAUDIO','ANGULO','BRIONES',SYSDATE,1,12123456,7,16919995,7);

--Validar Resultados
SELECT * FROM PROFESIONAL;




--PROCEDIMIENTO 6 (ELIMINAR PROFESIONAL (ELIMINACIÓN FISICA))
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_PROFESIONAL
(RUT_PROFESIONAL_PARAMETRO IN PROFESIONAL.RUT_PROFESIONAL%TYPE,
DIGITO_VERIFICADOR_PARAMETRO IN PROFESIONAL.DIGITO_VERIFICADOR%TYPE) 
IS
BEGIN
  DELETE FROM PROFESIONAL WHERE RUT_PROFESIONAL = RUT_PROFESIONAL_PARAMETRO AND DIGITO_VERIFICADOR = DIGITO_VERIFICADOR_PARAMETRO ;
END SP_ELIMINAR_PROFESIONAL;

--LLamando al procedimiento.
exec SP_ELIMINAR_PROFESIONAL(12123456,7);

--Validar Resultados
SELECT * FROM PROFESIONAL;



--PROCEDIMIENTO 6.1 (ELIMINAR PROFESIONAL (ELIMINACIÓN LOGICA))
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_PROFESIONAL_LOGICA
(RUT_PROFESIONAL_PARAMETRO IN PROFESIONAL.RUT_PROFESIONAL%TYPE,
DIGITO_VERIFICADOR_PARAMETRO IN PROFESIONAL.DIGITO_VERIFICADOR%TYPE) 
IS
BEGIN
  UPDATE PROFESIONAL
  SET ESTADO = 0
  WHERE RUT_PROFESIONAL = RUT_PROFESIONAL_PARAMETRO AND DIGITO_VERIFICADOR = DIGITO_VERIFICADOR_PARAMETRO ;
END SP_ELIMINAR_PROFESIONAL_LOGICA;

--LLamando al procedimiento.
exec SP_ELIMINAR_PROFESIONAL_LOGICA(12281657,2);

--Validar Resultados
SELECT * FROM PROFESIONAL;



















--REVISAR TODOS DE NUEVO


--PROCEDIMIENTO 7 (INSERTAR VISITA)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_INSERTAR_VISITA
(ID_VISITA_PARAMETRO IN VISITA.ID_VISITA%TYPE,
FECHA_INICIO_PARAMETRO IN VISITA.FECHA_INICIO%TYPE,
FECHA_TERMINO_PARAMETRO IN VISITA.FECHA_TERMINO%TYPE,
COSTO_PARAMETRO IN VISITA.COSTO%TYPE,
ID_EMPRESA_PARAMETRO IN VISITA.ID_EMPRESA%TYPE,
ID_DETALLE_VISITA IN VISITA.ID_DETALLE_VISITA%TYPE,
ID_PROFESIONAL_PARAMETRO IN VISITA.ID_PROFESIONAL%TYPE,
ESTADO_PARAMETRO IN VISITA.ESTADO%TYPE ) 
IS
BEGIN
  INSERT INTO VISITA VALUES (ID_VISITA_PARAMETRO,FECHA_INICIO_PARAMETRO,FECHA_TERMINO_PARAMETRO,COSTO_PARAMETRO,
  ID_EMPRESA_PARAMETRO,ID_DETALLE_VISITA,ID_PROFESIONAL_PARAMETRO,ESTADO_PARAMETRO); 
END SP_INSERTAR_VISITA;

--LLamando al procedimiento.
exec SP_INSERTAR_VISITA(4,SYSDATE,SYSDATE,9999,2,3,1,1);

--Validar Resultados
SELECT * FROM VISITA;




--PROCEDIMIENTO 8 (ACTUALIZAR VISITA)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ACTUALIZAR_VISITA
(FECHA_INICIO_PARAMETRO IN VISITA.FECHA_INICIO%TYPE,
FECHA_TERMINO_PARAMETRO IN VISITA.FECHA_TERMINO%TYPE,
COSTO_PARAMETRO IN VISITA.COSTO%TYPE,
ID_EMPRESA_PARAMETRO IN VISITA.ID_EMPRESA%TYPE,
ID_DETALLE_VISITA_PARAMETRO IN VISITA.ID_DETALLE_VISITA%TYPE,
ID_PROFESIONAL_PARAMETRO IN VISITA.ID_PROFESIONAL%TYPE,
ESTADO_PARAMETRO IN VISITA.ESTADO%TYPE,
ID_VISITA_PARAMETRO IN VISITA.ID_VISITA%TYPE)
IS
BEGIN
  UPDATE VISITA
  SET FECHA_INICIO = FECHA_INICIO_PARAMETRO,
  FECHA_TERMINO = FECHA_TERMINO_PARAMETRO,
  COSTO = COSTO_PARAMETRO,
  ID_EMPRESA = ID_EMPRESA_PARAMETRO,
  ID_DETALLE_VISITA = ID_DETALLE_VISITA_PARAMETRO,
  ID_PROFESIONAL = ID_PROFESIONAL_PARAMETRO,
  ESTADO = ESTADO_PARAMETRO
  WHERE ID_VISITA = ID_VISITA_PARAMETRO;
END SP_ACTUALIZAR_VISITA;

--LLamando al procedimiento.
exec SP_ACTUALIZAR_VISITA(SYSDATE,SYSDATE,25990,3,2,3,0,4);

--Validar Resultados
SELECT * FROM VISITA;




--PROCEDIMIENTO 9 (ELIMINAR VISITA (ELIMINACIÓN FISICA))
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_VISITA
(ID_VISITA_PARAMETRO IN VISITA.ID_VISITA%TYPE) 
IS
BEGIN
  DELETE FROM VISITA WHERE ID_VISITA = ID_VISITA_PARAMETRO;
END SP_ELIMINAR_VISITA;

--LLamando al procedimiento.
exec SP_ELIMINAR_VISITA(4);

--Validar Resultados
SELECT * FROM VISITA;



--PROCEDIMIENTO 9.1 (ELIMINAR VISITA (ELIMINACIÓN LOGICA))
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_VISITA_LOGICA
(ID_VISITA_PARAMETRO IN VISITA.ID_VISITA%TYPE) 
IS
BEGIN
  UPDATE VISITA
  SET ESTADO = 0
  WHERE ID_VISITA = ID_VISITA_PARAMETRO ;
END SP_ELIMINAR_VISITA_LOGICA;

--LLamando al procedimiento.
exec SP_ELIMINAR_VISITA_LOGICA(4);

--Validar Resultados
SELECT * FROM VISITA;
















--PROCEDIMIENTO 10 (INSERTAR CAPACITACION)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_INSERTAR_CAPACITACION
(ID_CAPACITACION_PARAMETRO IN CAPACITACION.ID_CAPACITACION%TYPE,
FECHA_INICIO_PARAMETRO IN CAPACITACION.FECHA_INICIO%TYPE,
FECHA_TERMINO_PARAMETRO IN CAPACITACION.FECHA_TERMINO%TYPE,
COSTO_PARAMETRO IN CAPACITACION.COSTO%TYPE,
ID_EMPRESA_PARAMETRO IN CAPACITACION.ID_EMPRESA%TYPE,
ID_ASISTENTES_PARAMETRO IN CAPACITACION.ID_ASISTENTES%TYPE,
ID_PROFESIONAL_PARAMETRO IN CAPACITACION.ID_PROFESIONAL%TYPE,
ESTADO_PARAMETRO IN CAPACITACION.ESTADO%TYPE) 
IS
BEGIN
  INSERT INTO CAPACITACION VALUES (ID_CAPACITACION_PARAMETRO,FECHA_INICIO_PARAMETRO,FECHA_TERMINO_PARAMETRO,COSTO_PARAMETRO,
  ID_EMPRESA_PARAMETRO,ID_ASISTENTES_PARAMETRO,ID_PROFESIONAL_PARAMETRO,ESTADO_PARAMETRO); 
END SP_INSERTAR_CAPACITACION;

--LLamando al procedimiento.
exec SP_INSERTAR_CAPACITACION(4,SYSDATE,SYSDATE,25990,2,3,2,1);

--Validar Resultados
SELECT * FROM CAPACITACION;




--PROCEDIMIENTO 11 (ACTUALIZAR CAPACITACION)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ACTUALIZAR_CAPACITACION
(FECHA_INICIO_PARAMETRO IN CAPACITACION.FECHA_INICIO%TYPE,
FECHA_TERMINO_PARAMETRO IN CAPACITACION.FECHA_TERMINO%TYPE,
COSTO_PARAMETRO IN CAPACITACION.COSTO%TYPE,
ID_EMPRESA_PARAMETRO IN CAPACITACION.ID_EMPRESA%TYPE,
ID_ASISTENTES_PARAMETRO IN CAPACITACION.ID_ASISTENTES%TYPE,
ID_PROFESIONAL_PARAMETRO IN CAPACITACION.ID_PROFESIONAL%TYPE,
ESTADO_PARAMETRO IN CAPACITACION.ESTADO%TYPE,
ID_CAPACITACION_PARAMETRO IN CAPACITACION.ID_CAPACITACION%TYPE)
IS
BEGIN
  UPDATE CAPACITACION
  SET FECHA_INICIO = FECHA_INICIO_PARAMETRO,
  FECHA_TERMINO = FECHA_TERMINO_PARAMETRO,
  COSTO = COSTO_PARAMETRO,
  ID_EMPRESA = ID_EMPRESA_PARAMETRO,
  ID_ASISTENTES = ID_ASISTENTES_PARAMETRO,
  ID_PROFESIONAL = ID_PROFESIONAL_PARAMETRO,
  ESTADO = ESTADO_PARAMETRO
  WHERE ID_CAPACITACION = ID_CAPACITACION_PARAMETRO;
END SP_ACTUALIZAR_CAPACITACION;

--LLamando al procedimiento.
exec SP_ACTUALIZAR_CAPACITACION(SYSDATE,SYSDATE,12990,1,1,1,0,4);

--Validar Resultados
SELECT * FROM CAPACITACION;





--PROCEDIMIENTO 12 (ELIMINAR CAPACITACION (ELIMINACIÓN FISICA))
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_CAPACITACION
(ID_CAPACITACION_PARAMETRO IN CAPACITACION.ID_CAPACITACION%TYPE) 
IS
BEGIN
  DELETE FROM CAPACITACION WHERE ID_CAPACITACION = ID_CAPACITACION_PARAMETRO;
END SP_ELIMINAR_CAPACITACION;

--LLamando al procedimiento.
exec SP_ELIMINAR_CAPACITACION(4);

--Validar Resultados
SELECT * FROM CAPACITACION;



--PROCEDIMIENTO 12.1 (ELIMINAR CAPACITACION (ELIMINACIÓN LOGICA))
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_CAPACITACION_LOG
(ID_CAPACITACION_PARAMETRO IN CAPACITACION.ID_CAPACITACION%TYPE) 
IS
BEGIN
  UPDATE CAPACITACION
  SET ESTADO = 0
  WHERE ID_CAPACITACION = ID_CAPACITACION_PARAMETRO ;
END SP_ELIMINAR_CAPACITACION_LOG;

--LLamando al procedimiento.
exec SP_ELIMINAR_CAPACITACION_LOG(3);

--Validar Resultados
SELECT * FROM CAPACITACION;
















--PROCEDIMIENTO 13 (INSERTAR ASESORIA)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_INSERTAR_ASESORIA
(ID_ASESORIA_PARAMETRO IN ASESORIA.ID_ASESORIA%TYPE,
FECHA_INICIO_PARAMETRO IN ASESORIA.FECHA_INICIO%TYPE,
FECHA_TERMINO_PARAMETRO IN ASESORIA.FECHA_TERMINO%TYPE,
COSTO_PARAMETRO IN ASESORIA.COSTO%TYPE,
ID_EMPRESA_PARAMETRO IN ASESORIA.ID_EMPRESA%TYPE,
ID_PROFESIONAL_PARAMETRO IN ASESORIA.ID_PROFESIONAL%TYPE,
ESTADO_PARAMETRO IN ASESORIA.ID_ASESORIA%TYPE) 
IS
BEGIN
  INSERT INTO ASESORIA VALUES (ID_ASESORIA_PARAMETRO,FECHA_INICIO_PARAMETRO,FECHA_TERMINO_PARAMETRO,COSTO_PARAMETRO,ID_EMPRESA_PARAMETRO,ID_PROFESIONAL_PARAMETRO,ESTADO_PARAMETRO); 
END SP_INSERTAR_ASESORIA;

--LLamando al procedimiento.
exec SP_INSERTAR_ASESORIA(6,SYSDATE,SYSDATE,25990,2,1,1);

--Validar Resultados
SELECT * FROM ASESORIA;

DELETE FROM ASESORIA WHERE ID_ASESORIA = 6;





--PROCEDIMIENTO 14 (ACTUALIZAR ASESORIA)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ACTUALIZAR_ASESORIA
(FECHA_INICIO_PARAMETRO IN ASESORIA.FECHA_INICIO%TYPE,
FECHA_TERMINO_PARAMETRO IN ASESORIA.FECHA_TERMINO%TYPE,
COSTO_PARAMETRO IN ASESORIA.COSTO%TYPE,
ID_EMPRESA_PARAMETRO IN ASESORIA.ID_EMPRESA%TYPE,
ID_PROFESIONAL_PARAMETRO IN ASESORIA.ID_PROFESIONAL%TYPE,
ESTADO_PARAMETRO IN ASESORIA.ESTADO%TYPE,
ID_ASESORIA_PARAMETRO IN ASESORIA.ID_ASESORIA%TYPE)
IS
BEGIN
    UPDATE ASESORIA
    SET FECHA_INICIO = FECHA_INICIO_PARAMETRO,
    FECHA_TERMINO = FECHA_TERMINO_PARAMETRO,
    COSTO = COSTO_PARAMETRO,
    ID_EMPRESA = ID_EMPRESA_PARAMETRO,
    ID_PROFESIONAL = ID_PROFESIONAL_PARAMETRO,
    ESTADO = ESTADO_PARAMETRO
    WHERE ID_ASESORIA = ID_ASESORIA_PARAMETRO;
END SP_ACTUALIZAR_ASESORIA;

--LLamando al procedimiento.
exec SP_ACTUALIZAR_ASESORIA(SYSDATE,SYSDATE,316990,1,3,1,6);

--Validar Resultados
SELECT * FROM ASESORIA;




--PROCEDIMIENTO 15 (ELIMINAR ASESORIA (ELIMINACION FISICA))
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_ASESORIA
(ID_ASESORIA_PARAMETRO IN ASESORIA.ID_ASESORIA%TYPE) 
IS
BEGIN
  DELETE FROM ASESORIA WHERE ID_ASESORIA = ID_ASESORIA_PARAMETRO;
END SP_ELIMINAR_ASESORIA;

--LLamando al procedimiento.
exec SP_ELIMINAR_ASESORIA(6);

--Validar Resultados
SELECT * FROM ASESORIA;





--PROCEDIMIENTO 15.1 (ELIMINAR ASESORIA (ELIMINACION LOGICA))
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_ASESORIA_LOGICA
(ID_ASESORIA_PARAMETRO IN ASESORIA.ID_ASESORIA%TYPE) 
IS
BEGIN
  UPDATE ASESORIA
  SET ESTADO = 0
  WHERE ID_ASESORIA = ID_ASESORIA_PARAMETRO ;
END SP_ELIMINAR_ASESORIA_LOGICA;

--LLamando al procedimiento.
exec SP_ELIMINAR_ASESORIA_LOGICA(6);

--Validar Resultados
SELECT * FROM ASESORIA;





















--PROCEDIMIENTO 16 (INSERTAR LLAMADO)
--NO CACHO COMO SERA EL TEMA DEL ZENDESK
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_INSERTAR_LLAMADO
(ID_ASESORIA_PARAMETRO IN ASESORIA.ID_ASESORIA%TYPE,
FECHA_INICIO_PARAMETRO IN ASESORIA.FECHA_INICIO%TYPE,
FECHA_TERMINO_PARAMETRO IN ASESORIA.FECHA_TERMINO%TYPE,
COSTO_PARAMETRO IN ASESORIA.COSTO%TYPE,
ID_EMPRESA_PARAMETRO IN ASESORIA.ID_EMPRESA%TYPE,
ID_PROFESIONAL_PARAMETRO IN ASESORIA.ID_PROFESIONAL%TYPE,
ESTADO_PARAMETRO IN ASESORIA.ID_ASESORIA%TYPE) 
IS
BEGIN
  INSERT INTO LLAMADO VALUES (ID_ASESORIA_PARAMETRO,FECHA_INICIO_PARAMETRO,FECHA_TERMINO_PARAMETRO,COSTO_PARAMETRO,ID_EMPRESA_PARAMETRO,ID_PROFESIONAL_PARAMETRO,ESTADO_PARAMETRO); 
END SP_INSERTAR_LLAMADO;

--LLamando al procedimiento.
exec SP_INSERTAR_LLAMADO(6,SYSDATE,SYSDATE,25990,2,1,1);

--Validar Resultados
SELECT * FROM LLAMADO;









