--
--	#     #
--	##    #  ######  #    #  ######   ####   #    #   ####
--	# #   #  #       ##  ##  #       #       #    #  #
--	#  #  #  #####   # ## #  #####    ####   #    #   ####
--	#   # #  #       #    #  #            #  #    #       #
--	#    ##  #       #    #  #       #    #  #    #  #    #
--	#     #  ######  #    #  ######   ####    ####    ####
--
-- Created by Nemesus for Standalone
-- Website: https://nemesus.de
-- Youtube: https://youtube.nemesus.de

-- Console / Delete if you want

print("^0======================================================================^7")
print("^0nWeatherSync loaded:")
print("^0[^4Author^0] ^7:^0 ^0Nemesus | Version 1.0^7")
print("^0[^2Website^0] ^7:^0 ^5https://nemesus.de^7")
print("^0[^2Youtube^0] ^7:^0 ^5https://youtube.nemesus.de^7")
print("^0======================================================================^7")

-- ONLY EDIT IF YOU KNOW WHAT YOU ARE DOING!

local currentWeather = "EXTRASUNNY"

RegisterNetEvent("nWeatherSync:setWeather", function(weather)
    currentWeather = weather
    SetWeatherTypeOvertimePersist(weather, 15.0)
    Wait(15000)
    SetWeatherTypePersist(weather)
    SetWeatherTypeNow(weather)
    SetWeatherTypeNowPersist(weather)
end)

CreateThread(function()
    TriggerServerEvent("nWeatherSync:requestWeather")
    while true do
        SetWeatherTypePersist(currentWeather)
        SetWeatherTypeNow(currentWeather)
        SetWeatherTypeNowPersist(currentWeather)
        Wait(10000)
    end
end)