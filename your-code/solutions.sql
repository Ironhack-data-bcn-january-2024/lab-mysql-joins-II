-- Challenge 1 - Who Have Published What At Where?

SELECT
	authors.au_id, au_lname, au_fname,
	title,
    pub_name
FROM authors

    JOIN titleauthor -- 1st table
		ON authors.au_id = titleauthor.au_id
        
	JOIN titles -- Middle table
		ON titleauthor.title_id = titles.title_id
        
	JOIN publishers
		ON titles.pub_id = publishers.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?

    
SELECT authors.au_id, au_lname, au_fname,
	COUNT(titles.title) AS total_count
	FROM authors

JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
JOIN titles
	ON titleauthor.title_id = titles.title_id
JOIN publishers
	ON titles.pub_id = publishers.pub_id
    
GROUP BY authors.au_id, au_lname, au_fname;

 -- Challenge 3 - Best Selling Authors

SELECT 
    authors.au_id, au_lname, au_fname, qty AS total
FROM
    authors
        JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        JOIN
    titles ON titleauthor.title_id = titles.title_id
        JOIN
    sales ON sales.qty = sales.qty
ORDER BY qty DESC
LIMIT 3;
        
-- Challenge 4 - Best Selling Authors Ranking

SELECT authors.au_id, au_lname, au_fname, 
COALESCE(SUM(sales.qty), 0) AS total
FROM
    authors
LEFT JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN
    titles ON titleauthor.title_id = titles.title_id
LEFT JOIN
    sales ON titles.title_id = sales.title_id
GROUP BY 
    authors.au_id, au_lname, au_fname
ORDER BY total DESC

LIMIT 23;



