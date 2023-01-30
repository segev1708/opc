drone = component.proxy(component.list("drone")())
modem = component.proxy(component.list("modem")())


drone.setStatusText('Motion detect')
drone.setLightColor(0x03f8fc)

while true do
  local _, _, relativeX, relativeY, relativeZ, entityName = computer.pullSignal(motion)
  modem.broadcast(1800, tostring(relativeX)) modem.broadcast(1800, tostring(relativeY)) modem.broadcast(1800, tostring(relativeZ))
  if entityName == 'segev178' then drone.move(relativeX, (relativeY + 2), relativeZ) end
end
