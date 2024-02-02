-- 1.

SELECT 
    authors.au_id, 
    authors.au_lname, 
    authors.au_fname,
    titles.title, 
    publishers.pub_name
FROM 
    authors
JOIN
    titleauthor
ON
    authors.au_id = titleauthor.au_id
JOIN
    titles
ON
    titleauthor.title_id = titles.title_id
JOIN
    publishers
ON
    titles.pub_id = publishers.pub_id;

-- exercise 2
SELECT
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    publishers.pub_name AS 'PUBLISHER',
    COUNT(titles.title_id) AS  `NUMBER OF TITLES`
FROM
    authors
JOIN
    titleauthor 
    ON 
authors.au_id = titleauthor.au_id
JOIN
    titles 
    ON 
    titleauthor.title_id = titles.title_id
JOIN
    publishers 
    ON 
    titles.pub_id = publishers.pub_id
GROUP BY
    authors.au_id, publishers.pub_name 
ORDER BY 'NUMBER OF TITLES' DESC;
-- 3.

SELECT 
		authors.au_id,
        authors.au_lname, 
		authors.au_fname,
        titles.title,
        sales.qty AS total
FROM
sales
JOIN
titles
ON
sales.title_id = titles.title_id
JOIN
titleauthor
ON
titles.title_id = titleauthor.title_id
JOIN
authors
ON
titleauthor.au_id = authors.au_id
ORDER BY total DESC LIMIT 3
-- 4 

SELECT 
		authors.au_id,
        authors.au_lname, 
		authors.au_fname,
        titles.title,
        sales.qty AS total
FROM
sales
JOIN
titles
ON
sales.title_id = titles.title_id
JOIN
titleauthor
ON
titles.title_id = titleauthor.title_id
JOIN
authors
ON
titleauthor.au_id = authors.au_id
ORDER BY total