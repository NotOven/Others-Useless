getgenv().fuwwyify = true
local endingchat = true
local stutter = true
local randomchat = true
local whitelist = { --sometimes words like do will do dowo and its unreadable or goes tags so
    "do",
    "bro",
    "rawr",
    "lol",
    "how",
    "are",
    "you",
    "ok",
    "work",
    "'ll",
    "'re",
    "owo",
    "for",
    "too",
    "to",
    "ur ",
    "now",
    "ill"
}
local changelist = {
    ["r"] = "w",
    ["l"] = "w",
    ["o"] = "owo"
}
local LOL = { -- after chat
    ":3",
    "x3",
    "^w^",
    "uwu",
    "hehe",
    ">:3",
    "rawr",
    "i dont bite"
}
local BRUH = { -- random chats
    "nuzzles",
    "hehe",
    "cute",
    "omgg",
    "aww <3",
    "<3",
    "i dont bite"
}
local remote = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
spawn(function()
    if randomchat == true and getgenv().fuwwyify then
        while true do
            task.wait()
            remote:FireServer(BRUH[math.random(1,#BRUH)]:upper(),"All")
            wait(20)
        end
    end
end)
local mt = getrawmetatable(game);
local old = mt.__namecall
setreadonly(mt,false)
mt.__namecall = newcclosure(function(remote,...)
    args = {...}
    method = tostring(getnamecallmethod())
    if method == "FireServer" and tostring(remote) == "SayMessageRequest" and getgenv().fuwwyify == true then
        for i,v in next, whitelist do
            args[1] = args[1]:gsub(v:lower(),v:upper())
        end
        for i,v in next, changelist do
            args[1] = args[1]:gsub(i,v)
        end
        if endingchat == true then
            args[1] = args[1].." "..LOL[math.random(1,#LOL)]
        end
        args[1] = args[1]:lower()
        if stutter == true then
            args[1] = args[1]:sub(1,1).."-"..args[1]
        end
        return old(remote,unpack(args))
    end
    return old(remote,...)
end)

--All Creds To Pare and Outlaw too i think 
