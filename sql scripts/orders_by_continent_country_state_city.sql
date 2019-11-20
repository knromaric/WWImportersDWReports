SELECT t2.Continent as Continent
	, t2.Country as Country
	, t2.[State Province] as State_Province
	, t2.City as City
	, SUM(t1.Quantity) as [Quantity Ordered]
	, SUM(t1.[Total Excluding Tax]) as [Total Excluding Tax]
FROM [Fact].[Order] t1
INNER JOIN [Dimension].[City] t2 on t1.[City Key] = t2.[City Key]
GROUP BY t2.Continent, t2.Country, t2.[State Province], t2.City
ORDER BY t2.Continent, t2.Country, t2.[State Province], t2.City