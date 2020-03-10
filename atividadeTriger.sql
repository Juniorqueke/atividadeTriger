CREATE TABLE produto (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    valor FLOAT
)  ENGINE=INNODB;

insert into produto values (1,'Tv',900.00);
SELECT 
    *
FROM
    produto;

CREATE TABLE usuario (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80)
)  ENGINE=INNODB;

SELECT 
    *
FROM
    usuario;
    
insert into usuario values (1,'Asdrubal');

CREATE TABLE logProduto (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    produto INT NOT NULL,
    usuario INT NOT NULL,
    dataHora DATETIME,
    valorAntigo FLOAT,
    valorNovo FLOAT,
    CONSTRAINT fk_produto FOREIGN KEY (produto)
        REFERENCES produto (id),
    CONSTRAINT fk_usuario FOREIGN KEY (usuario)
        REFERENCES usuario (id)
)  ENGINE=INNODB;

drop trigger tg_logProduto;

DELIMITER $$
create trigger tg_logProduto after update on produto
for each row
begin 
	insert into logProduto (produto,usuario,dataHora,valorAntigo,valorNovo)
    values (new.id,@usuariologado,now(),old.valor,new.valor);
end$$

DELIMITER ;

CREATE TABLE pedido (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    produto INT NOT NULL,
    quantidade INT NOT NULL,
    CONSTRAINT fk_produto FOREIGN KEY (produto)
        REFERENCES produto (id)
)  ENGINE=INNODB;

create table estoque (
produto varchar (80) not null primary key,
saldo int not null
) ENGINE=INNODB;

#atualizando o campo valor na tabela produto
UPDATE produto 
SET 
    valor = 1500
WHERE
    id = 1;
select * from logProduto;

set @usuariologado = 1;