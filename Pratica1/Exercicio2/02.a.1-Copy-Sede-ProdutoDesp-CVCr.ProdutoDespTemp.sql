USE[ASI]
GO

--TODO: Comment stvar in batch/SSMS: Activate Query>SQLCMD Mode
--:setvar CVCr MIRANDA-LAPTOP\SQL2012DEINST2

DELETE FROM [$(CVCr)].[ASI].[dbo].[ProdutoDespTemp]

INSERT INTO 
	[$(CVCr)].[ASI].[dbo].[ProdutoDespTemp]
SELECT [cod]
      ,[preco]
      ,[qtStock]
      ,[qtMinStock]
FROM [dbo].[ProdutoDesp]
	
--SELECT * FROM [$(CVCr)].[ASI].[dbo].[ProdutoDespTemp]