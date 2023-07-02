SELECT
	item_title,
	add_timestamp,
	file_hash,
	item_score
FROM
	item_flat
WHERE
	parent_count = 0 AND
	author_key = ?
ORDER BY
	item_score DESC,
	add_timestamp DESC
