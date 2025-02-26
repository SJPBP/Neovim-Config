return {
	settings = {
		["harper-ls"] = {
			markdown = {
				ignore_link_title = true,
			},
			linters = {
				SpellCheck = true,
				SpelledNumbers = false,
				AnA = true,
				SentenceCapitalization = true,
				UnclosedQuotes = true,
				WrongQuotes = false,
				LongSentences = true,
				RepeatedWords = true,
				Spaces = true,
				Matcher = true,
				CorrectNumberSuffix = true,
			},
			diagnosticSeverity = "hint", -- Can also be "information", "warning", or "error"
			codeActions = {
				forceStable = true
			},
		}
	},
}
