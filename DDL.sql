--set LANGUAGE 'Russian'
USE master
GO
DROP DATABASE Magazin
GO
create DATABASE Magazin
GO
use Magazin
GO
/*0 уровень*/
create TABLE [Dolznost] ([Kod_dolznosti] int primary key, [Naimenovanie] varchar(250));
GO
create TABLE [Sposob_oplati] ([Kod_sposoba_oplati] int primary key, [Naimenovanie] varchar(250));
GO
create TABLE [Kategoriya_tovara] ([Kod_kategorii_tovara] int primary key, [Naimenovanie] varchar(250));
GO
create TABLE [Status_zakaza_tovara] ([Kod_statusa] int primary key, [Naimenovanie] varchar(250));
GO
/*create TABLE [Vid_oborudovaniya] ([Kod_Vida_oborudovaniya] int primary key, [Naimenovanie] varchar(250));
GO*/



/*1 уровень*/
/*create TABLE [Pomeshenie] ([Kod_pomesheniya] int primary key, [Adress] varchar(250), [Grafik_raboti] varchar(250));
GO*/
create TABLE [Pomeshenie] (
	[Kod_Pomesheniya] int primary key, 
	[FIO_upravlyayshego] varchar (250), /*нужно уменьшить варчар*/
	[Adres] varchar (250),
	[Grafik_raboti_magazina] varchar (250));
GO

create TABLE [Sotrudnik] (
	[Kod_sotrudnika] int primary key, 
	[Familiya] varchar(250), 
	[Imya] varchar(250), 
	[Otchestvo] varchar(250), 
	[Kod_dolznosti] int,

foreign key([Kod_dolznosti]) references [Dolznost]([Kod_dolznosti]));
GO

create TABLE [Ysloviya_hraneniya] (
	[Kod_Yslovii_hraneniya] int primary key, 
	[Vid_oborudovaniya] varchar(250));

GO

create TABLE [Postavshchick] (
	[Kod_Postavshchicka] int primary key, 
	[Telefon] varchar (250), /*нужно уменьшить варчар*/
	[Adres] varchar (250),
	[Naimenovanie] varchar (250));

GO

/*2 уровень*/
create TABLE [Grafik_raboti_sotrudnikov] (
	[Kod_Grafika_raboti_sotrudnikov] int primary key, 
	[Nachalo_smeni] time(0),
	[Konec_smeni] time(0),
	[Data] date,
	[Kod_sotrudnika] int,
	[Kod_Pomesheniya] int,

foreign key([Kod_sotrudnika]) references [Sotrudnik]([Kod_sotrudnika]),
foreign key([Kod_Pomesheniya]) references [Pomeshenie]([Kod_Pomesheniya]));
GO

create TABLE [Oborudovanie] (
	[Kod_oborudovaniya] int primary key, 
	[Naimenovanie] varchar (250),
	[Garantiyniy_srok] date, 
	[Kod_Pomesheniya] int, 
	[Kod_Yslovii_hraneniya] int,

foreign key([Kod_Pomesheniya]) references [Pomeshenie]([Kod_Pomesheniya]),
foreign key([Kod_Yslovii_hraneniya]) references [Ysloviya_hraneniya]([Kod_Yslovii_hraneniya]));
GO

create TABLE [Specifikaciya] (
	[Kod_specifikacii] int primary key, 
	[Naimenovanie_tovara] varchar (250), 
	[Kod_kategorii_tovara]  int, 
	[Nalichie] float, 
	[Cena] float,
	[Kod_Yslovii_hraneniya] int,

foreign key([Kod_kategorii_tovara]) references [kategoriya_tovara]([Kod_kategorii_tovara]),
foreign key([Kod_Yslovii_hraneniya]) references [Ysloviya_hraneniya]([Kod_Yslovii_hraneniya]));
GO

create TABLE [Postavka_tovara] (
	[Kod_Postavki_tovara] int primary key,
	[Data_zakaza_tovara] date, 
	[Data_Postavki_tovara] date,
	[Data_proizvodstva] date,
	[Kod_statusa] int,
	[Adres_postavki] varchar (250),
	[Kod_Postavshchicka] int,
	[Kod_sotrudnika] int,
	
foreign key([Kod_statusa]) references [Status_zakaza_tovara]([Kod_statusa]),
foreign key([Kod_Postavshchicka]) references [Postavshchick]([Kod_Postavshchicka]),
foreign key([Kod_sotrudnika]) references [Sotrudnik]([Kod_sotrudnika]));
GO

create TABLE [Tovar] (
	[Kod_tovara] int primary key,
	[Srok_godnosti] int,
	[Kod_specifikacii] int, 
	[Kod_sotrudnika] int, 


foreign key([Kod_specifikacii]) references [Specifikaciya]([Kod_specifikacii]),
foreign key([Kod_sotrudnika]) references [Sotrudnik]([Kod_sotrudnika]));
GO

create TABLE [Prodazha] (
	[Kod_prodazhi] int primary key,
	[Stoimost] float,
	[Data] date,
	[Vremya] time(0), 
	[Kod_sotrudnika] int,

foreign key([Kod_sotrudnika]) references [Sotrudnik]([Kod_sotrudnika]));
GO

create TABLE [Oplata] (
	[Kod_oplati] int primary key, 
	[Kod_sposoba_oplati] int, 
	[Kod_prodazhi] int,
	[Sumarnaya_stoimost] float, 
	[Data] date, 
	[Vremeya] time(0),
	[Kod_sotrudnika] int,

	foreign key([Kod_prodazhi]) references [Prodazha]([Kod_prodazhi]),
	foreign key([Kod_sposoba_oplati]) references [Sposob_oplati]([Kod_sposoba_oplati]),
	foreign key([Kod_sotrudnika]) references [Sotrudnik]([Kod_sotrudnika]));
GO
/*3 уровень*/

create TABLE [Detalizaciya_postavok] (
	[Kod_Detalizacii_postavok] int primary key, 
	[kolichestvo] int, 
	[Cena] float, 
	[Kod_tovara] int,
	[Kod_Postavki_tovara] int,

	foreign key([Kod_tovara]) references [Tovar]([Kod_tovara]),
	foreign key([Kod_Postavki_tovara]) references [Postavka_tovara]([Kod_Postavki_tovara]));
GO

create TABLE [Detalizaciya_prodazh] (
	[Kod_Detalizacii_prodazh] int primary key, 
	[kolichestvo] int, 
	[Kod_tovara] int,
	[Kod_prodazhi] int,

	foreign key([Kod_tovara]) references [Tovar]([Kod_tovara]),
	foreign key([Kod_prodazhi]) references [Prodazha]([Kod_prodazhi]));
GO