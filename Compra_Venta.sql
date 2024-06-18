CREATE DATABASE SASFINAL;
USE SASFINAL;

CREATE TABLE Personal (
  NumSS INT NOT NULL,
  Nombre VARCHAR(45) NULL,
  ApePaterno VARCHAR(45) NULL,
  ApeMaterno VARCHAR(45) NULL,
  TelPersonal INT NULL,
  TelCasa INT NULL,
  FechaContrato DATE NULL,
  FecuenciaPago VARCHAR(15) NULL,
  SueldoBase DECIMAL(7,2) NULL,
  PRIMARY KEY (NumSS));

CREATE TABLE Clientes (
  RFC VARCHAR(13) NOT NULL,
  Nombre VARCHAR(45) NULL,
  ApePaterno VARCHAR(45) NULL,
  ApeMaterno VARCHAR(45) NULL,
  Calle VARCHAR(20) NULL,
  Num INT NULL,
  Colonia VARCHAR(45) NULL,
  CP INT NULL,
  Alcaldia VARCHAR(45) NULL,
  PRIMARY KEY (RFC));

CREATE TABLE Proveedores (
  RFC VARCHAR(13) NOT NULL,
  NomEmpresa VARCHAR(45) NULL,
  NombreRepresentante VARCHAR(45) NULL,
  ApeP_Representante VARCHAR(45) NULL,
  --TelContacto INT(10) NULL,
  TelContacto BIGINT,
  DiaPedido VARCHAR(15) NULL,
  DiaEntrega VARCHAR(15) NULL,
  TipoPago VARCHAR(45) NULL,
  PRIMARY KEY (RFC));

CREATE TABLE Productos (
  --CodProd INT NOT NULL AUTO_INCREMENT,
  CodProd INT NOT NULL IDENTITY(1,1),
  DescripL VARCHAR(45) NULL,
  DescripC VARCHAR(20) NULL,
  PrecioV DECIMAL(7,2) NULL,
  Existencias INT NULL,
  StockMin INT NULL,
  StockMax INT NULL,
  Oferta TINYINT NULL,
  PRIMARY KEY (CodProd));

CREATE TABLE Ventas (
  NumV INT NOT NULL,
  Fecha DATE NULL,
  Hora TIME NULL,
  Subtotal DECIMAL(7,2) NULL,
  IVA DECIMAL(7,2) NULL,
  Total DECIMAL(7,2) NULL,
  Clientes_RFC VARCHAR(13) NULL,
  Personal_NumSS INT NOT NULL,
  PRIMARY KEY (NumV),
  FOREIGN KEY (Clientes_RFC) REFERENCES Clientes(RFC),
  FOREIGN KEY (Personal_NumSS) REFERENCES Personal(NumSS));

CREATE TABLE ProductosVentas (
  Cantidad INT NULL,
  PrecioV DECIMAL(7,2) NULL,
  Subtotal_Prod DECIMAL(7,2) NULL,
  Ventas_NumV INT NOT NULL,
  Productos_CodProd INT NOT NULL,
  PRIMARY KEY (Ventas_NumV, Productos_CodProd),
  FOREIGN KEY (Ventas_NumV) REFERENCES Ventas(NumV),
  FOREIGN KEY (Productos_CodProd) REFERENCES Productos(CodProd));

CREATE TABLE Compras (
  --NumC INT NOT NULL AUTO_INCREMENT,
  NumC INT NOT NULL IDENTITY(1,1),
  FechaHoraP DATETIME NULL,
  FechaHoraE DATETIME NULL,
  TipoPago VARCHAR(15) NULL,
  Subtotal DECIMAL(7,2) NULL,
  IVA DECIMAL(7,2) NULL,
  Total DECIMAL(7,2) NULL,
  Proveedores_RFC VARCHAR(13) NULL,
  PRIMARY KEY (NumC),
  FOREIGN KEY (Proveedores_RFC) REFERENCES Proveedores(RFC));

CREATE TABLE ProductosCompras (
  Cantidad INT NULL,
  PrecioC DECIMAL(7,2) NULL,
  Subtotal_Prod DECIMAL(7,2) NULL,
  Compras_NumC INT NOT NULL,
  Productos_CodProd INT NOT NULL,
  PRIMARY KEY (Compras_NumC, Productos_CodProd),
  FOREIGN KEY (Compras_NumC) REFERENCES Compras(NumC),
  FOREIGN KEY (Productos_CodProd) REFERENCES Productos(CodProd));
/*Modificaciones */
ALTER TABLE Personal ADD 
Usuario VARCHAR(20),
Password VARCHAR(20)

ALTER TABLE Clientes ADD 
USUARIO  VARCHAR (20),
Password  VARCHAR(20)

EXEC sp_rename 'ProductosVentas', 'ProductosV';
EXEC sp_rename 'ProductosCompras','ProductosC';

ALTER TABLE Personal ADD Puesto VARCHAR(25);
-- en el caso que sea un alter a una columna ya generada 
ALTER TABLE Persona ALTER COLUMN Puesto VARCHAR(20);


/*Insert en personal*/
INSERT INTO personal (NumSS,Nombre,ApePaterno,ApeMaterno,TelPersonal,TelCasa,FechaContrato,FecuenciaPago,SueldoBase,Puesto)
 VALUES (167,'Hilda','Guzmán','Reyes',55456789,21572456,'2015-05-16','Semana',1200.00,'Ayudante');
INSERT INTO personal (NumSS,Nombre,ApePaterno,ApeMaterno,TelPersonal,TelCasa,FechaContrato,FecuenciaPago,SueldoBase,Puesto)
 VALUES (321,'Erendira','Del Valle','Merino',55123456,21573520,'1995-01-01','Quincena',3000.00,'Administrador');
INSERT INTO personal (NumSS,Nombre,ApePaterno,ApeMaterno,TelPersonal,TelCasa,FechaContrato,FecuenciaPago,SueldoBase,Puesto)
 VALUES (456,'Luis','Garcia','Becerril',55234567,21571234,'1995-01-01','Quincena',3000.00,'Administrador');
INSERT INTO personal (NumSS,Nombre,ApePaterno,ApeMaterno,TelPersonal,TelCasa,FechaContrato,FecuenciaPago,SueldoBase,Puesto)
 VALUES (687,'Veronica','Ordoñes','Flores',55001234,21579874,'2010-07-01','Semana',1000.00,'Ayudante');
INSERT INTO personal (NumSS,Nombre,ApePaterno,ApeMaterno,TelPersonal,TelCasa,FechaContrato,FecuenciaPago,SueldoBase,Puesto)
 VALUES (897,'Cristina','Monroy','Jimenez',55345678,21571265,'2016-01-16','Semana',1200.00,'Ayudante');

/*Insert en clientes*/
INSERT INTO clientes (RFC,Nombre,ApePaterno,ApeMaterno,Calle,Num,Colonia,CP,Alcaldia)
 VALUES ('CARH810911','Hilda','Guzmán','Reyes','Los Pinos',29,'La Peña',15230,'Milpa Alta');
INSERT INTO clientes (RFC,Nombre,ApePaterno,ApeMaterno,Calle,Num,Colonia,CP,Alcaldia)
 VALUES ('DOME751202','Erick','Dominguez','Morales','El Mirador',12,'Tejomulco',15225,'Milpa Alta');
INSERT INTO clientes (RFC,Nombre,ApePaterno,ApeMaterno,Calle,Num,Colonia,CP,Alcaldia)
 VALUES ('GUJA770724','Adriana','Guzmá¡n','Jimenez','Gladiolas',30,'Jazmin',15220,'Milpa Alta');
INSERT INTO clientes (RFC,Nombre,ApePaterno,ApeMaterno,Calle,Num,Colonia,CP,Alcaldia)
 VALUES ('REAM850330','Mauricio','Reyes','Aguilar','Las Flores',15,'La PeÃ±a',15230,'Milpa Alta');
INSERT INTO clientes (RFC,Nombre,ApePaterno,ApeMaterno,Calle,Num,Colonia,CP,Alcaldia)
 VALUES ('VIPI800215','Israel','Vigueras','Perez','Aldama',48,'Jazmin',15220,'Milpa Alta');

/*Insert en proveedores*/
INSERT INTO proveedores (RFC,NomEmpresa,NombreRepresentante,ApeP_Representante,TelContacto,DiaPedido,DiaEntrega,TipoPago)
 VALUES ('CCF911030','Coca-Cola','Esteban','Cruz',55999911,'Jueves','Jueves','Transferencia');
INSERT INTO proveedores (RFC,NomEmpresa,NombreRepresentante,ApeP_Representante,TelContacto,DiaPedido,DiaEntrega,TipoPago)
 VALUES ('CPC650101','Sabritas,Gamesa,Pepsi','Enrique','Marin',55999922,'Jueves','Viernes','Efectivo');
INSERT INTO proveedores (RFC,NomEmpresa,NombreRepresentante,ApeP_Representante,TelContacto,DiaPedido,DiaEntrega,TipoPago)
 VALUES ('GBI600203','Bimbo','Juan','Alcazar',55999999,'Lunes','Martes','Efectivo');

/*Insert en productos*/
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Pan tostado clásico','Pan T Clásico',35.00,8,1,10,1);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Pan integral grande','Pan Int Grnd',45.00,4,1,10,1);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Roles de canela glaseados','Roles Glas',20.00,5,1,10,0);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Panquecitos con chispas sabor chocolate','Panques Chispas Choc',25.00,5,1,10,0);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Donitas espolvoreadas','Donas Espolv',20.00,6,1,10,0);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Coca cola sabor original 235 ml botella de v','CocaCola vidrio 235',10.00,20,1,10,1);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Coca cola sabor original 600 ml no retornable','CocaCola 600',15.00,15,1,10,1);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Fanta sabor naranja 354 ml lata','Fanta lata',13.00,30,1,10,0);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Coca cola light 354 ml lata','CocaCola L lata',13.00,10,1,10,NULL);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Coca cola light 600 ml no retornable','CocaCola L 600',15.00,20,1,10,0);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Papas Sabritas adobadas 170 gr','PapasAdibadas ch',15.00,15,1,10,1);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Fritos limón 180 gr','Fritos ch',15.00,16,1,10,NULL);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Rufles de queso 200 gr','RuflesQ ch',15.00,17,1,10,NULL);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Churrumais 200 gr','Churrumais ch',15.00,18,1,10,NULL);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Gamesa Emperador de chocolate 200gr','Emperador choc ch',20.00,5,1,10,0);
INSERT INTO productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Gamesa Emperador piruetas limón 200gr','Emperador limón ch',20.00,6,1,10,1);

/*Insert en ventas*/
INSERT INTO ventas (NumV,Fecha,Hora,Subtotal,IVA,Total,Clientes_RFC,Personal_NumSS) VALUES (1,'2022-11-07','09:00:00',98.28,15.72,114.00,'CARH810911',321);
INSERT INTO ventas (NumV,Fecha,Hora,Subtotal,IVA,Total,Clientes_RFC,Personal_NumSS) VALUES (2,'2022-11-07','09:05:00',73.28,11.72,85.00,'DOME751202',321);
INSERT INTO ventas (NumV,Fecha,Hora,Subtotal,IVA,Total,Clientes_RFC,Personal_NumSS) VALUES (3,'2022-07-11','09:10:00',43.10,6.90,50.00,'CARH810911',456);
INSERT INTO ventas (NumV,Fecha,Hora,Subtotal,IVA,Total,Clientes_RFC,Personal_NumSS) VALUES (4,'2023-01-17','09:21:00',159.48,25.52,185.00,NULL,456);

/*Insert en productosv*/
INSERT INTO ProductosV (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (1,35.00,35.00,1,1);
INSERT INTO ProductosV (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (2,20.00,40.00,1,3);
INSERT INTO ProductosV (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (3,13.00,39.00,1,8);
INSERT INTO ProductosV (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (1,45.00,45.00,2,2);
INSERT INTO ProductosV (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (2,20.00,40.00,2,5);
INSERT INTO ProductosV (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (2,25.00,50.00,3,4);
INSERT INTO ProductosV (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (1,35.00,35.00,4,1);
INSERT INTO ProductosV (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (3,20.00,60.00,4,3);
INSERT INTO ProductosV (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (3,10.00,30.00,4,6);
INSERT INTO ProductosV (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (4,15.00,60.00,4,7);

/*Insert en compras*/

--INSERT INTO Compras (NumC,FechaHoraP,FechaHoraE,TipoPago,Subtotal,IVA,Total,Proveedores_RFC)
-- VALUES (1050,'2022-01-20 00:00:00','2022-01-21 00:00:00','Efectivo',2198.28,351.72,2550.00,'CCF911030');
--INSERT INTO Compras (NumC,FechaHoraP,FechaHoraE,TipoPago,Subtotal,IVA,Total,Proveedores_RFC)
-- VALUES (1119,'2022-01-15 00:00:00','2022-01-15 00:00:00','Transferencia',1482.76,237.24,1720.00,'CPC650101');

INSERT INTO Compras (NumC,FechaHoraP,FechaHoraE,TipoPago,Subtotal,IVA,Total,Proveedores_RFC)
 VALUES (1050,'2022-01-20 00:00:00','2022-01-21 00:00:00','Efectivo',2198.28,351.72,2550.00,'CCF911030');
INSERT INTO Compras (NumC,FechaHoraP,FechaHoraE,TipoPago,Subtotal,IVA,Total,Proveedores_RFC)
 VALUES (1119,'2022-01-15 00:00:00','2022-01-15 00:00:00','Transferencia',1482.76,237.24,1720.00,'CPC650101');


/*Insert en productosc*/
INSERT INTO ProductosC (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (50,7.00,350.00,1050,6);
INSERT INTO ProductosC (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (50,12.00,600.00,1050,7);
INSERT INTO ProductosC (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (50,10.00,500.00,1050,8);
INSERT INTO ProductosC (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (50,10.00,500.00,1050,9);
INSERT INTO ProductosC (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (50,12.00,600.00,1050,10);


INSERT INTO ProductosC (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (20,13.00,260.00,1119,11);
INSERT INTO ProductosC (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (20,13.00,260.00,1119,12);
INSERT INTO ProductosC (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (20,13.00,260.00,1119,13);
INSERT INTO ProductosC (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (20,13.00,260.00,1119,14);
INSERT INTO ProductosC (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (20,17.00,340.00,1119,15);
INSERT INTO ProductosC (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (20,17.00,340.00,1119,16);


/*parte 2 */
-- Aqui vemos los productos que son comprados a los proveedores  

-- detalles generales de todas las compras generadas a nuestros proveedores  
SELECT * FROM ProductosC inner join Compras   
on ProductosC.Compras_NumC = Compras.NumC
inner join Productos 
on ProductosC.Productos_CodProd = Productos.CodProd 
WHERE Proveedores_RFC='CCF911030';

--Detalles de la compra: desgloce 
SELECT * FROM ProductosC inner join Compras   
on ProductosC.Compras_NumC = Compras.NumC
inner join Productos 
on ProductosC.Productos_CodProd = Productos.CodProd 
WHERE Compras_Numc='1000' AND Proveedores_RFC='CCF911030';


SELECT * FROM Compras;

SELECT * FROM ProductosC

-- por otra parte lo que insertamos primeramente es el total
INSERT INTO Compras 
(NumC,FechaHoraP,FechaHoraE,TipoPago,Subtotal,IVA,Total,Proveedores_RFC)
 VALUES (1000,'2022-03-08 00:00:00','2022-03-09 00:00:00','Efectivo',1482.76,237.24,1720.00,'CCF911030');
--despues viene el desgloce  
INSERT INTO ProductosC VALUES (20,7,140,1000,6);
INSERT INTO productosC VALUES (20,12,240,1000,7);
INSERT INTO productosC VALUES (20,10,200,1000,8);
INSERT INTO productosC VALUES (20,10,200,1000,9);
INSERT INTO productosC VALUES (20,12,240,1000,10);

--finalmente la modificacion del total 
UPDATE Compras SET 
Subtotal = '1020', 
IVA = '163.20',
TOTAL ='1183.20'
WHERE NumC='1000'


INSERT INTO Compras (NumC,FechaHoraP,FechaHoraE,TipoPago,Subtotal,IVA,Total,Proveedores_RFC)
 VALUES (1001,'2022-03-08 00:00:00','2022-03-09 00:00:00','Efectivo',1482.76,237.24,1720.00,'CPC650101');

INSERT INTO productosC VALUES (15,13,195,1001,11);
INSERT INTO productosC VALUES (15,13,195,1001,12);
INSERT INTO productosC VALUES (15,13,195,1001,13);
INSERT INTO productosC VALUES (15,13,195,1001,14);
INSERT INTO productosC VALUES (15,17,255,1001,15);
INSERT INTO productosC VALUES (15,17,255,1001,16);

UPDATE Compras SET 
Subtotal = '1095', 
IVA = '175.2',
TOTAL ='1270.2'
WHERE NumC='1001';

INSERT INTO Compras (NumC,FechaHoraP,FechaHoraE,TipoPago,Subtotal,IVA,Total,Proveedores_RFC)
 VALUES (1002,'2022-08-08 00:00:00','2022-08-09 00:00:00','Efectivo',1482.76,237.24,1720.00,'GBI600203');

INSERT INTO productosC VALUES (10,32,320,1002,1);
INSERT INTO productosC VALUES (10,50,500,1002,2);
INSERT INTO productosC VALUES (10,29,290,1002,3);
INSERT INTO productosC VALUES (10,29,290,1002,4);
INSERT INTO productosC VALUES (10,21,210,1002,5);

UPDATE Compras SET 
Subtotal = '1610', 
IVA = '257.6',
TOTAL ='1867.6'
WHERE NumC='1002';

-- ahora haciendo un enfoque a las ventas  
SELECT * FROM Ventas;

INSERT INTO Ventas VALUES ('10','2023-01-18','10:00','18.10','2.90','21',NULL,897);
INSERT INTO productosv VALUES ('2','15','30','10','14' )
INSERT INTO productosv VALUES ('2','20','40','10','15' )
INSERT INTO productosv VALUES ('2','20','40','10','16' )

UPDATE Ventas SET 
Subtotal = '94.83', 
IVA = '15.17',
TOTAL ='110'
WHERE NumV='10';

INSERT INTO Proveedores VALUES ('TEP961122','Cooperativa Pascual','Jorge','Juarez',5566771111,'Lunes','Lunes','Transferencia');

SELECT * FROM Productos;
SELECT * FROM Proveedores;