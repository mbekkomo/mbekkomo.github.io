pcall(function()
    local runner = require("config.coderunner")
    runner.add_runner("html", "live-server --browser=xdg-open --ignore=README.md")
end)
