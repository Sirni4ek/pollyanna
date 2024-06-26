SELECT
	item_title,
	item_flat.author_key AS author_id,
	add_timestamp,
	labels_list,
	file_hash,
	file_path,
	item_type
FROM 
	item_flat
	LEFT JOIN author_score
	    ON (item_flat.author_key = author_score.author_key)
WHERE
	item_score >= 0
ORDER BY
	(add_timestamp * item_score) DESC

