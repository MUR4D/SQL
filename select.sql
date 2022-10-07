
--���������� ������ ����������� ���� ��� ����������. ������������� �� �����������.
select bk.Izd from booksSQL.dbo.books as bk
order by bk.Izd asc;

--���������� ����� �� ���������������� ����������� ����� � BHV.
select * from booksSQL.dbo.books as bk
where bk.Izd like '%�����%' or bk.Izd like '%BHV%';

--���������� ��� ����� �������� ������� ����� � �������� �� 200 �� 600
select * from booksSQL.dbo.books as bk
where bk.Pages between 200 and 600

--���������� ��� �����, ����� ����������� �������, ����� � ��������� �� ����� � �� �. ������������� �� ����������� ( �� �������������)
select * from booksSQL.dbo.books as bk
where bk.Izd like N'[�-�]%'
order by bk.Izd asc;

--���������� ����� ����������� � ���������������� ��� � ����� ������, � ������������ ������� �� ����� � �� �����
select * from booksSQL.dbo.books as bk
where (bk.Themes like '%����������������%' or bk.Themes like '%���� ������%') AND (bk.Izd not like '%�����%' and bk.Izd not like '%�����%');

--������� �� ������� ��� ������� (��� ����������), � ������� � ����� � ������� �� ����� ���� ���� �
select bk.Izd from booksSQL.dbo.books as bk where bk.Izd like '%�%�%'

--���������� ���� ������������ � �� �����. ������������ ������������� �� �����������, � �������� ���� ��������.
select bk.Izd as Izd,bk.[Name] as [Name] from booksSQL.dbo.books as bk order by Izd asc, Name desc;

--���������� ��� ����� �������� ������� ���������� � �����
select * from booksSQL.dbo.books as bk where bk.Name like '[0-9]%';

--���������� ��� ����� �������� ������� ������������� �� 4 �����

select bk.[Name] from booksSQL.dbo.books as bk where bk.Name like '%[0-9][0-9][0-9][0-9]';

--���������� ��� ����� � ��������� ������� ����� ��� �����

--X

--���������� ����� ������� ������� � ������������ ���������

select * from booksSQL.dbo.books as bk where bk.Pressrun = 1;

--���������� ����� �� ���������������� �� ����������� � ������������ BHV, � ��������� ������� ���� ����� Visual

select * from booksSQL.dbo.books as bk where bk.Izd not like '%BHV%' and bk.[Name] like '%Visual%'

--���������� ����� �� ���������������� � Web �������, ������� ��������� � ������������� BHV � �����

select * from booksSQL.dbo.books as bk where (bk.Themes like '%����������������%' or bk.Category like '%Web%') 
and (bk.Izd like '%BHV%' or bk.Izd like '%�����%')

--���������� �����, ������� �������� ������������� ��� ������������

select * from booksSQL.dbo.books as bk where bk.Category like N'%����������%' or bk.Category like N'%�����������%';

--���������� �����, �������� ������� ���������� �� ���������� �����

select * from booksSQL.dbo.books as bk where bk.[Name] like '[A-Z]%';

--���������� �����, �������� ������� ������������� �� ������� �����

select * from booksSQL.dbo.books as bk where bk.[Name] like N'%[�-�]';

--���������� �����, � ��������� ����������� ������� ����� ��� �������

select * from booksSQL.dbo.books as bk where bk.Izd like '___';

--���������� �����, �� ���������������� �� ����������� ���� �� ������� � �����

select * from booksSQL.dbo.books as bk where (bk.Category not like '%Pascal%' and bk.Category not like '%Delphi%') 
and bk.Themes like '%����������������%'

--������� � �������

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

--���������� ����� � ��������� ������� ������ ����������
select * from booksSQL.dbo.books as bk where bk.Pages is NULL;


--������� �����, ������� ���� ������ �� 2000 ���� �� ����������� ������������ �����.
delete from booksSQL.dbo.books 
where (books.Date) < '2000-01-01' and books.Izd not like '%�����%';
