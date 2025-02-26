return {
	settings = {
					pylsp = {
						plugins = {
							jedi_completion = {
								include_class_objects = true,
								fuzzy = true,
								include_function_objects = true
							},
							pycodestyle = {
								ignore = {
									'W391',
									'E901'
								},
								maxLineLength = 100
							}
						}
					}
				}
}
