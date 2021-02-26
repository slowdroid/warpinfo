-- add filter tick(warpInfo) within unit
-- copy paste follwing code
-- make sure the slot the core is connected to is called "core"
-- make sure the slot the warp drive is connected to is called "warpdrive"

-- get some info from warp drive
local wiDefaultData = warpdrive.getData()
wiDefaultData = json.decode(wiDriveData)

-- hide panel if very close to planet
if (wiDefaultData.distance < 20000) then
    if(warpPanelID and system.destroyWidgetPanel(warpPanelID)) then warpPanelID = nil end

-- show panel if warp destination is set
elseif (wiDefaultData.destination ~= 'Unknown') then
    
    -- hide default warp drive panel
    warpdrive.hide()
    
    -- create the warp info panel if needed
    if(not warpPanelID) then createWarpInfoPanel() end
    
    -- get distance from default widget and mass from core
    local su = wiDefaultData.distance/200000
    local mass = core.getConstructMass()/1000
    
    -- calculate formula multiplier based on default widget info
    if(not multi) then
        local cellsCalc = plutils.split(wiDefaultData.cellCount,' / ')[2]
        multi = cellsCalc / (mass*su)
        --system.print('warp cell formula multiplier: '..round(multi,7))
    end
    
    -- get available cells from default widget
    local cellsHave = plutils.split(wiDefaultData.cellCount,' / ')[1]

    -- calculate needed warp cells
    local cellsNeed = utils.round(mass * su * multi)     
    
    -- figure out status message
    local status = ''
    if(wiDefaultData.buttonMsg == 'WARPING...') then
        status = wiDefaultData.buttonMsg:lower()
    elseif(wiDefaultData.errorMsg == '') then 
        status = 'ready'
    else   
        status = wiDefaultData.errorMsg:lower()
    end
    
    -- update all widgets within panel
    system.updateData(locDID, '{"label": "Destination", "value": "'..wiDefaultData.destination..'", "unit":""}')
    system.updateData(distDID, '{"label": "Distance", "value": "'..round(su,2)..'", "unit":" su"}')
    system.updateData(massDID, '{"label": "Mass", "value": "'..round(mass,2)..'", "unit":" t"}')
    system.updateData(cellsDID, '{"label": "Cost", "value": "'..cellsHave..' / '..cellsNeed..'", "unit":" cells"}')    
    system.updateData(statDID, '{"label": "Status", "value": "'..status..'", "unit":""}')
    
end