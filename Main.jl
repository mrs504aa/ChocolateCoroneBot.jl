using Pkg
Pkg.activate(".")

using Downloads
Downloads.DOWNLOADER[] = nothing
Downloads.EASY_HOOK[] = (easy, info) -> begin
    Downloads.Curl.setopt(easy, Downloads.Curl.CURLOPT_LOW_SPEED_TIME, 60)
end

using ChocolateCoroneBot

StartBot()