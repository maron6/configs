-- require("git"):setup() -- Requires yazi 25.5.31 at least (unstable nix). ToDo with flakes later
require("omp"):setup()

-- DuckDB plugin configuration
require("duckdb"):setup({
		mode = "standard"

}) -- Default config
--[[
require("duckdb"):setup({
  mode = "standard"/"summarized",            -- Default: "summarized"
  cache_size = 1000                          -- Default: 500
  row_id = true/false/"dynamic",             -- Default: false
  minmax_column_width = int                  -- Default: 21
  column_fit_factor = float                  -- Default: 10.0
})
]]

