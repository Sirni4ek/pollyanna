SELECT
	'' AS tagset_url,
	value AS url,
	author_key AS author_id,
	item_title,
	labels_list,
	item_flat.item_score AS item_score,
	item_flat.file_hash AS file_hash
FROM
	item_attribute
	LEFT JOIN item_flat ON (item_attribute.file_hash = item_flat.file_hash)
WHERE
	attribute IN('http', 'https') AND
	item_flat.item_score > 0
ORDER BY
	item_score DESC

