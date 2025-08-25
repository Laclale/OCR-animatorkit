function drawcurve(obj,px,py,pz,angle,wl,hu, vu,vd,vh)
	debug_print(string.format("crv = %d, shutter = %d",crv,shutter))
	local wi,hi = wl/2,hu/2
	local wc,hc = wi*crv/100,hi*crv/100
	local wc2,hc2 = (wi-wc)/2,(hi-hc)/2
	local ax,ay,az = 0,0,0
	local bx,by,bz = 0,0,0
	local aza,azb,azc,azd = 0,0,0,0
	local bza,bzb,bzc,bzd = 0,0,0,0
	local u0,u1 = 0,obj.w
	local vcr = hc2*2
	if(angle==5 or angle==2) then
	 ay = (wi+hi)/2-(wc2+hc2) + qwe
	 bx = wi-wc
	 bz = hi-hc
	 bza,bzb,bzc,bzd = bz,bz,-bz,-bz
	elseif(angle==4 or angle==3) then
	 az = (wi+hi)/2-(wc2+hc2) + qwe
	 bx = wi-wc
	 by = hi-hc
	else
	 ax = (wi+hi)/2-(wc2+hc2) + qwe
	 by = hi-hc
	 bz = wi-wc
	 bza,bzb,bzc,bzd = bz,-bz,-bz,bz
	end
	if(angle==2) then
	 ay,bx = -ay,-bx
	elseif(angle==3 or angle==6) then
	 ax,az,bx = -ax,-az,-bx
	 bza,bzb,bzc,bzd = -bza,-bzb,-bzc,-bzd
	end
	if(angle==5 or angle==2) then
	 drawcurvesub(obj,0,py,pz+bz,angle,wc2,hc,1, vu,vd,-1,1,-hc)
	 drawcurvesub(obj,px-bx,py,0,angle,wc,hc2,2, vu,vd,1,1,-wc)
	 drawcurvesub(obj,0,py,pz-bz,angle,wc2,hc,3, vu,vd,1,1,-hc)
	 drawcurvesub(obj,px+bx,py,0,angle,wc,hc2,4, vu,vd,-1,1,-wc)
	 drawcurvesub(obj,px-bx,py+ay,pz+bz,angle,wc,hc,5, vu,vu+hc,-1,vcr,-hc)
	 drawcurvesub(obj,px+bx,py+ay,pz+bz,angle,wc,hc,6, vu,vu+hc,-1,vcr,-wc)
	 drawcurvesub(obj,px-bx,py+ay,pz-bz,angle,wc,hc,7, vd-hc,vd,1,vcr,-hc)
	 drawcurvesub(obj,px+bx,py+ay,pz-bz,angle,wc,hc,8, vd-hc,vd,1,vcr,-wc)
	elseif(angle==3 or angle==4) then
	 drawcurvesub(obj,0,py-by,pz,angle,wc2,hc,1, vu,vu+hc,-1,vcr,-hc)
	 drawcurvesub(obj,px-bx,0,pz,angle,wc,hc2,2, vu+hc,vd-hc,1,vcr,-wc)
	 drawcurvesub(obj,0,py+by,pz,angle,wc2,hc,3, vd-hc,vd,1,vcr,-hc)
	 drawcurvesub(obj,px+bx,0,pz,angle,wc,hc2,4, vu+hc,vd-hc,-1,vcr,-wc)
	 drawcurvesub(obj,px-bx,py-by,pz+az,angle,wc,hc,5, vu,vu+hc,-1,vcr,-hc)
	 drawcurvesub(obj,px+bx,py-by,pz+az,angle,wc,hc,6, vu,vu+hc,-1,vcr,-wc)
	 drawcurvesub(obj,px-bx,py+by,pz+az,angle,wc,hc,7, vd-hc,vd,1,vcr,-hc)
	 drawcurvesub(obj,px+bx,py+by,pz+az,angle,wc,hc,8, vd-hc,vd,1,vcr,-wc)
	else
	 drawcurvesub(obj,px,py-by,0,angle,wc2,hc,1, vu,vu+hc,-1,vcr,-hc)
	 drawcurvesub(obj,px,0,pz-bz,angle,wc,hc2,2, vu+hc,vd-hc,1,vcr,-wc)
	 drawcurvesub(obj,px,py+by,0,angle,wc2,hc,3, vd-hc,vd,1,vcr,-hc)
	 drawcurvesub(obj,px,0,pz+bz,angle,wc,hc2,4, vu+hc,vd-hc,-1,vcr,-wc)
	 drawcurvesub(obj,px+ax,py-by,pz-bz,angle,wc,hc,5, vu,vu+hc,-1,vcr,-hc)
	 drawcurvesub(obj,px+ax,py-by,pz+bz,angle,wc,hc,6, vu,vu+hc,-1,vcr,-wc)
	 drawcurvesub(obj,px+ax,py+by,pz-bz,angle,wc,hc,7, vd-hc,vd,1,vcr,-hc)
	 drawcurvesub(obj,px+ax,py+by,pz+bz,angle,wc,hc,8, vd-hc,vd,1,vcr,-wc)
	end
	obj.drawpoly(px-bx,py-by,pz+bza,px+bx,py-by,pz+bzb,px+bx,py+by,pz+bzc,px-bx,py+by,pz+bzd, u0+wc,vu+hc,u1-wc,vu+hc,u1-wc,vd-hc,u0+wc,vd-hc)
end

function drawcurvesub(obj,px,py,pz,pangle,wi,hi,line, vu,vd,vx,vh,qi)
	local wc,hc,vc,side = wi,hi,vh*vx,0
	local wa,ha,va,ist,jst,qst = 1,1,1,0,0,0
	local ws,hs,vs,qs = shutter,shutter,shutter,shutter
	local wct,hct,qct,vct = -1,-1,-1,vu
	if(line==1) then
	 wc = wc*2
	 wa = wa*2
	 ws = 1
	elseif(line==2) then
	 hc = hc*2
	 ha = ha*2
	 hs = 1
	 va = 2*vc
	 vs = 1
	elseif(line==3) then
	 hct = -hct
	 ha = -ha
	 wct = -wct
	 wc = wc*2
	 wa = -wa*2
	 ws = 1
	elseif(line==4) then
	 wct = -wct
	 wa = -wa
	 hct = -hct
	 hc = hc*2
	 ha = -ha*2
	 hs = 1
	 vct = vd
	 va = 2*vc
	 vs = 1
	elseif(line==5) then
	 side = 1
	elseif(line==6) then
	 side = 1
	 wct = -wct
	 wa = -wa
	elseif(line==7) then
	 side = 1
	 hct = -hct
	 ha = -ha
	elseif(line==8) then
	 side = 1
	 wct = -wct
	 wa = -wa
	 hct = -hct
	 ha = -ha
	end
	ist,jst,qst = math.floor(ws/2),math.floor(hs/2),math.floor(qs/2)
	ws,hs,qs = math.max(ws,1),math.max(hs,1),math.max(qs,1)
	local wcc,hcc,vcc,qcc = wa/ws,ha/hs,va/vs,1/qs
	if(ist>=1) then
	for i=0,ist-1 do
		wct = wct+wcc
	end
	end
	if(jst>=1) then
	for j=0,jst-1 do
		hct = hct+hcc
		vct = vct+vcc
	end
	end
	
	if(qst>=1) then
	for q=0,qst-1 do
		qct = qct+qcc
	end
	end
	local zb,qd = 0,0
	 if(line==2 or line==4) then
	  qd = 1
	 end
	if(pangle==1) then
	 if(line==2 or line==4) then
	  zb = 6
	 else
	  zb = 5
	 end
	elseif(pangle==6) then
	 qct,qcc = -qct,-qcc
	 if(line==1 or line==3) then
	  zb = 5
	 else
	  zb = 1
	 end
	elseif(pangle==3 or pangle==4) then
	 zb = 3
	 if(line==2 or line==4) then
	  zb = 1
	 end
	 if(pangle==3) then
	  qct,qcc = -qct,-qcc
	 end
	else
	 if(line==1 or line==3) then
	  zb = 3
	 else
	  zb = 4
	 end
	 if(pangle==2) then
	  qct,qcc = -qct,-qcc
	 end
	end
	local xa,ya,za = 0,0,0
	local wl,xl,zl,ql = wct,0,0,qct
	local wac,hac,vac = 0,0,0
	local wlc,hlc,qtc = 0,0,0
	local wac,hac,qac = 0,0,0
	for i=ist,ws-1 do
		wlc = wl*wc
		wa = wl+wcc
		wac = wa*wc
		qu = ql+qcc
		local yl,hl,vl,qlc,quc = 0,hct,vct,ql,qu
		for j=jst,hs-1 do
			hlc = hl*hc
			ha = hl+hcc
			hac = ha*hc
			va = vl+vcc
			qac = qlc+qcc
			qtc = quc+qcc
			if(side==1) then
	local xu,yu,zu = 0,0,0
	local xp,yp,zp = 0,0,0
			if(pangle==1) then
			 yu,yl = hac,hlc
			 yp,ya = hac,hlc
			 zp,zu = wac,wlc
			 za,zl = wac,wlc
			 xl,xa = qi*qlc,qi*quc
			 xp,xu = qi*qtc,qi*qac
			elseif(pangle==2) then
			 xl,zl = -wac,-hac
			 xa,za = -wlc,-hac
			 xu,zu = -wlc,-hlc
			 xp,zp = -wac,-hlc
			 yl,ya = qi*qtc,qi*qac
			 yu,yp = qi*qlc,qi*quc
			elseif(pangle==3) then
			 xl,yl = -wlc,hlc
			 xa,ya = -wac,hlc
			 xu,yu = -wac,hac
			 xp,yp = -wlc,hac
			 zl,za = qi*qlc,qi*quc
			 zu,zp = qi*qtc,qi*qac
			elseif(pangle==4) then
			 xl,yl = wlc,hlc
			 xa,ya = wac,hlc
			 xu,yu = wac,hac
			 xp,yp = wlc,hac
			 zl,za = qi*qlc,qi*quc
			 zu,zp = qi*qtc,qi*qac
			elseif(pangle==5) then
			 xl,zl = wac,-hac
			 xa,za = wlc,-hac
			 xu,zu = wlc,-hlc
			 xp,zp = wac,-hlc
			 yl,ya = qi*qtc,qi*qac
			 yu,yp = qi*qlc,qi*quc
			else
			 yu,yl = hac,hlc
			 yp,ya = hac,hlc
			 zp,zu = wac,wlc
			 za,zl = wac,wlc
			 xl,xa = qi*qlc,qi*quc
			 xu,xp = qi*qac,qi*qtc
			end
			if(pangle==1) then
			  if(line==5 or line==8) then
			   obj.drawpoly(px+xl,py+yl,pz+zl,px+xu,py+yu,pz+zu,px+xp,py+yp,pz+zp,px+xa,py+ya,pz+za, wct,vl,wa,vl,wac,va,wct,va)
			  else
			   obj.drawpoly(px+xl,py+yl,pz+zl,px+xa,py+ya,pz+za,px+xp,py+yp,pz+zp,px+xu,py+yu,pz+zu, wct,vl,wa,vl,wac,va,wct,va)
			  end
			elseif(pangle==2 or pangle==5) then
			  if(line==6 or line==7) then
			   obj.drawpoly(px+xl,py+yl,pz+zl,px+xp,py+yp,pz+zp,px+xu,py+yu,pz+zu,px+xa,py+ya,pz+za, wct,vl,wa,vl,wac,va,wct,va)
			  else
			   obj.drawpoly(px+xl,py+yl,pz+zl,px+xa,py+ya,pz+za,px+xu,py+yu,pz+zu,px+xp,py+yp,pz+zp, wct,vl,wa,vl,wac,va,wct,va)
			  end
			elseif(pangle==3 or pangle==4) then
			 if(line==5) then
			  obj.drawpoly(px+xl,py+yl,pz+zl,px+xa,py+ya,pz+za,px+xu,py+yu,pz+zu,px+xp,py+yp,pz+zp, wct,vl,wa,vl,wac,va,wct,va)
			 elseif(line==6) then
			  obj.drawpoly(px+xa,py+ya,pz+za,px+xl,py+yl,pz+zl,px+xp,py+yp,pz+zp,px+xu,py+yu,pz+zu, wct,vl,wa,vl,wac,va,wct,va)
			 elseif(line==7) then
			  obj.drawpoly(px+xp,py+yp,pz+zp,px+xu,py+yu,pz+zu,px+xa,py+ya,pz+za,px+xl,py+yl,pz+zl, wct,vl,wa,vl,wac,va,wct,va)
			 elseif(line==8) then
			  obj.drawpoly(px+xl,py+yl,pz+zl,px+xa,py+ya,pz+za,px+xu,py+yu,pz+zu,px+xp,py+yp,pz+zp, wct,vl,wa,vl,wac,va,wct,va)
			 end
			else
			  if(line==6 or line==7) then
			   obj.drawpoly(px+xl,py+yl,pz+zl,px+xu,py+yu,pz+zu,px+xp,py+yp,pz+zp,px+xa,py+ya,pz+za, wct,vl,wa,vl,wac,va,wct,va)
			  else
			   obj.drawpoly(px+xl,py+yl,pz+zl,px+xa,py+ya,pz+za,px+xp,py+yp,pz+zp,px+xu,py+yu,pz+zu, wct,vl,wa,vl,wac,va,wct,va)
			  end
			end
			else
			if(qd>=1) then
			 qlc,qac = ql,qu
			end
			if(pangle==1) then
			 yl,ya = hlc,hac
			if(line==2 or line==4) then
			 zl,za = wlc,wac
			else
			 zl,za = -wlc,-wac
			end
			 xl,xa = qi*qlc,qi*qac
			elseif(pangle==2) then
			 xl,zl = -wlc,-hlc
			 xa,za = -wac,-hac
			 yl,ya = qi*qlc,qi*qac
			elseif(pangle==3) then
			 xl,yl = -wlc,hlc
			 xa,ya = -wac,hac
			 zl,za = qi*qlc,qi*qac
			elseif(pangle==4) then
			 xl,yl = wlc,hlc
			 xa,ya = wac,hac
			 zl,za = qi*qlc,qi*qac
			elseif(pangle==5) then
			 xl,zl = wlc,-hlc
			 xa,za = wac,-hac
			 yl,ya = qi*qlc,qi*qac
			else
			 yl,zl = hlc,wlc
			 ya,za = hac,wac
			 xl,xa = qi*qlc,qi*qac
			end
			 if(zb==1) then
			  obj.drawpoly(px+xl,py+yl,pz+zl,px+xa,py+yl,pz+za,px+xa,py+ya,pz+za,px+xl,py+ya,pz+zl, wct,vl,wa,vl,wac,va,wct,va)
			 elseif(zb==2) then
			  obj.drawpoly(px+xl,py+yl,pz+za,px+xa,py+yl,pz+zl,px+xa,py+ya,pz+zl,px+xl,py+ya,pz+za, wct,vl,wa,vl,wac,va,wct,va)
			 elseif(zb==3) then
			  obj.drawpoly(px+xl,py+yl,pz+zl,px+xa,py+yl,pz+zl,px+xa,py+ya,pz+za,px+xl,py+ya,pz+za, wct,vl,wa,vl,wac,va,wct,va)
			 elseif(zb==4) then
			  obj.drawpoly(px+xl,py+yl,pz+za,px+xl,py+yl,pz+zl,px+xa,py+ya,pz+zl,px+xa,py+ya,pz+za, wct,vl,wa,vl,wac,va,wct,va)
			 elseif(zb==5) then
			  obj.drawpoly(px+xa,py+ya,pz+za,px+xa,py+ya,pz+zl,px+xl,py+yl,pz+zl,px+xl,py+yl,pz+za, wct,vl,wa,vl,wac,va,wct,va)
			 elseif(zb==6) then
			  obj.drawpoly(px+xa,py+yl,pz+za,px+xl,py+yl,pz+zl,px+xl,py+ya,pz+zl,px+xa,py+ya,pz+za, wct,vl,wa,vl,wac,va,wct,va)
			 else
			  obj.drawpoly(px+xl,py+yl,pz+za,px+xa,py+yl,pz+za,px+xa,py+ya,pz+zl,px+xl,py+ya,pz+zl, wct,vl,wa,vl,wac,va,wct,va)
			 end
			--debug_print(string.format("x = %d, y = %d, z = %d",xl,yl,zl))
			--debug_print(string.format("x = %d, y = %d, z = %d",xa,ya,za))
			end
			hl = ha
			vl = va
			qlc = qac
			quc = qtc
			--debug_print(string.format("vl = %d, va = %d",vl,va))
			--debug_print(string.format("w = %d, h = %d",i,j))
		end
		wl = wa
		ql = qu
	end
end

function drawmark(obj,px,py,pz,angle,wl,hu)
	local wi,hi = wl/2,hu/2
	local bx,by,bz = 0,0,0
	local bza,bzb,bzc,bzd = 0,0,0,0
	local vd,ud = obj.h,obj.w
	if(angle==5 or angle==2) then
	 bx = wi
	 bz = hi
	 bza,bzb,bzc,bzd = bz,bz,-bz,-bz
	elseif(angle==4 or angle==3) then
	 bx = wi
	 by = hi
	else
	 by = hi
	 bz = wi
	 bza,bzb,bzc,bzd = bz,-bz,-bz,bz
	end
	if(angle==2) then
	 bx = -bx
	elseif(angle==3 or angle==6) then
	 bx = -bx
	 bza,bzb,bzc,bzd = -bza,-bzb,-bzc,-bzd
	end
	obj.drawpoly(px-bx,py-by,pz+bza,px+bx,py-by,pz+bzb,px+bx,py+by,pz+bzc,px-bx,py+by,pz+bzd, 0,0,ud,0,ud,vd,0,vd)
end
