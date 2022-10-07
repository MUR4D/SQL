
--Отобразить список издательств книг без повторений. Отсортировать по возрастанию.
select bk.Izd from booksSQL.dbo.books as bk
order by bk.Izd asc;

--Отобразить книги по программированию издательств Питер и BHV.
select * from booksSQL.dbo.books as bk
where bk.Izd like '%Питер%' or bk.Izd like '%BHV%';

--Отобразить все книги страницы которых лежат в пределах от 200 до 600
select * from booksSQL.dbo.books as bk
where bk.Pages between 200 and 600

--Отобразить все книги, имена издательств которых, лежат в диапазоне от буквы В до О. Отсортировать по возрастанию ( по издательствам)
select * from booksSQL.dbo.books as bk
where bk.Izd like N'[В-О]%'
order by bk.Izd asc;

--Отобразить книги относящиеся к Программированию или к Базам Данных, и издательства которых не Питер и не Бином
select * from booksSQL.dbo.books as bk
where (bk.Themes like '%Программирование%' or bk.Themes like '%Базы Данных%') AND (bk.Izd not like '%Питер%' and bk.Izd not like '%Бином%');

--Выбрать из таблицы тех авторов (без повторений), у которых в имени и фамилии не менее двух букв А
select bk.Izd from booksSQL.dbo.books as bk where bk.Izd like '%а%а%'

--Отобразить всех издательства и их книги. Издательства отсортировать по возрастанию, а названия книг убыванию.
select bk.Izd as Izd,bk.[Name] as [Name] from booksSQL.dbo.books as bk order by Izd asc, Name desc;

--Отобразить все книги названия которых начинаются с цифры
select * from booksSQL.dbo.books as bk where bk.Name like '[0-9]%';

--Отобразить все книги названия которых заканчиваются на 4 цифры

select bk.[Name] from booksSQL.dbo.books as bk where bk.Name like '%[0-9][0-9][0-9][0-9]';

--Отобразить все книги в названиях которых ровно две цифры

--X

--Отобразить книги которые имеются в единственном экземляре

select * from booksSQL.dbo.books as bk where bk.Pressrun = 1;

--Отобразить книги по программированию не относящиеся к издательству BHV, в названиях которых есть слово Visual

select * from booksSQL.dbo.books as bk where bk.Izd not like '%BHV%' and bk.[Name] like '%Visual%'

--Отобразить книги по программированию и Web дизайну, которые относятся к издательствам BHV и Бином

select * from booksSQL.dbo.books as bk where (bk.Themes like '%Программирование%' or bk.Category like '%Web%') 
and (bk.Izd like '%BHV%' or bk.Izd like '%Бином%')

--Отобразить книги, которые являются справочниками или руководством

select * from booksSQL.dbo.books as bk where bk.Category like N'%Справочник%' or bk.Category like N'%Руководство%';

--Отобразить книги, названия которых начинаются на английскую букву

select * from booksSQL.dbo.books as bk where bk.[Name] like '[A-Z]%';

--Отобразить книги, названия которых заканчиваются на русскую букву

select * from booksSQL.dbo.books as bk where bk.[Name] like N'%[А-Я]';

--Отобразить книги, в названиях издательств которых ровно три символа

select * from booksSQL.dbo.books as bk where bk.Izd like '___';

--Отобразить книги, по программированию за исключением книг по Паскаль и Дэлфи

select * from booksSQL.dbo.books as bk where (bk.Category not like '%Pascal%' and bk.Category not like '%Delphi%') 
and bk.Themes like '%Программирование%'

--Вставка в таблицу

insert into booksSQL.dbo.books ([Name],Pages,Date,Themes,Izd,Pressrun,Category)
values('Murad1',999,'1999-06-05','Math and CS','APAYEV', 1000, 'BEST');

insert into booksSQL.dbo.books ([Name],Pages,Date,Themes,Izd,Pressrun,Category) 
values ('c++ base course',620,'2005','programming','williams', 2000, 'BEST'); 

update booksSQL.dbo.books set [Name] = 'RRRRTTTT'
where [Name] like '%Test%';

update booksSQL.dbo.books set [Name] = 'MURAD10'
where [Name] = 'Murad1';

update booksSQL.dbo.books set Themes = 'Mathematics and Computer Science'
where Izd = 'APAYEV';

--Отобразить книги о страницах которых ничего неизвестно
select * from booksSQL.dbo.books as bk where bk.Pages is NULL;


--Удалить книги, которые были изданы до 2000 года за исключением издательства Питер.
delete from booksSQL.dbo.books 
where (books.Date) < '2000-01-01' and books.Izd not like '%Питер%';
