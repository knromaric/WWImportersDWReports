SELECT t3.[Calendar Year] as OrderCalendarYear
, t3.[Calendar Month Number] as OrderCalendarMonth
, t3.Date as OrderDate
, t2.[Stock Item]
, SUM(t1.Quantity) as [Quantity Ordered]
, SUM(t1.[Total Excluding Tax]) as [Total Excluding Tax]
FROM [Fact].[Order] t1
INNER JOIN [Dimension].[Stock Item] t2 on t1.[Stock Item Key] = t2.[Stock Item Key]
INNER JOIN Dimension.Date t3 ON t1.[Order Date Key] = t3.Date
GROUP BY t3.[Calendar Year], t3.[Calendar Month Number], t3.Date, t2.[Stock Item]
ORDER BY t3.[Calendar Year], t3.[Calendar Month Number], t3.Date, t2.[Stock Item];