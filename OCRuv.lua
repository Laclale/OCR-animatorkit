function ocr_fixuv(tbl,fixeduv)
	--13以降を書き換える
  for k, v in ipairs(tbl) do
	for kk, vv in ipairs(fixeduv) do
		tbl[k][12+kk]=vv
	end
  end
	return tbl
end
function ocr_filluv(tbl,oo)
	--13以降を書き換える
	local ow,oh=oo.w,oo.h
	local fixeduv={0,0,ow,0,ow,oh,0,oh}
  for k, v in ipairs(tbl) do
	for kk, vv in ipairs(fixeduv) do
		tbl[k][12+kk]=vv
	end
  end
	return tbl
end
function ocr_filluvn(tbl,ow,oh)
	--13以降を書き換える
	local fixeduv={0,0,ow,0,ow,oh,0,oh}
  for k, v in ipairs(tbl) do
	for kk, vv in ipairs(fixeduv) do
		tbl[k][12+kk]=vv
	end
  end
	return tbl
end
