return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          args = { "-vv", "-s" },
          runner = "pytest",
        },
      },
      quickfix = {
        enabled = false,
      },
      output = {
        enabled = false,
      },
    },
    keys = {
      {
        ";tt",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle Summary Panel",
      },
      {
        ";tr",
        function()
          require("neotest").summary.open()
          require("neotest").run.run()
        end,
        desc = "Run Nearest",
      },
      {
        ";to",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle Output Panel",
      },
    },
  },
}
