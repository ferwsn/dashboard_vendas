	-- clientes --
	SELECT clt.cd_cliente, 
		   clt.ds_cliente,
		   clt.tp_genero,
		   clt.dt_nascimento,
		   clt.ds_cidade,
		   clt.ds_estado,
		   DATEDIFF(YEAR, dt_nascimento, GETDATE()) AS nr_idade,
		   (SELECT CAST(SUM(ped.nr_valor) / SUM(ped.qt_item) AS DECIMAL(10,2))
			  FROM pedidos ped
			 WHERE ped.cd_cliente = clt.cd_cliente) AS vl_tkm
	  FROM clientes clt; 

    -- produtos --
	SELECT prd.cd_produto, 
		   prd.ds_produto,
		   prd.tp_categoria,
		   prd.nr_valor,
		   prd.qt_estoque,
		   MAX(prod.dt_producao) AS dt_ultentrada	
	  FROM produtos prd,
	       producao prod
	 WHERE prd.cd_produto = prod.cd_produto
  GROUP BY prd.cd_produto,
		   prd.ds_produto,
		   prd.tp_categoria,
		   prd.nr_valor,
		   prd.qt_estoque;

	-- pedidos --
	SELECT ped.cd_pedido, 
		   ped.dt_pedido,
		   ped.cd_cliente,
		   cli.ds_cliente,
		   ped.cd_produto,
		   prd.ds_produto,
		   ped.qt_item,
		   ped.nr_valor
	  FROM pedidos ped,
		   clientes cli,
		   produtos prd
	 WHERE ped.cd_cliente = cli.cd_cliente
	   AND ped.cd_produto = prd.cd_produto;

	-- acessos --
	SELECT acs.cd_acesso,
		   acs.dt_acesso,
		   acs.cd_cliente,
		   (SELECT cli.ds_cliente
		      FROM clientes cli
			 WHERE cli.cd_cliente = acs.cd_cliente) AS ds_cliente,
		   acs.tp_origem
	  FROM acessos acs;

 	-- produção --
	SELECT prod.cd_op,
		   prod.cd_produto,
		   prd.ds_produto,
		   prod.qt_produto,
		   prod.dt_producao,
		   prd.nr_valor
	  FROM producao prod,
	       produtos prd
	 WHERE prd.cd_produto = prod.cd_produto;

	-- faturamento --
	SELECT fat.dt_faturamento,
		   fat.cd_pedido,
		   fat.cd_produto,
		   (SELECT prd.ds_produto
		      FROM produtos prd
			 WHERE prd.cd_produto = fat.cd_produto) AS ds_produto,
		   fat.qt_item,
		   fat.vl_pedido
	  FROM faturamento fat
  ORDER BY fat.dt_faturamento DESC;