local lightingbypass = {}

local dcs = require(game:GetService("ReplicatedStorage").EmberSharedLibrary.GameShared.Services["DayCycleService.service"])

local old

function lightingbypass.init(flags)
    if old then return end

    old = hookfunction(dcs.GetExpectedva, LPH_NO_UPva(function(self, p37)
        local va = old(self, p37)

        for i, pp in pairs(va) do
            if i:IsA("Lighting") then
                if flags.customWorldEnabled then
                    pp.Brightness = flags.customWorldBrightness
                    pp.Ambient = flags.customWorldAmbient
                end
            end

            if i:IsA("Atmosphere") then
                if flags.customAtmosphereEnabled then
                    pp.Density = flags.customAtmosphereDensity
                    pp.Offset = flags.customAtmosphereOffset
                    pp.Color = flags.customAtmosphereColor
                    pp.Decay = flags.customAtmosphereDecay
                end
            end
        end

        return va
    end))
end

return lightingbypass
