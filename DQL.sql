set LANGUAGE 'Russian'
use Magazin;
GO
/*1. ������������ ������� ������ ������������� ���������� � ������������ �����*/
SELECT
'��� ����������'=ST.Familiya+' '+ST.Imya+' '+ST.Otchestvo,
PM.Adres as '�����',
GR.Nachalo_smeni as '������ �����',
GR.Konec_smeni as '����� �����',
GR.Data as '����'
FROM
dbo.Grafik_raboti_sotrudnikov GR
INNER JOIN dbo.Sotrudnik ST
ON GR.Kod_sotrudnika=ST.Kod_sotrudnika
INNER JOIN dbo.Pomeshenie PM
ON GR.Kod_Pomesheniya=PM.Kod_Pomesheniya
WHERE
ST.Familiya='�������'
and
ST.Imya='������'
and
ST.Otchestvo='����������'
and
GR.Data>='2019-06-13'
and
GR.Data<='2019-06-13'
ORDER BY
GR.Data DESC
GO

/*2. ������������ ������ � ������� � ���� � �� ����� ��������*/
SELECT
TV.Kod_tovara as '��� ������',
TV.Srok_godnosti as '���� ��������',
PT.Data_proizvodstva as '���� ������������',
'������� ����' = CAST(Getdate() AS Date)
FROM
dbo.[Detalizaciya_postavok] SP
INNER JOIN dbo.Tovar TV
ON SP.Kod_tovara=TV.Kod_tovara
INNER JOIN dbo.Postavka_tovara PT
ON PT.Kod_Postavki_tovara=SP.Kod_Postavki_tovara
WHERE
TV.Kod_sotrudnika IS NOT NULL
GO

/*3. ������������ ���������� � ���������� ������������ � ������������ �������� ����*/
SELECT
PM.Adres as '�����',
OB.Naimenovanie as '�������� ������������',
OB.Garantiyniy_srok as '�������� ��',
YH.Vid_oborudovaniya as '��� ������������'
FROM
dbo.Oborudovanie OB
INNER JOIN dbo.Pomeshenie PM
ON OB.Kod_Pomesheniya=PM.Kod_Pomesheniya
INNER JOIN dbo.Ysloviya_hraneniya YH
ON OB.Kod_Yslovii_hraneniya=YH.Kod_Yslovii_hraneniya
WHERE
PM.Adres = '����� ������� 21'
GO

/*4. ���������� � ������ ���� ����� � �������������� ��������� �������*/
SELECT 
SUM(Sumarnaya_stoimost) AS [����� �����]
FROM dbo.Oplata
WHERE Kod_sposoba_oplati
IN(
	SELECT Kod_sposoba_oplati
	FROM dbo.Sposob_oplati
	WHERE Naimenovanie = '�������� ������'
)
GO
/*5. ������������ ������� �� ������ ��������� ����� ������������ ������*/
SELECT
SC.Naimenovanie_tovara as '��������',
'�������' = SC.Cena - SP.Cena
FROM
dbo.[Detalizaciya_postavok] SP
INNER JOIN dbo.Tovar TV
ON SP.Kod_tovara=TV.Kod_tovara
INNER JOIN dbo.Specifikaciya SC
ON TV.Kod_specifikacii=SC.Kod_specifikacii
GO

/*6. ������������ ���������� � ������� ������, ���������� ����������� ���, � ����� ���������� �� ���� ������*/
SELECT
'��� ����������' = ST.Familiya + ' ' + ST.Imya + ' ' + ST.Otchestvo,
'���������' = DZ.Naimenovanie,
'������ ������' = SZ.Naimenovanie,
'���� ������' = PT.Data_zakaza_tovara
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

/*7. ����� ������ � ������� ������� ����������*/
SELECT
'��� ����������' = ST.Familiya + ' ' + ST.Imya + ' ' + ST.Otchestvo,
'���������' = DZ.Naimenovanie,
SUM(OP.Sumarnaya_stoimost) AS '����� ����� ������'
FROM
dbo.Oplata OP
INNER JOIN dbo.Sotrudnik ST
ON ST.Kod_sotrudnika=OP.Kod_sotrudnika
INNER JOIN dbo.Dolznost DZ
ON DZ.Kod_dolznosti=ST.Kod_dolznosti
GROUP BY
ST.Familiya,ST.Imya,ST.Otchestvo,DZ.Naimenovanie
GO