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
function ocr_trivert(xa,ya,za,xb,yb,zb,xc,yc,zc,ua,va,ub,vb,uc,vc)
	local tbl={}
	table.insert(tbl,{xa,ya,za,ua,va})
	table.insert(tbl,{xb,yb,zb,ub,vb})
	table.insert(tbl,{xc,yc,zc,uc,vc})
	return tbl
end
function ocr_getmp(tbl)
	--値の読み取り(minx,miny,minz,maxx,maxy,maxz)
	local tbl_copy={0,0,0,0,0,0,false}
  for k, v in ipairs(tbl) do
	if tbl_copy[7] then
		tbl_copy[1]=math.min(tbl_copy[1],v[1],v[4],v[7],v[10])
		tbl_copy[2]=math.min(tbl_copy[2],v[2],v[5],v[8],v[11])
		tbl_copy[3]=math.min(tbl_copy[3],v[3],v[6],v[9],v[12])
		tbl_copy[4]=math.max(tbl_copy[4],v[1],v[4],v[7],v[10])
		tbl_copy[5]=math.max(tbl_copy[5],v[2],v[5],v[8],v[11])
		tbl_copy[6]=math.max(tbl_copy[6],v[3],v[6],v[9],v[12])
	else
	--x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3
		tbl_copy[1]=math.min(v[1],v[4],v[7],v[10])
		tbl_copy[2]=math.min(v[2],v[5],v[8],v[11])
		tbl_copy[3]=math.min(v[3],v[6],v[9],v[12])
		tbl_copy[4]=math.max(v[1],v[4],v[7],v[10])
		tbl_copy[5]=math.max(v[2],v[5],v[8],v[11])
		tbl_copy[6]=math.max(v[3],v[6],v[9],v[12])
		tbl_copy[7]=true
	end
  end
	return tbl_copy
end
