local orgmode = require 'orgmode'

orgmode.setup {}

orgmode.setup_ts_grammar()

orgmode.setup({
    org_agenda_files = {
        "~/wiki/inbox.org", "~/wiki/gtd.org", "~/wiki/tickler.org"
    },
    org_default_notes_file = "~/wiki/inbox.org"
})
