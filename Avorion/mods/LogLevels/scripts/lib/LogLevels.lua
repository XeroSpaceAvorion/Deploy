local logLevels = {off = 0, fatal = 100, error = 200, warning = 300, info = 400, debug = 500, trace = 600, all = 999}

function logLevels.AddLevel(Name,Level)
  logLevels[Name] = Level
end

return logLevels
