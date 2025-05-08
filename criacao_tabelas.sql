	CREATE TABLE produtos (
		cd_produto INT PRIMARY KEY IDENTITY(1,1),
		ds_produto VARCHAR(100),
		tp_categoria VARCHAR(100), -- CAMISA, CAMISETA, CALÇA, JAQUETA OU SAPATO --
		nr_valor DECIMAL(10,2),
		qt_estoque INT)
	
	CREATE TABLE pedidos (
		cd_pedido INT PRIMARY KEY IDENTITY(1,1),
		dt_pedido DATE,
		cd_cliente INT, -- FOREIGN KEY --
		cd_produto INT, -- FOREIGN KEY --
		qt_item INT,
		nr_valor DECIMAL(10,2))

	CREATE TABLE clientes (
		cd_cliente INT PRIMARY KEY IDENTITY(1,1),
		ds_cliente VARCHAR(100),
		tp_genero VARCHAR(36), -- MASCULINO OU FEMININO --
		dt_nascimento DATE,
		ds_cidade VARCHAR(100),
		ds_estado VARCHAR(36))

	CREATE TABLE acessos (
		cd_acesso INT PRIMARY KEY IDENTITY(1,1),
		dt_acesso DATE,
		cd_cliente INT, -- FOREIGN KEY --
		tp_origem VARCHAR(36)) -- (TRAFEGO PAGO, REDES SOCIAIS OU ORGANICO) --

	CREATE TABLE producao (
		cd_op INT PRIMARY KEY IDENTITY(1,1),
		cd_produto INT, -- FOREIGN KEY --
		qt_produto INT,
		dt_producao DATE)

	CREATE TABLE faturamento (
		dt_faturamento DATE,
		cd_pedido INT PRIMARY KEY,
		cd_produto INT, -- FOREIGN KEY --
		qt_item INT,
		vl_pedido DECIMAL(10,2))