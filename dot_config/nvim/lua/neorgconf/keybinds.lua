-- This sets the leader for all Neorg keybinds. It is separate from the regular <Leader>.
local neorg_leader = "<Leader>o"
local neorg_callbacks = require("neorg.callbacks")

local event_enable_keybinds = "core.keybinds.events.enable_keybinds"

local normal_maps = {
  {"gtd", "core.norg.qol.todo_items.todo.task_done"},
  {"gtu", "core.norg.qol.todo_items.todo.task_undone"},
  {"gtp", "core.norg.qol.todo_items.todo.task_pending"},
  {"<C-Space>", "core.norg.qol.todo_items.todo.task_cycle"},
  {"<C-s>", "core.integrations.telescope.find_linkable"},
  {"<C-n>", "core.norg.dirman.new.note"},
  {"<A-p>", "core.integrations.treesitter.previous.heading"},
  {"<A-n>", "core.integrations.treesitter.next.heading"},
}
local insert_maps = {{"<C-l>", "core.integrations.telescope.insert_link"}}
local map_opts = {silent = true, noremap = true}

local function keybind_function(_, keybinds)
  -- Map all the below keybinds only when the "norg" mode is active
  keybinds.map_event_to_mode("norg", {n = normal_maps, i = insert_maps},
                             map_opts)
end

-- Listen for the enable_keybinds event, which signals a "ready" state meaning we can bind keys.
-- This hook will be called several times, e.g. whenever the Neorg Mode changes or an event that
-- needs to reevaluate all the bound keys is invoked
return function()
  neorg_callbacks.on_event(event_enable_keybinds, keybind_function)
end
