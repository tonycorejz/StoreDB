set LANGUAGE 'Russian'
use Magazin;
GO
/*1. Формирование графика работы определенного сотрудника в определенное время*/
SELECT
'ФИО Сотрудника'=ST.Familiya+' '+ST.Imya+' '+ST.Otchestvo,
PM.Adres as 'Адрес',
GR.Nachalo_smeni as 'Начало смены',
GR.Konec_smeni as 'Конец смены',
GR.Data as 'Дата'
FROM
dbo.Grafik_raboti_sotrudnikov GR
INNER JOIN dbo.Sotrudnik ST
ON GR.Kod_sotrudnika=ST.Kod_sotrudnika
INNER JOIN dbo.Pomeshenie PM
ON GR.Kod_Pomesheniya=PM.Kod_Pomesheniya
WHERE
ST.Familiya='Коровин'
and
ST.Imya='Михаил'
and
ST.Otchestvo='Витальевич'
and
GR.Data>='2019-06-13'
and
GR.Data<='2019-06-13'
ORDER BY
GR.Data DESC
GO

/*2. Формирование отчета о товарах в зале и их срока годности*/
SELECT
TV.Kod_tovara as 'Код товара',
TV.Srok_godnosti as 'Срок годности',
PT.Data_proizvodstva as 'Дата производства',
'Текущая дата' = CAST(Getdate() AS Date)
FROM
dbo.[Detalizaciya_postavok] SP
INNER JOIN dbo.Tovar TV
ON SP.Kod_tovara=TV.Kod_tovara
INNER JOIN dbo.Postavka_tovara PT
ON PT.Kod_Postavki_tovara=SP.Kod_Postavki_tovara
WHERE
TV.Kod_sotrudnika IS NOT NULL
GO

/*3. Формирование информации о конкретном оборудовании в определенном Магазине сети*/
SELECT
PM.Adres as 'Адрес',
OB.Naimenovanie as 'Название оборудования',
OB.Garantiyniy_srok as 'Гарантия до',
YH.Vid_oborudovaniya as 'Вид оборудования'
FROM
dbo.Oborudovanie OB
INNER JOIN dbo.Pomeshenie PM
ON OB.Kod_Pomesheniya=PM.Kod_Pomesheniya
INNER JOIN dbo.Ysloviya_hraneniya YH
ON OB.Kod_Yslovii_hraneniya=YH.Kod_Yslovii_hraneniya
WHERE
PM.Adres = 'Олеко Дундича 21'
GO

/*4. Информация о суммен всех оплат с использованием наличного расчета*/
SELECT 
SUM(Sumarnaya_stoimost) AS [Общая сумма]
FROM dbo.Oplata
WHERE Kod_sposoba_oplati
IN(
	SELECT Kod_sposoba_oplati
	FROM dbo.Sposob_oplati
	WHERE Naimenovanie = 'Наличный расчёт'
)
GO
/*5. Формирование прибыли за каждый постанный класс спецификации товара*/
SELECT
SC.Naimenovanie_tovara as 'Название',
'Прибыль' = SC.Cena - SP.Cena
FROM
dbo.[Detalizaciya_postavok] SP
INNER JOIN dbo.Tovar TV
ON SP.Kod_tovara=TV.Kod_tovara
INNER JOIN dbo.Specifikaciya SC
ON TV.Kod_specifikacii=SC.Kod_specifikacii
GO

/*6. Формирование Информации о статусе заказа, Сотрудника заказавшего его, а также Сортировка по дате заказа*/
SELECT
'Имя Сотрудника' = ST.Familiya + ' ' + ST.Imya + ' ' + ST.Otchestvo,
'Должность' = DZ.Naimenovanie,
'Статус заказа' = SZ.Naimenovanie,
'Дата заказа' = PT.Data_zakaza_tovara
FROM
dbo.Postavka_tovara PT
INNER JOIN dbo.Sotrudnik ST
ON ST.Kod_sotrudnika=PT.Kod_sotrudnika
INNER JOIN dbo.Dolznost DZ
ON DZ.Kod_dolznosti=ST.Kod_dolznosti
INNER JOIN dbo.Status_zakaza_tovara SZ
ON SZ.Kod_statusa=PT.Kod_statusa
ORDER BY
PT.Data_zakaza_tovara
GO

/*7. Сумма продаж в разрезе Каждого сотрудника*/
SELECT
'Имя Сотрудника' = ST.Familiya + ' ' + ST.Imya + ' ' + ST.Otchestvo,
'Должность' = DZ.Naimenovanie,
SUM(OP.Sumarnaya_stoimost) AS 'Общая сумма продаж'
FROM
dbo.Oplata OP
INNER JOIN dbo.Sotrudnik ST
ON ST.Kod_sotrudnika=OP.Kod_sotrudnika
INNER JOIN dbo.Dolznost DZ
ON DZ.Kod_dolznosti=ST.Kod_dolznosti
GROUP BY
ST.Familiya,ST.Imya,ST.Otchestvo,DZ.Naimenovanie
GO