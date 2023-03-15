function TelegramChatMainFunction(; LogFileName::String = "")
    BotChat = TelegramClient(TelegramToken; chat_id = TelegramChatID)

    if LogFileName == ""
        LogFileName = "BotLog_$(Dates.format(now(), "yyyy-mm-dd_HH-MM-SS")).txt"
    end

    S = getUpdates(BotChat)
    S == [] ? S = [""] : ()
    while true
        sleep(1.0)
        SN = getUpdates(BotChat)
        SN == [] ? SN = [""] : ()
        if (SN[end] != S[end])
            S = SN
            haskey("message", SN[end]) ? () : (continue)
            InputMessage = SN[end]["message"]["text"]

            open(LogFileName, "a") do io
                println(io, "recive message:")
                println(io, InputMessage)
            end

            Response = create_chat(OpenAIToken, "gpt-3.5-turbo", [Dict("role" => "user", "content" => InputMessage)])
            OutputMessage = Response.response["choices"][begin]["message"]["content"]

            open(LogFileName, "a") do io
                println(io, "send message:")
                println(io, OutputMessage)
            end

            sendMessage(BotChat; text = OutputMessage)
        end
    end

    return nothing
end

export TelegramChatMainFunction