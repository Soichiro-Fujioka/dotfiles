return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          args = { "-vvs" },
          runner = "pytest",
        },
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
