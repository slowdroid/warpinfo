-- add filter start() within unit
-- copy paste follwing code

function round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function createWarpInfoPanel()

	wiPanelID = system.createWidgetPanel('Warp Info')

	local wiLocWID = system.createWidget(wiPanelID, 'value')
	wiLocDID = system.createData('{"label": "Destination", "value": "N/A", "unit":""}')
	system.addDataToWidget(wiLocDID, wiLocWID)

	local wiDistWID = system.createWidget(wiPanelID, 'value')
	wiDistDID = system.createData('{"label": "Distance", "value": "N/A", "unit":""}')
	system.addDataToWidget(wiDistDID, wiDistWID)

	local wiMassWID = system.createWidget(wiPanelID, 'value')
    wiMassDID = system.createData('{"label": "Mass", "value": "N/A", "unit":""}')
	system.addDataToWidget(wiMassDID, wiMassWID)

	local wiCellsWID = system.createWidget(wiPanelID, 'value')
	wiCellsDID = system.createData('{"label": "Cost", "value": "N/A", "unit":""}')
	system.addDataToWidget(wiCellsDID, wiCellsWID)
    
    local wiStatWID = system.createWidget(wiPanelID, 'value')
	wiStatDID = system.createData('{"label": "Status", "value": "N/A", "unit":""}')
	system.addDataToWidget(wiStatDID, wiStatWID)
    
end

wiMulti = nil
unit.setTimer('warpInfo', 1)