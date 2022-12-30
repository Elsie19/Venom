return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")
		startify.section.header.val = {
			[[.-;':':'-.]],
			[[{'.'.'.'.'.}]],
			[[ )        '`.]],
			[['-. ._ ,_.-=']],
			[[  `). ( `);(]],
			[[ ('. .)(,'.)]],
			[[   ) ( ,').(]],
			[[  ( .').'(').]],
			[[  .) (' ).(']],
			[[   '  ) (  ).]],
			[[    .'( .)']],
			[[      .).']],
		}

		startify.section.footer = {
			{ type = "text", val = "Venom 2.0 Man o War" },
		}

		alpha.setup(startify.config)
	end,
}
