-- Thank you for using this Figura Avatar! --
--   You can edit config below the this!   --

--Your Username here!
local username = "USERNAME HERE"

--Default armor Visiblity State Here!
local armorvisible = false

--Default Name Visiblity State Here!
local hideName = false

--Action wheel is enabled?
local en_action_wheel = true

--[[Spooky Options...]]
--Enable Spooky Mode
local spooky_mode = true
--Spooky on Default
local spooky = false
--Allow toggle spooky mode while play
local spooky_toggle = true

--CODE--
function Reload()
    if hideName then
        nameplate.ALL:setText(username)
    else
        nameplate.ALL:setText('{"text":"Figura","bold":true,"italic":true,"color":"blue"}')
    end

    vanilla_model.HELMET:setVisible(armorvisible)
    vanilla_model.CHESTPLATE:setVisible(armorvisible)
    vanilla_model.LEGGINGS:setVisible(armorvisible)
    vanilla_model.BOOTS:setVisible(armorvisible)

    --just a bit of spooky... lol
    if spooky and spooky_mode then
        vanilla_model.HEAD:setVisible(false)
        vanilla_model.HAT:setVisible(false)
    else
        vanilla_model.HEAD:setVisible(true)
        vanilla_model.HAT:setVisible(true)
    end
end

Reload()

if en_action_wheel then
    --action_wheel init
    Page = action_wheel:createPage()
    action_wheel:setPage(Page)

    --Clock
    Page:newAction():title("Show current clock"):item("minecraft:clock"):onLeftClick(
        function ()
            local second = math.floor(world.getTime()/20)
            if client.getActiveLang() == "ja_jp" then
                print("現在の時刻は"..second.."秒です")
            else
                print("current time is "..second.." second.")
            end
        end
    )

    --Armor Visiblity
    Page:newAction():title("Toggle Armor Visiblity"):item("minecraft:leather_chestplate"):onLeftClick(
        function ()
            if armorvisible then
                armorvisible = false
            else
                armorvisible = true
            end
            Reload()
        end
    )

    --hide username
    Page:newAction():title("Toggle Name Visiblity"):item("minecraft:name_tag"):onLeftClick(
        function ()
            if hideName then
                hideName = false
            else
                hideName = true
            end
            Reload()
        end
    )

    --Spooky mode
    if spooky_toggle and spooky_mode then
        Page:newAction():title("Toggle Spooky Mode"):item("minecraft:skeleton_skull").leftClick = function ()
            if spooky then
                spooky = false
            else
                spooky = true
            end
            Reload()
        end
    end
end