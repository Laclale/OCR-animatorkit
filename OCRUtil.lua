--rxryrz‚Írad‚Å
function OCRRoll(ox,oy,oz,rx,ry,rz)
  local OCRTx=((ox*math.cos(ry)+oz*math.sin(ry))*math.cos(rz)-oy*math.sin(rz))
  local OCRTy=(ox*math.sin(rz)+(oy*math.cos(rx)-oz*math.sin(rx))*math.cos(rz))
  local OCRTz=((oy*math.sin(rx)-oz*math.cos(rx))*math.cos(ry)-ox*math.sin(ry))
  return OCRTx,OCRTy,OCRTz
end

function anglepoint(px,py,angle,dist)
  local la = angle
  if ( la == nil ) then
    la = 0
  end
  local ar = math.rad(la)
  local ld = dist
  if ( ld == nil ) then
    ld = 0
  end
  local dx,dy = px,py
  dx = px + math.sin(ar)*ld
  dy = py + math.cos(ar)*ld
  return dx,dy
end

function radpoint(px,py,ar,dist)
  local ld = dist
  if ( ld == nil ) then
    ld = 0
  end
  local dx,dy = px,py
  dx = px + math.sin(ar)*ld
  dy = py + math.cos(ar)*ld
  return dx,dy
end

function anglepoint90(angle,size)
  local la = angle
  if ( la == nil ) then
    la = 0
  end
  local ar = math.rad(la+90)
  local ld = size/2
  if ( ld == nil ) then
    ld = 0
  end
  local dx,dy = px,py
  dx = math.sin(ar)*ld
  dy = math.cos(ar)*ld
  return dx,dy
end

function btween(number,ist,ien)
  if (number >= ist) then
    if (number <= ien) then
      return true
    end
  end
  return false
end
