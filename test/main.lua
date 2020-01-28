local lfs = require "lfs";

for entry in lfs.dir("./") do
  if (not entry:match("^([%.]+)$")) then
    print("entry", entry);
  end
end
