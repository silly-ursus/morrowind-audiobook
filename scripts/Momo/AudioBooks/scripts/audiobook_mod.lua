local I = require('openmw.interfaces')
local ui = require('openmw.ui')
local auxUi = require('openmw_aux.ui')

-- Basic box accessing strings for book title, audio, pages
-- Ability to turn on persistent audiobook -> Do not pause in combat, entry
-- Pause on entry to a building, skip back 10 seconds
-- Lore-friendly: Only allow books in inventory or in hand
-- Non-lore-friendly: Option to "teach" The Storyteller books
-- A YAML file logging books The Storyteller has learned
-- Playlist menu for YAML file

ui.create {
    template = I.MWUI.templates.textNormal,
    layer = 'Windows',
    type = ui.TYPE.Text,
    props = {
        text = 'Hello, world!',
    },
}

-- important to copy here
local myText = auxUi.deepLayoutCopy(I.MWUI.templates.textNormal)
myText.props.textSize = 20
I.MWUI.templates.textNormal = myText

-- Pause audiobook in combat
-- local function getPlayerState()
--     for _, hostileActor in pairs(hostileActors) do
--       if types.Actor.isInActorsProcessingRange(hostileActor) then
--         return playerStates.combat
--       end
--     end
  
--     return playerStates.explore
--   end

-- -- Intitialize audiobook files
-- local function initialize()
--     if not initialized then
--       print('initializing playerscript')
--       collectSoundBanks()
--       initialized = true
--     end
--   end
  
--   local function onInit(initData)
--     initialize()
--   end
  
--   local function onLoad(initData)
--     initialize()
--   end
  
--   return {
--     engineHandlers = {
--       onFrame = onFrame,
--       onInit = onInit,
--       onLoad = onLoad
--     },
--     eventHandlers = {
--       engaging = engaging,
--       disengaging = disengaging,
--       globalDataCollected = globalDataCollected
--     },
--   }

ui.updateAll()