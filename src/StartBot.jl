function StartBot()

    while true
        LogFileName = "BotLog_$(Dates.format(now(), "yyyy-mm-dd_HH-MM-SS")).txt"
        try
            TelegramChatMainFunction(LogFileName = LogFileName)
        catch Error
            open(LogFileName, "a") do io
                println(io, "error message:")
                showerror(io, Error, catch_backtrace())
            end
            sleep(5.0)
        end
    end

end

export StartBot
