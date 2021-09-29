-- LuaRocks configuration

home_tree = home .. "/.local/luarocks";
-- local_by_default = true;
lua_interpreter = "lua5.4";
rocks_trees = {
   { name = "user", root = home .. "/.local/luarocks" };
   { name = "system", root = "/usr/local" };
}
variables = {
   LUA_DIR = "/usr";
   LUA_BINDIR = "/usr/bin";
}
