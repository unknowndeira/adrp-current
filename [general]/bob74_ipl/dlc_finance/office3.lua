
-- Office 3: -1579.756, -565.0661, 108.523 (Lom Bank)

exports('GetFinanceOffice3Object', function()
	return FinanceOffice3
end)

FinanceOffice3 = {
    currentInteriorId = -1,

    Style = {
        Theme = {
            warm = {interiorId = 240897, ipl = "ex_sm_13_office_01a"},
            classical = {interiorId = 241153, ipl = "ex_sm_13_office_01b"},
            vintage = {interiorId = 241409, ipl = "ex_sm_13_office_01c"},
            contrast = {interiorId = 241665, ipl = "ex_sm_13_office_02a"},
            rich = {interiorId = 241921, ipl = "ex_sm_13_office_02b"},
            cool = {interiorId = 242177, ipl = "ex_sm_13_office_02c"},
            ice = {interiorId = 242433, ipl = "ex_sm_13_office_03a"},
            conservative = {interiorId = 242689, ipl = "ex_sm_13_office_03b"},
            polished = {interiorId = 242945, ipl = "ex_sm_13_office_03c"}
        },
        Set = function(style, refresh)
            if (refresh == nil) then refresh = false end
            if (IsTable(style)) then
                FinanceOffice3.Style.Clear()
                FinanceOffice3.currentInteriorId = style.interiorId
                EnableIpl(style.ipl, true)
                if (refresh) then RefreshInterior(style.interiorId) end
            end
        end,
        Clear = function()
            for themeKey, themeValue in pairs(FinanceOffice3.Style.Theme) do
                for swagKey, swagValue in pairs(FinanceOffice3.Swag) do
                    if (IsTable(swagValue)) then
                        SetIplPropState(themeValue.interiorId, {swagValue.A, swagValue.B, swagValue.C}, true)
                    end
                end
                SetIplPropState(themeValue.interiorId, "office_chairs", false, false)
                SetIplPropState(themeValue.interiorId, "office_booze", false, true)
                EnableIpl(themeValue.ipl, false)
            end
        end
    },
    Swag = {
        Cash = {
            A = "cash_set_01", B = "cash_set_02", C = "cash_set_03", D = "cash_set_04", E = "cash_set_05",
            F = "cash_set_06", G = "cash_set_07", H = "cash_set_08", I = "cash_set_09", J = "cash_set_10",
            K = "cash_set_11", L = "cash_set_12", M = "cash_set_13", N = "cash_set_14", O = "cash_set_15",
            P = "cash_set_16", Q = "cash_set_17", R = "cash_set_18", S = "cash_set_19", T = "cash_set_20",
            U = "cash_set_21", V = "cash_set_22", W = "cash_set_23", X = "cash_set_24"
        },
        BoozeCigs = {A = "swag_booze_cigs", B = "swag_booze_cigs2", C = "swag_booze_cigs3"},
        DrugBags = {A = "swag_drugbags", B = "swag_drugbags2", C = "swag_drugbags3"},
        Gems = {A = "swag_gems", B = "swag_gems2", C = "swag_gems3"},
        Guns = {A = "swag_guns", B = "swag_guns2", C = "swag_guns3"},
        Jewel = {A = "swag_jewelwatch", B = "swag_jewelwatch2", C = "swag_jewelwatch3"},
        Med = {A = "swag_med", B = "swag_med2", C = "swag_med3"},
        Pills = {A = "swag_pills", B = "swag_pills2", C = "swag_pills3"},
        Enable = function (details, state, refresh)
            SetIplPropState(FinanceOffice3.currentInteriorId, details, state, refresh)
        end
    },
    Chairs = {
        off = "", on = "office_chairs",
        Set = function(chairs, refresh)
            FinanceOffice3.Chairs.Clear(false)
            if (chairs ~= nil) then
                SetIplPropState(FinanceOffice3.currentInteriorId, chairs, true, refresh)
            else
                if (refresh) then RefreshInterior(FinanceOffice3.currentInteriorId) end
            end
        end,
        Clear = function(refresh)
            SetIplPropState(FinanceOffice3.currentInteriorId, FinanceOffice3.Chairs.on, false, refresh)
        end
    },
    Booze = {
        off = "", on = "office_booze",
        Set = function(booze, refresh)
            FinanceOffice3.Booze.Clear(false)
            if (booze ~= nil) then
                SetIplPropState(FinanceOffice3.currentInteriorId, booze, true, refresh)
            else
                if (refresh) then RefreshInterior(FinanceOffice3.currentInteriorId) end
            end
        end,
        Clear = function(refresh)
            SetIplPropState(FinanceOffice3.currentInteriorId, FinanceOffice3.Booze.on, true, refresh)
        end
    },

    LoadDefault = function()
        FinanceOffice3.Style.Set(FinanceOffice3.Style.Theme.warm)
        FinanceOffice3.Chairs.Set(FinanceOffice3.Chairs.on, true)
    end
}
