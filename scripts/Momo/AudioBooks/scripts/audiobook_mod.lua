local I = require('openmw.interfaces')
local ui = require('openmw.ui')
local auxUi = require('openmw_aux.ui')
local util = require('openmw.util')
local calendar = require('openmw_aux.calendar')
-- local time = require('openmw_aux.time')
local constants = require('scripts.omw.mwui.constants')

-- Basic box accessing strings for book title, audio, pages
-- Ability to turn on persistent audiobook -> Do not pause in combat, entry
-- Pause on entry to a building, skip back 10 seconds
-- Lore-friendly: Only allow books in inventory or in hand
-- Non-lore-friendly: Option to "teach" The Storyteller books
-- A YAML file logging books The Storyteller has learned
-- Playlist menu for YAML file

--- Creates a new bit of text at the top left corner
local hello = ui.create {
    template = I.MWUI.templates.textHeader,
    layer = 'Windows',
    type = ui.TYPE.Text,
    props = {
        text = 'Hello, world!',
        textSize = 40
    },
}

-- -- important to copy here
-- local myText = auxUi.deepLayoutCopy(I.MWUI.templates.textHeader)
-- I.MWUI.templates.textHeader = myText

--- Displays ingame time
local timeTicker = ui.create {
    -- important not to forget the layer
    -- by default widgets are not attached to any layer and are not visible
    layer = 'HUD',
    type = ui.TYPE.Text,
    props = {
      -- position in the top right corner
      relativePosition = util.vector2(.5, 1, 1),
      -- position is for the top left corner of the widget by default
      -- change it to align exactly to the top right corner of the screen
      anchor = util.vector2(.5, 1, 1),
      text = calendar.formatGameTime('%H:%M:%S'),
      textSize = 40,
      -- default black text color isn't always visible
      textColor = constants.normalColor,
    },
  }
  
--   local function updateTime()
--     -- formatGameTime uses current time by default
--     -- otherwise we could get it by calling `core.getGameTime()`
--     element.layout.props.text = calendar.formatGameTime('%H:%M:%S')
--     -- -- the layout changes won't affect the widget unless we request an update
--     element:update()
--   end
  
--   -- we are showing game time in hours and minutes
--   -- so no need to update more often than once a game minute
--   time.runRepeatedly(updateTime, 1 * time.minutes, { type = time.GameTime })

timeTicker:update()
hello:update()

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

--- State initialization
-- local playerStates = {
--     combat = 'combat',
--     explore = 'explore'
-- }

-- local documentState = {
--     bookName = {
--       current = nil,
--       previous = nil
--     },
--     scrollName = {
--       current = nil,
--       previous = nil
--     },
--     journalName = {
--         current = nil,
--         previous = nil
--     },
--     soundBank = {
--       current = nil,
--       previous = nil
--     },
--     track = {
--       curent = nil,
--       previous = nil
--     }
-- }

-- --- Handles player state
-- -- Pauses AudioBook while in combat
-- local function getPlayerState()
--     for _, hostileActor in pairs(hostileActors) do
--         if types.Actor.isInActorsProcessingRange(hostileActor) then
--         return playerStates.combat
--         end
--     end

--     return playerStates.explore
-- end

return {
    engineHandlers = {
        onKeyPress = function(key)
            if key.symbol == 'x' then
                ui.showMessage("Hell yeah you pressed it, new music?")
            end
        end
    }
}