USE WideWorldImportersDW
GO

SELECT t2.Color color
	,t3.[Calendar Month Number]
	,cast(t3.[Calendar Year]*10000 + t3.[Calendar Month Number]*100 + t3.[Day Number] as varchar(8)) as [Order date]
	,t2.[WWI Stock Item ID] as StockItemID
	,t4.[Postal Code]
	,t1.Quantity as [Quantity Ordered]
	,t1.[Total Excluding Tax] as [Total Excluding Tax]
	,t1.[Tax Rate]
	,t1.Description as [Description]
FROM Fact.[Order] t1
INNER JOIN Dimension.[Stock Item] t2 ON t1.[Stock Item Key] = t2.[Stock Item Key]
INNER JOIN Dimension.[Date] t3 ON t1.[Order Date Key] = t3.[Date]
INNER JOIN Dimension.Customer t4 ON t1.[Customer Key] = t4.[Customer Key]
ORDER BY [Order Date]