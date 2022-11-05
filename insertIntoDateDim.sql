DECLARE @CurrentDate DATE ='2010-12-29'
DECLARE @EndDate DATE = '2013-12-28'
WHILE @CurrentDate <= @EndDate
   BEGIN
     INSERT INTO [dbo].[DimDate] (
	  [DateKey],
	  [FullDateAlternateKey],
	  [DayNumberOfWeek],
	  [EnglishDayNameOfWeek],
	  [FrenchDayNameOfWeek],
	  [SpanishDayNameOfWeek],
	  [DayNumberOfMonth],
	  [DayNumberOfYear],
	  [WeekNumberOfYear],
	  [EnglishMonthName],
	  [FrenchMonthName],
	  [SpanishMonthName],
	  [MonthNumberOfYear],
	  [CalendarQuarter],
	  [CalendarYear],
	  [CalendarSemester],
	  [FiscalQuarter],
	  [FiscalYear],
	  [FiscalSemester]
	    )
	  SELECT DateKey = YEAR(@CurrentDate) * 10000 + MONTH(@CurrentDate) * 100 + DAY(@CurrentDate),
	  FullDateAlternateKey = @CurrentDate,
	  DayNumberOfWeek = DATEPART(dw, @CurrentDate),
	  EnglishDayNameOfWeek = DATENAME(dw,@CurrentDate),
	  FrenchDayNameOfWeek = Format(@CurrentDate, 'dddd', 'fr-FR'),
	  SpanishDayNameOfWeek = Format(@CurrentDate, 'dddd' , 'es-ES'),
	  [DayNumberOfMonth] = DAY(@CurrentDate),
	  [DayNumberOfYear] = DATENAME(dy,@CurrentDate),
	  [WeekNumberOfYear] = DATEPART(wk, @CurrentDate),
	  [EnglishMonthName] = DATENAME(mm, @CurrentDate),
	  [SpanishMonthName] = Format(@CurrentDate, 'MMMM','es-ES'),
	  [FrenchMonthName] = Format(@CurrentDate, 'MMMM','fr-FR'),
	  [MonthNumberOfYear] = MONTH(@CurrentDate),
	  [CalendarQuarter] = DATEPART(q, @CurrentDate),
	  [CalendarYear] = YEAR(@CurrentDate),
	  [CalendarSemester] = ((DATEPART(QUARTER,@CurrentDate)-1)/2)+1,
	  [FiscalQuarter] = ((DATEPART(QUARTER,@CurrentDate)-1)/2)+1,
	  [FiscalYear] = YEAR(DATEADD(month,4,@CurrentDate)),


	  CASE WHEN DATEPART(quarter,@CurrentDate) >= 3 THEN 1 ELSE 2 END as [FiscalSemester]
	  SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)

 END
