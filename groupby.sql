--���������� ��� ������������, ������� ��������� ������� ����� 2000 ����

select bk.Izd from books as bk where Year(bk.Date) > 2000 and bk.New = 1;

--���������� �����, � ������� ���������� ������� ������, ��� ������� �������������� ����� ������� ���� ����

select * 
from books as bk
where bk.Pages > (select avg(pages) from books)

--���������� �������� � ����� ������� �� ���������, �������� ��� ���� ������ ����� � ����� > 50

select bk.Themes, SUM(bk.Pages) as Sum
from books as bk
where bk.Price > 50
group by bk.Themes;

--��������
select bk.Price, bk.Themes,bk.Pages 
from books as bk
where bk.Themes like '%CAD-������%'

--���������� ��� ���� � ������� �� ������� ���������

select  bk.Themes, bk.Category
from books as bk
where bk.Category is not null


--���������� ����� ������� ����� ������������ BHV

select * 
from books as bk
where bk.Price = (select MAX(books.Price) from books where books.Izd like '%BHV%');


--��� �����������!!!! ��������� ������ ������ ��� ����� ������ �������� ���� !!! (LOL)
select * 
from books as bk
where bk.Price = (select MAX(books.Price) from books) and bk.Izd like '%BHV%';

--���������� ������������ � �������� ���������� ���������� �������



 select izd.Izd  
 from (select bk.Izd, MAX(bk.Pages) as MaxPages from books as bk group by bk.Izd) as [Izd] 
 where Izd.MaxPages = (select MAX(P.MaxPages) from (select bk.Izd,MAX(bk.Pages) as MaxPages from books as bk group by bk.Izd) as P);

 --���������� ������������, � �������� ���������� ����� ���� �� ����������������

 select Res.Izd, Res.[Count] from (select bk.Izd,COUNT(*) as [Count]
 from books as bk
 where bk.Themes like '%����������������%'
 group by bk.Izd) as Res
 where Res.[Count] = (select max(Res1.Count) from (select bk.Izd,COUNT(*) as [Count]
 from books as bk
 where bk.Themes like '%����������������%'
 group by bk.Izd) as Res1) 

 --���������� ������� ������ ���� �� ������ ��������

 select bk.Themes,COUNT(*)
 from books as bk
 group by bk.Themes;

--���������� ����� ������� ����� �� ��������� ������� - ����������������, ���� ������, �����������

select MIN(ret.MIN) from (select bk.Themes, MIN(bk.Price) as 'MIN'
from books as bk
where bk.Themes like '%����������������%' or bk.Themes like '%���� ������ ������-������%' or bk.Themes like '%�����������%'
group by bk.Themes) as ret

--�������� ������������ � ����� ������ ����� ��� ������� �� ���

select bk.Izd, min(bk.Date)
from books as bk
group by bk.Izd;

--�������� ���������� ���������� ���� ������� �� ������� ������������
select bk.Izd, count(bk.New) 'Counter'
from books as bk
group by bk.Izd

--���������� ������������ � �������� ���������� ����� ���� �������



select count(bk.New) as 'Counter',bk.Izd
from books as bk
where bk.New = 1
group by bk.Izd
having COUNT(bk.New) = (select max(Ret.Counter) from 
(select count(bk.New) as 'Counter',bk.Izd
from books as bk
where bk.New = 1 group by bk.Izd) as Ret
)

--13 �������!!!

--������� ���������� ����� ������ �������� � �����-�����

select bk.Themes, concat((sum(bk.Price)/(select SUM(bk.Price) from books as bk) * 100),'%') as 'Interest Deposit'
from books as bk
group by bk.Themes;

--������� ������� ���� ����, ���������� �������������� ������ 1999 ����, ��� ������� ������������

select bk.Izd, AVG(bk.Price)
from books as bk
where bk.Date between '1999-03-01' and '1999-05-31'
group by bk.Izd

--����� ����� ���������� ���������� �������

select *
from books as bk
where bk.Pressrun = (select max(bk.Pressrun) from books as bk);

--������� ������������ ����� ���������� ���� ������ ��������� 5% �� ������ ����� ����

select
bk.Izd
from books as bk
where bk.Pressrun > (select top 5 percent count(*) from books as bk)

--������� ����� � ���� ������� ����� 2 �������

select *
from booksSQL.dbo.books as bk
where bk.Code like '%7%7%' and bk.Code not like '%7%7%7%'

--������� ������������ �� ���� ������� ����� ������� ����� ���

select *
from books as bk
where bk.Name like N'%�%' and bk.Name like N'%�%'and bk.Name like N'%�%'

--������� ����� �������� ������� �� �������� ���������� ���� � ������ ������� ������� 2

select *
from books as bk
where bk.Name  not like '%[A-Z]%' and cast(bk.Pages as int) % 2 =0



