local vfs = require("openmw.vfs")

for config_file in vfs.pathsWithPrefix("scripts/better_blood") do
    print(config_file)
end
