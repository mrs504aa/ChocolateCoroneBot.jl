function StartBot()

    while true
        LogFileName = "BotLog_$(Dates.format(now(), "yyyy-mm-dd_HH-MM-SS")).txt"
        try
            TelegramChatMainFunction(LogFileName = LogFileName)
        catch Error
            open(LogFileName, "a") do io
                println(io, "error message:")
                println(io, Error.msg)
            end
        end
    end

end

export StartBot
