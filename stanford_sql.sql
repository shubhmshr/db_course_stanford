Q1.
select TITLE from MOVIE WHERE DIRECTOR='Steven Spielberg';

Q2.
select distinct a.Year 
from 
MOVIE a,
RATING b
where
a.mid=b.mid
and b.stars>=4
order by a.year;

Q3.
select a.TITLE
from 
MOVIE a
LEFT JOIN
RATING b
ON
a.mid=b.mid
WHERE B.STARS IS NULL;

Q4.
select a.name
from 
REVIEWER a
JOIN
RATING b
ON
a.RID=b.RID
WHERE B.RATINGDATE IS NULL;

Q5.
SELECT A.NAME,B.TITLE,C.STARS,C.RATINGDATE
FROM
REVIEWER A,
MOVIE B,
RATING C
WHERE
A.RID=C.RID
AND
B.MID=C.MID
ORDER BY
A.NAME,B.TITLE,C.STARS;

Q6.
select c.name,d.title
from 
rating a,
rating b,
reviewer c,
movie d
where 
a.rid=b.rid
and a.mid =b.mid and
a.ratingdate>b.ratingdate
and a.stars>b.stars
and a.rid=c.rid
and a.mid=d.mid;

Q7.
select distinct b.title,max(stars) 
from 
rating a,
movie b
where a.mid=b.mid
group by b.title
order by b.title;

Q8.
select distinct b.title,(max(stars)-min(stars)) 
from 
rating a,
movie b
where a.mid=b.mid
group by b.title
order by 2 desc,1;

Q9.
select avg(stars_before_1980)-avg(stars_after_1980) from 
        (select  b.mid,b.title,avg(a.stars) stars_before_1980
        from 
        rating a,
        movie b
        where a.mid=b.mid
        and b.year<1980
        group by b.title,b.mid)  a,              
        (select  avg(a.stars) as stars_after_1980
        from 
        rating a,
        movie b
        where a.mid=b.mid
        and b.year>1980
        group by b.mid,b.title
        ) b;