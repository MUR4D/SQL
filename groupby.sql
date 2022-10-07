--Отобразить все издательства, которые выпустили новинки после 2000 года

select bk.Izd from books as bk where Year(bk.Date) > 2000 and bk.New = 1;

--Отобразить книги, у которых количество страниц больше, чем среднее арифметическое число страниц всех книг

select * 
from books as bk
where bk.Pages > (select avg(pages) from books)

--Отобразить тематики и сумму страниц по тематикам, учитывая при этом только книги с ценой > 50

select bk.Themes, SUM(bk.Pages) as Sum
from books as bk
where bk.Price > 50
group by bk.Themes;

--Проверка
select bk.Price, bk.Themes,bk.Pages 
from books as bk
where bk.Themes like '%CAD-пакеты%'

--Отобразить все темы у которых не указана категория

select  bk.Themes, bk.Category
from books as bk
where bk.Category is not null


--Отобразить самую дорогую книгу издательства BHV

select * 
from books as bk
where bk.Price = (select MAX(books.Price) from books where books.Izd like '%BHV%');


--ЭТО НЕПРАВИЛЬНО!!!! ВСПОМИНАЙ ПОЧЕМУ КАЖДЫЙ РАЗ КОГДА БУДЕШЬ СМОТРЕТЬ СЮДА !!! (LOL)
select * 
from books as bk
where bk.Price = (select MAX(books.Price) from books) and bk.Izd like '%BHV%';

--Отобразить издательство у которого наибольшее количество страниц



 select izd.Izd  
 from (select bk.Izd, MAX(bk.Pages) as MaxPages from books as bk group by bk.Izd) as [Izd] 
 where Izd.MaxPages = (select MAX(P.MaxPages) from (select bk.Izd,MAX(bk.Pages) as MaxPages from books as bk group by bk.Izd) as P);

 --Отобразить издательство, у которого наибольшее число книг по программированию

 select Res.Izd, Res.[Count] from (select bk.Izd,COUNT(*) as [Count]
 from books as bk
 where bk.Themes like '%Программирование%'
 group by bk.Izd) as Res
 where Res.[Count] = (select max(Res1.Count) from (select bk.Izd,COUNT(*) as [Count]
 from books as bk
 where bk.Themes like '%Программирование%'
 group by bk.Izd) as Res1) 

 --Отобразить сколько издано книг по каждой тематике

 select bk.Themes,COUNT(*)
 from books as bk
 group by bk.Themes;

--Отобразить самую дешевую книгу из следующих тематик - Программирование, Базы данных, Мультимедиа

select MIN(ret.MIN) from (select bk.Themes, MIN(bk.Price) as 'MIN'
from books as bk
where bk.Themes like '%Программирование%' or bk.Themes like '%Базы данных клиент-сервер%' or bk.Themes like '%Мультимедиа%'
group by bk.Themes) as ret

--Показать издательства и самую старую книгу для каждого из них

select bk.Izd, min(bk.Date)
from books as bk
group by bk.Izd;

--Показать количество выпущенных книг новинок по каждому издательству
select bk.Izd, count(bk.New) 'Counter'
from books as bk
group by bk.Izd

--Отобразить издательство у которого наибольшее число книг новинок



select count(bk.New) as 'Counter',bk.Izd
from books as bk
where bk.New = 1
group by bk.Izd
having COUNT(bk.New) = (select max(Ret.Counter) from 
(select count(bk.New) as 'Counter',bk.Izd
from books as bk
where bk.New = 1 group by bk.Izd) as Ret
)

--13 доделай!!!

--Вывести процентный вклад каждой тематики в прайс-листе

select bk.Themes, concat((sum(bk.Price)/(select SUM(bk.Price) from books as bk) * 100),'%') as 'Interest Deposit'
from books as bk
group by bk.Themes;

--Найдите среднюю цену книг, выпущенных издательствами весной 1999 года, для каждого издательства

select bk.Izd, AVG(bk.Price)
from books as bk
where bk.Date between '1999-03-01' and '1999-05-31'
group by bk.Izd

--Найти книгу выпущенную наибольшим тиражом

select *
from books as bk
where bk.Pressrun = (select max(bk.Pressrun) from books as bk);

--Вывести издательства число выпущенных книг котрых превышает 5% от общего числа книг

select
bk.Izd
from books as bk
where bk.Pressrun > (select top 5 percent count(*) from books as bk)

--Вывести книги в коде которых ровно 2 семерки

select *
from booksSQL.dbo.books as bk
where bk.Code like '%7%7%' and bk.Code not like '%7%7%7%'

--Вывести издательства из букв которых можно собрать слово Лак

select *
from books as bk
where bk.Name like N'%л%' and bk.Name like N'%а%'and bk.Name like N'%к%'

--Вывести книги названия которых не содержат английских букв с числом страниц кратным 2

select *
from books as bk
where bk.Name  not like '%[A-Z]%' and cast(bk.Pages as int) % 2 =0



