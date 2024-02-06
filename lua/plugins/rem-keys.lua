local notify = require("notify")

function getMessage()
    local messages = {
        -- LSP
        "<ldr>vrn to rename.",
        "gd to go to definition.",
        "<ldr>h for error in the document.",
        "Shift+k to get definition.",
        "<C-h> to get signature.",
        
        -- Trouble.nvim
        "<ldr>l to toggle Trouble diagnostics.",
        "<ldr>i to get floating diagnostics.", -- keymap.lua
        "<ldr>gr to get all references of the variable.",

        -- Harpoon
        "<ldr>q to add files to Harpoon. <ldr>f,s,a,g to switch files.",

        -- Misc
        "<ldr>] to format the file.",
        -- Add more messages as needed
    }
    
    local randomIndex = math.random(1, #messages)
    return(messages[randomIndex])
end

function notifyKeys()
    local message = getMessage()
    notify(message, "info", {
        title = "Keybind Hint:"
    })
end

function setupTimer()
    local interval = 30 * 60 -- 30 minutes in seconds

    vim.fn.timer_start(interval * 1000, function()
        notifyKeys()
        setupTimer()  -- Restart the timer for the next interval
    end, { repeat_count = -1 })
end

-- For the hint on entry
notifyKeys()
setupTimer()

return{}
