local set = vim.keymap.set

set('n', '<leader>ct', require('crates').toggle, { silent = true, desc = 'Toggle crates', buffer = true })
set('n', '<leader>cr', require('crates').reload, { silent = true, desc = 'Reload crates', buffer = true })

set('n', '<leader>cv', require('crates').show_versions_popup,
	{ silent = true, desc = 'Show versions popup', buffer = true })
set('n', '<leader>cf', require('crates').show_features_popup,
	{ silent = true, desc = 'Show features popup', buffer = true })
set('n', '<leader>cd', require('crates').show_dependencies_popup,
	{ silent = true, desc = 'Show dependencies popup', buffer = true })

set('n', '<leader>cu', require('crates').update_crate, { silent = true, desc = 'Update crate', buffer = true })
set('v', '<leader>cu', require('crates').update_crates, { silent = true, desc = 'Update crates', buffer = true })
set('n', '<leader>cUa', require('crates').update_all_crates, { silent = true, desc = 'Update all crates', buffer = true })
set('n', '<leader>cU', require('crates').upgrade_crate, { silent = true, desc = 'Upgrade crate', buffer = true })
set('v', '<leader>cU', require('crates').upgrade_crates, { silent = true, desc = 'Upgrade crates', buffer = true })
set('n', '<leader>cA', require('crates').upgrade_all_crates,
	{ silent = true, desc = 'Upgrade all crates', buffer = true })
set('n', '<leader>ce', require('crates').expand_plain_crate_to_inline_table,
	{ silent = true, desc = 'Expand plain crate to inline table', buffer = true })
set('n', '<leader>cE', require('crates').extract_crate_into_table,
	{ silent = true, desc = 'Extract crate into table', buffer = true })

set('n', '<leader>cH', require('crates').open_homepage, { silent = true, desc = 'Open homepage', buffer = true })
set('n', '<leader>cR', require('crates').open_repository, { silent = true, desc = 'Open repository', buffer = true })
set('n', '<leader>cD', require('crates').open_documentation,
	{ silent = true, desc = 'Open documentation', buffer = true })
set('n', '<leader>cC', require('crates').open_crates_io, { silent = true, desc = 'Open crates.io', buffer = true })
