SELECT
	file_hash,
	item_title,
	file_path,
	add_timestamp,
	file_hash,
	item_type
FROM
	item_flat
WHERE 1
	AND item_score > 0
	AND labels_list NOT LIKE '%pubkey%'
	AND labels_list NOT LIKE '%puzzle%'
	AND labels_list NOT LIKE '%notext%'
	AND labels_list NOT LIKE '%http%'
ORDER BY
	RANDOM(),
	item_score DESC
LIMIT 100