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

-- ONLY EDIT IF YOU KNOW WHAT YOU ARE DOING!

local currentWeather = "EXTRASUNNY"

local function mapWeather(weatherType)

    weatherType = string.lower(weatherType)

    local mapping = {
        clear = "EXTRASUNNY",
        clouds = "CLOUDS",
        rain = "RAIN",
        drizzle = "RAIN",
        thunderstorm = "THUNDER",
        snow = "XMAS",
        mist = "FOGGY",
        fog = "FOGGY"
    }

    return mapping[weatherType] or "CLEAR"
end

local function updateWeather()

    local url = string.format(
        "%s?city=%s&lang=%s",
        Config.ApiUrl,
        Config.City,
        Config.Language
    )

    print("[nWeatherSync] Requesting URL: " .. url)

    PerformHttpRequest(url, function(statusCode, body, headers)

        print("[nWeatherSync] Status Code: " .. tostring(statusCode))

        if body then
            print("[nWeatherSync] Response Body: " .. body)
        else
            print("[nWeatherSync] Empty Response Body")
        end

        if statusCode ~= 200 then
            print("[nWeatherSync] API Error - invalid status code")
            return
        end

        local ok, data = pcall(function()
            return json.decode(body)
        end)

        if not ok or not data then
            print("[nWeatherSync] JSON Decode Failed")
            return
        end

        if not data.weatherType then
            print("[nWeatherSync] Invalid API response - missing weatherType")
            return
        end

        currentWeather = mapWeather(data.weatherType)

        print(("[nWeatherSync] %s | %s°C | %s")
            :format(
                data.city or "unknown",
                data.temperature or 0,
                currentWeather
            ))

        TriggerClientEvent(
            "nWeatherSync:setWeather",
            -1,
            currentWeather
        )

    end, "GET")

end

CreateThread(function()

    updateWeather()

    while true do
        Wait(Config.UpdateInterval)
        updateWeather()
    end

end)

RegisterNetEvent("nWeatherSync:requestWeather", function()

    TriggerClientEvent(
        "nWeatherSync:setWeather",
        source,
        currentWeather
    )

end)