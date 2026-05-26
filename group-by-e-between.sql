SELECT 
    C.Nome AS Cidade,
    COUNT(U.Id) AS TotalUsuarios
FROM Cidade C
LEFT JOIN Usuario U ON C.Id = U.CidadeId
GROUP BY C.Id;

SELECT 
    C.Estado,
    COUNT(U.Id) AS TotalUsuarios
FROM Cidade C
LEFT JOIN Usuario U ON C.Id = U.CidadeId
GROUP BY C.Estado;

SELECT * 
FROM Cidade
WHERE Id BETWEEN 2 AND 4;

SELECT *
FROM Pedido
WHERE valorTotal BETWEEN 400 AND 600;