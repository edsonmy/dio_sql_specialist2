
USE ecommerce

-------------------------------
-- tabela de clientes historico
-------------------------------
CREATE TABLE clients_historico(
	idClient int,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11),
    Address varchar(200)
);

 
-----------------------------------
-- criação da trigger before delete
-----------------------------------
CREATE OR REPLACE TRIGGER clients_hist
	BEFORE DELETE ON clients
    FOR EACH ROW
    BEGIN
		INSERT INTO clients_historico VALUES(null, old.Fname, old.Minit, old.Lname, old.CPF, old.address);
	END

-- DELETE FROM clients WHERE idClient = 7;

-----------------------------------
-- criação da trigger before update
-----------------------------------
CREATE OR REPLACE TRIGGER comission_seller
	BEFORE UPDATE ON seller
    FOR EACH ROW
    BEGIN
		SET new.comission = new.comission * 1.2;
	END

-- UPDATE seller SET comission = 1100.00 WHERE idSeller = 1;