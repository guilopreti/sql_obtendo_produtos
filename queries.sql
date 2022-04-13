--Criar uma tabela chamada produtos:
CREATE TABLE IF NOT EXISTS produtos(
  id BIGSERIAL PRIMARY KEY,
  nome VARCHAR(128) NOT NULL UNIQUE,
  categoria VARCHAR(128) NOT NULL,
  price DECIMAL(100, 2) NOT NULL
);

--Renomear a coluna price para preco;
ALTER TABLE produtos
	RENAME price TO preco
;

--INSERINDO VALORES DO produtos.sql
INSERT INTO
  produtos(nome, categoria, preco)
VALUES
  ('Geladeira', 'Eletro', 2997.00),
  ('Micro-ondas', 'eletro', 499.99),
  ('Fogão', 'eletro', 489.00),
  ('Lava-louças', 'Eletro', 1899.00),
  ('Maquina de Lavar', 'Eletro', 3959.00),
  ('Notebook', 'Informática', 6999.00),
  ('Mouse', 'Informática', 89.90),
  ('Teclado', 'Informática', 299.00),
  ('Impressora', 'Informática', 1129.90),
  ('Monitor 4k', 'Informática', 2999.00),
  ('Modem', 'Informática', 199.90),
  ('Headset', 'Informática', 329.99),
  ('Webcam', 'Informática', 249.90),
  ('Secador de cabelo', 'Eletro', 97.00),
  ('Chapinha', 'eletro', 59.90),
  ('Quadro floral', 'Decoração', 199.00),
  ('Vaso de cerâmica', 'Decoração', 159.00),
  ('Luminária de mesa', 'Decoração', 299.00),
  ('Quadro listrado', 'decoração', 199.00),
  ('Quadro xadrez', 'decoração', 199.00),
  ('Nobreak', 'Informática', 2199.00),
  ('Tablet', 'Informática', 697.90),
  ('Estante de livros', 'Moveis', 299.00),
  ('Sofá', 'moveis', 1999.00),
  ('Mesa', 'Moveis', 997.90),
  ('Guarda-roupa', 'moveis', 799.99),
  ('Cama de solteiro', 'Moveis', 699.00),
  ('Cama de casal', 'moveis', 1699.00),
  ('Cama de casal King', 'Moveis', 2799.00),
  ('Televisão 24"', 'Eletro', 1009.00),
  ('Televisão 32"', 'Eletro', 1809.00),
  ('Televisão 42"', 'Eletro', 2209.00),
  ('Televisão 52"', 'Eletro', 2999.00),
  ('Mesa de centro', 'Moveis', 597.90),
  ('Guarda-roupa pequeno', 'Moveis', 299.00),
  ('Mesa de cabeceira', 'Moveis', 199.00),
  ('Mouse Gamer', 'informática', 289.90),
  ('Teclado Gamer', 'informática', 289.90),
  ('Mousepad', 'informática', 89.90),
  ('Cadeira de escritório', 'moveis', 699.00),
  ('Cadeira de madeira', 'moveis', 98.00),
  ('Sapateira', 'Moveis', 199.90),
  ('Escrivaninha', 'Moveis', 499.00)
;

--Remover o produto de nome "Webcam";
DELETE FROM produtos
	WHERE nome = 'Webcam'
    RETURNING *
;

--Alterar o preço do produto de nome "Cama de casal" para 1899,99;
UPDATE produtos
	SET preco = 1899.99
	WHERE nome = 'Cama de casal'
	RETURNING *
;

--Obter a lista completa;
SELECT * FROM produtos;

--Obter o nome dos produtos que custam mais que 1000.00;
SELECT nome 
	FROM produtos 
    WHERE preco > 1000
;

--Obter a lista de produtos que iniciam com "T";
SELECT *
	FROM produtos
    WHERE nome LIKE 'T%'
;

--Obter a lista de produtos que contem "Gamer";
SELECT *
	FROM produtos
    WHERE nome ILIKE '%Gamer%'
;

--Obter a quantidade total de produtos;
SELECT COUNT(*) total_produtos FROM produtos;

--Obter o preço do produto mais caro;
SELECT MAX(preco) preco_produto_mais_caro FROM produtos;

--Obter a média de preço da lista;
SELECT AVG(preco) media_preco FROM produtos;

--Obter a média de preço dos produtos que começam com a letra "M";
SELECT AVG(preco) media_preco_M FROM produtos
	WHERE nome LIKE 'M%'
;

--Obter a soma do preço de todos os itens da lista;
SELECT SUM(preco) sum_precos FROM produtos;

--Obter a lista dos produtos ordenada alfabeticamente;
SELECT * FROM produtos ORDER BY nome;

--Obter a lista dos produtos do maior para o menor preço;
SELECT * FROM produtos ORDER BY preco DESC;

--Obter a quantidade de produtos por categoria
SELECT UPPER(categoria) categoria,
	COUNT(*) quantidade
    FROM produtos
	GROUP BY UPPER(categoria)
;

--Obter a média de preço por categoria;
SELECT UPPER(categoria) categoria,
	AVG(preco) preco_media
    FROM produtos
    GROUP BY UPPER(categoria)
;

--Obter o preço do produto mais barato por categoria;
SELECT UPPER(categoria) categoria,
	MIN(preco) menor_preco
    FROM produtos
    GROUP BY UPPER(categoria)
;

--Obter a quantidade de produtos com valor abaixo de 1000.00, separadas por categoria;
SELECT UPPER(categoria) categoria,
	COUNT(*) quantidade
    FROM produtos
    WHERE preco < 1000
	GROUP BY UPPER(categoria)
;