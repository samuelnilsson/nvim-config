local orgmode = require 'orgmode'

orgmode.setup {}

orgmode.setup_ts_grammar()

orgmode.setup({
	org_agenda_files = {
		"~/wiki/inbox.org", "~/wiki/gtd.org", "~/wiki/tickler.org", "~/wiki/workcal.org", "~/wiki/someday.org"
	},
	org_default_notes_file = "~/wiki/inbox.org",
	org_archive_location = "~/wiki/archive.org",
	org_todo_keywords = { 'TODO', 'WAITING', '|', 'DONE', 'CANCELLED' }
})
