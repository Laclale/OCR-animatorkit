function btween(number,ist,ien)
  for i=ist,ien do
    if (number == i) then
      return true
    end
  end
  return false
end

function arrayMix(A,B,val,length)
  newarray = A;
  for i=0,length-1 do
    newarray[i] = A*val+B*(1-val)
  end
  return newarray
end

function valMix(A,B,val)
  return A*val+B*(1-val)
end

function readTrack(obj)
local NN=obj.getoption("section_num")
local A=obj.getvalue("time")
local B,C,T

for i=0,NN-1 do
B=obj.getvalue("time",0,i)
C=obj.getvalue("time",0,i+1)
T=(A-B)/(C-B)
	if(T<1) then
	  return {i,i+1,T}
	end
end
  return {NN-1,NN,1}
end

--補完曲線の算定(ティム氏の簡易モーションパスより一部を改変して使用)
function PassXYZ(s) -- s<=1
  Ns=NN*s
  Ns1=math.floor(Ns)
  Ns2=(Ns-Ns1)/2
  if Ns1<=0 then
    nx=Ax[1]*Ns2*Ns2+Bx[1]*Ns2+Cx[1]
    ny=Ay[1]*Ns2*Ns2+By[1]*Ns2+Cy[1]
  elseif Ns1==NN-1 then
    SS1=Ns2+0.5
    nx=Ax[Ns1]*SS1*SS1+Bx[Ns1]*SS1+Cx[Ns1]
    ny=Ay[Ns1]*SS1*SS1+By[Ns1]*SS1+Cy[Ns1]
  elseif s>=1 then
    nx=XX[NN]
    ny=YY[NN]
  else
    SS1=Ns2+0.5
    SS2=Ns2
    RS=2*Ns2
    nx=(Ax[Ns1]*SS1*SS1+Bx[Ns1]*SS1+Cx[Ns1])*(1-RS)+RS*(Ax[Ns1+1]*SS2*SS2+Bx[Ns1+1]*SS2+Cx[Ns1+1])
    ny=(Ay[Ns1]*SS1*SS1+By[Ns1]*SS1+Cy[Ns1])*(1-RS)+RS*(Ay[Ns1+1]*SS2*SS2+By[Ns1+1]*SS2+Cy[Ns1+1])
  end
  return nx,ny
end
function PassXYZ2(s) -- s<=1
  Ns=NN*s
  Ns1=math.floor(Ns)
  Ns2=(Ns-Ns1)/2
  if Ns1<=0 then
    nx=Dx[1]*Ns2*Ns2+Ex[1]*Ns2+Fx[1]
    ny=Dy[1]*Ns2*Ns2+Ey[1]*Ns2+Fy[1]
  elseif Ns1==NN-1 then
    SS1=Ns2+0.5
    nx=Dx[Ns1]*SS1*SS1+Ex[Ns1]*SS1+Fx[Ns1]
    ny=Dy[Ns1]*SS1*SS1+Ey[Ns1]*SS1+Fy[Ns1]
  elseif s>=1 then
    nx=XX2[NN]
    ny=YY2[NN]
  else
    SS1=Ns2+0.5
    SS2=Ns2
    RS=2*Ns2
    nx=(Dx[Ns1]*SS1*SS1+Ex[Ns1]*SS1+Fx[Ns1])*(1-RS)+RS*(Dx[Ns1+1]*SS2*SS2+Ex[Ns1+1]*SS2+Fx[Ns1+1])
    ny=(Dy[Ns1]*SS1*SS1+Ey[Ns1]*SS1+Fy[Ns1])*(1-RS)+RS*(Dy[Ns1+1]*SS2*SS2+Ey[Ns1+1]*SS2+Fy[Ns1+1])
  end
  return nx,ny
end
