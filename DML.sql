set LANGUAGE 'Russian'
use Magazin;
GO
/*0 ???????*/
INSERT INTO [Dolznost]([Kod_dolznosti],[Naimenovanie]) /*?????????*/
values (1,'??????????? ?????????'),
		(2,'?????????? ???????'),
		(3,'???????? ????'),
		(4,'??????');
GO

INSERT INTO [Sposob_oplati]([Kod_sposoba_oplati],[Naimenovanie])
values (1,'??????????? ??????'),
		(2,'???????? ??????');
GO

INSERT INTO [Kategoriya_tovara]([Kod_kategorii_tovara],[Naimenovanie])
values (1,'?????-?????? ??????'),
		(2,'?????-??????? ?????? ? ?????'),
		(3,'?????, ???, ??????? ? ???????????? ??????'),
		(4,'??????? ????'),
		(5,'?????? ??????'),
		(6,'?????? ??????'),
		(7,'???????? ??????'),
		(8,'???? ? ?????? ??????'),
		(9,'???????? ??????'),
		(10,'???????');
GO

INSERT INTO [Status_zakaza_tovara]([Kod_statusa],[Naimenovanie])
values (1,'?? ????????????'), /*????? ???????? ???????????? ?????? ????????*/
		(2,'??????????'),
		(3,'???????????'),
		(4,'??????');
GO

/*1 ???????*/

INSERT INTO [Pomeshenie]([Kod_Pomesheniya],[FIO_upravlyayshego],[Adres],[Grafik_raboti_magazina])
values (1,'??????? ?????? ??????????', '????? ??????? 21', '?????????, 9:00 - 23:00'),
		(2,'???????? ????????? ??????????', '9 ???????? ?????????? 21', '?????????, 9:00 - 23:00');
GO

INSERT INTO [Sotrudnik]([Kod_sotrudnika],[Familiya],/*+*/
[Imya],[Otchestvo],[Kod_dolznosti])
values (1,'???????','??????','??????????',1),
		(2,'????????','?????????','??????????',1),
		(3,'????????','??????','??????????',2),
		(4,'???????','???????','??????????',3),
		(5,'???????','???????','??????????',4),
		(6,'??????????','????????','??????????',2),
		(7,'?????','???????','??????????',3),
		(8,'????????','???????','??????????',4),
		(9,'??????','????????','??????????',2),
		(10,'???????','?????','??????????',3),
		(11,'?????????','??????','??????????',4),
		(12,'?????','??????','????????',2),
		(13,'?????????','???????','???????????',3),
		(14,'???????????','??????','????????',4),
		(15,'???????','?????','?????????????',1),
		(16,'????????','????','??????????',1);
GO

INSERT INTO [Ysloviya_hraneniya]([Kod_Yslovii_hraneniya],[Vid_oborudovaniya])
values (1,'???????????'),
		(2,'?????????'),
		(3,'???????');
GO

INSERT INTO [Postavshchick]([Kod_Postavshchicka],[Telefon],[Adres],[Naimenovanie])
values (1,'+7-999-452-66-65', '?.???????????, ??.???????? 20','?????????'),
		(2,'+7-999-450-61-60', '?.???????????, ??.?????????? 2','??????'),
		(3,'+7-999-456-76-85', '?.???????????, ??.???????? 36','?????????');
GO

/*2 ???????*/
INSERT INTO [Grafik_raboti_sotrudnikov]([Kod_Grafika_raboti_sotrudnikov],
[Nachalo_smeni],
[Konec_smeni],
[Data],
[Kod_sotrudnika],
[Kod_Pomesheniya])

values (1,'8:00','23:00','2019-06-13',1, 1),
		(2,'8:00','15:00','2019-06-13',3, 1),
		(3,'8:00','15:00','2019-06-13',4, 1),
		(4,'8:00','15:00','2019-06-13',5, 1),
		(5,'15:00','23:00','2019-06-13',6, 1),
		(6,'15:00','23:00','2019-06-13',7, 1),
		(7,'15:00','23:00','2019-06-13',8, 1),
		(8,'8:00','15:00','2019-06-13',2, 2),
		(9,'8:00','15:00','2019-06-13',9, 2),
		(10,'8:00','15:00','2019-06-13',10, 2),
		(11,'8:00','15:00','2019-06-13',11, 2),
		(12,'15:00','23:00','2019-06-13',12, 2),
		(13,'15:00','23:00','2019-06-13',13, 2),
		(14,'15:00','23:00','2019-06-13',14, 2),
		(15,'15:00','23:00','2019-06-13',15, 1),
		(16,'15:00','23:00','2019-06-13',16, 2);
GO

INSERT INTO [Oborudovanie]([Kod_oborudovaniya],[Naimenovanie],[Garantiyniy_srok],[Kod_Pomesheniya],[Kod_Yslovii_hraneniya])
values (1,'????????? ???????????','2024-05-01',1,1),
		(2,'???????????-????','2020-10-09',1,1),
		(3,'????????????? ???????????? ?????????','2018-09-01',1,2),
		(4,'?????','2018-09-01',1,3),
		(5,'????????? ???????????','2024-05-01',2,1),
		(6,'???????????-????','2020-10-09',2,1),
		(7,'????????????? ???????????? ?????????','2018-09-01',2,2),
		(8,'?????','2018-09-01',2,3);
GO

INSERT INTO [Specifikaciya]([Kod_specifikacii],[Naimenovanie_tovara],
[Kod_kategorii_tovara],[Nalichie],[Cena],[Kod_Yslovii_hraneniya])
values (1,'?????? ?????',7,25,64.50,1),
		(2,'?????? ?????????',7,15,76.50,1),
		(3,'?????????? ???????? ???????',3,100,50.00,3),
		(4,'???? ????????????',6,52,250.50,2),
		(5,'???? ??????????????',1,48,36.50,3),
		(6,'????????? ????',2,64,12.50,3),
		(7,'??? ??????',10,236,64.50,3),
		(8,'??? ?????????',1,185,46.30,3),
		(9,'??? ???????????',7,69,60.25,1),
		(10,'?????? ????????? ???????',1,76,146.50,3),
		(11,'?????? ??????',2,99,64.50,3),
		(12,'?????????? ???????',2,12,82.50,1),
		(13,'????? ????????',9,142,64.50,3);
GO

INSERT INTO [Postavka_tovara]([Kod_Postavki_tovara],[Data_zakaza_tovara],
[Data_Postavki_tovara],[Data_proizvodstva],[Kod_statusa],
[Adres_postavki],[Kod_Postavshchicka],[Kod_sotrudnika])
values (1,'2019-06-10','2019-06-12','2019-06-13',3,'????? ??????? 21',1,1),
		(2,'2019-06-10','2019-06-12','2019-06-13',4,'????? ??????? 21',3,1),
		(3,'2019-06-11','2019-06-11','2019-06-13',4,'9 ???????? ?????????? 21',2,2),
		(4,'2019-06-11','2019-06-11','2019-06-13',3,'9 ???????? ?????????? 21',3,2);
GO

INSERT INTO [Tovar] ([Kod_tovara],[Srok_godnosti],
[Kod_specifikacii],[Kod_sotrudnika])
values (1,8,1,4),
		(2,5,2,10),
		(3,365,6,13),
		(4,365,8,4),
		(5,365,10,10),
		(6,41,11,13),
		(7,730,13,13),
		(8,8,4,10);
GO

INSERT INTO [Prodazha]([Kod_prodazhi],[Stoimost],[Data],
[Vremya],[Kod_sotrudnika])
values (1,250.23,'2019-06-13','11:00',5),
		(2,480.00,'2019-06-13','11:05',11),
		(3,355.55,'2019-06-13','11:10',14),
		(4,48.50,'2019-06-13','11:12',14),
		(5,32.00,'2019-06-13','11:13',5);
GO

INSERT INTO [Oplata]([Kod_oplati],[Kod_sposoba_oplati],[Kod_prodazhi],
[Sumarnaya_stoimost],[Data],[Vremeya],[Kod_sotrudnika])
values (1,1,1,250.23,'2019-06-13','11:00',5),
		(2,2,2,480.00,'2019-06-13','11:05',11),
		(3,1,3,355.55,'2019-06-13','11:10',14),
		(4,2,4,48.50,'2019-06-13','11:12',14),
		(5,1,5,32.00,'2019-06-13','11:13',5);
GO

INSERT INTO [Detalizaciya_postavok]([Kod_Detalizacii_postavok],
[kolichestvo],[Cena],[Kod_tovara],[Kod_Postavki_tovara])
values (1,3,25.23,1,1),
		(2,6,60.00,2,2);
GO

INSERT INTO [Detalizaciya_prodazh]([Kod_Detalizacii_prodazh],
[kolichestvo],[Kod_tovara],[Kod_prodazhi])
values (1,3,1,1),
		(2,6,2,2);
GO
/*INSERT INTO [Oplata]([Kod_oplati],[Kod_sposoba_oplati],[Sumarnaya_stoimost],[Data],[Vremeya],[Kod_sotrudnika])
values (1,1,250.23,'2019-06-13','11:00',5),
		(2,2,480.00,'2019-06-13','11:05',8),
		(3,1,355.55,'2019-06-13','11:10',5),
		(4,2,48.50,'2019-06-13','11:12',8),
		(5,1,32.00,'2019-06-13','11:13',5);
GO



INSERT INTO [Tovar] ([Kod_tovara],[Kod_Postavshchicka],[Kod_kategorii_tovara],[Srok_godnosti],[Cena],[Nalichie],[Naimenovanie],[Kod_Yslovii_hraneniya])
values (1,3,1,'2019-06-13',35.53,50,'?????? ?????',2),
		(2,3,9,'2019-06-13',86.20,20,'?????? ?????????',1),
		(3,2,3,'2019-06-13',21.50,200,'?????????? ???????? ???????',2),
		(4,1,6,'2019-06-13',250,190,'????????????????',2),
		(5,2,1,'2019-06-13',32,76,'???? ?????????',3),
		(6,3,2,'2019-06-13',20,300,'????????? ????',3),
		(7,3,10,'2019-06-13',40,89,'??? ???????',1);
GO

INSERT INTO [Prodazha]([Kod_prodazhi],[Vremya_prodazhi],[Kod_oplati],[Kod_tovara],[Kod_sotrudnika])
values (1,'11:00',1,1,5),
		(2,'11:00',2,3,8),
		(3,'11:00',3,2,5),
		(4,'11:05',4,4,8);
GO


INSERT INTO [Zakaz_tovara]([Kod_Zakaza_tovara],[Cena_Zakaza],[Adres_priema_zakazov],
[Kod_statusa],[Kod_Postavki_tovara],[Kod_Postavshchicka],[Kod_sotrudnika])
values (1,24563.53,1,1,3,3,5),
		(2,2568,2,2,3,3,8),
		(3,13500.55,3,3,2,2,5),
		(4,4800.71,4,4,1,1,8);
GO
*/