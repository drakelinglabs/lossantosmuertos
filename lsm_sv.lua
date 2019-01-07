RegisterServerEvent("place")
AddEventHandler("place",function(model,x,y,z,yaw)

end)

RegisterServerEvent("destroy")
AddEventHandler("destroy",function(index)
    TriggetClientEvent("destroy",-1,index)
end)