#!/usr/bin/env bash

# generates list of Speaker Name:
#  - Sessions spoken at (session-id, title and description)
# output to .md to get GitHub rendering!

spklist=$(grep '^  id: ' speakers.yml | sed 's/  id: //'); for spk in ${spklist[@]}; do grep -A 2 '^  id: '"$spk"'$' speakers.yml | sed -e '/^  id:/ d; s/surname: //; s/name: //; s/"//g' | tr '\n' ' ' | sed 's/^/- [ ]/'; echo ""; grep -B 4 '^  speakers:.*[[ ]'"$spk"'[],].*' sessions.yml | sed -e '/^  subtype:/ d; /^  speakers:/ d; s/^  id:/session-id:/'; echo ""; done | sed -e '
s/session-id: 1\([0-9]\)$/Slot Time: 21 Nov (Tues) 9:00am-10:30am, stream \1/;
s/session-id: 2\([0-9]\)$/Slot Time: 21 Nov (Tues) 11:00am-12:30am, stream \1/;
s/session-id: 3\([0-9]\)$/Slot Time: 21 Nov (Tues) 3:00pm-5:00pm, stream \1/;
s/session-id: 4\([0-9]\)$/Slot Time: 22 Nov (Wed) 9:00am-10:30am, stream \1/;
s/session-id: 5\([0-9]\)$/Slot Time: 22 Nov (Wed) 11:00am-12:30am, stream \1/;
s/session-id: 6\([0-9]\)$/Slot Time: 22 Nov (Wed) 3:00pm-5:00pm, stream \1/;
s/session-id: 7\([0-9]\)$/Slot Time: 23 Nov (Thu) 9:00am-10:30am, stream \1/;
s/session-id: 8\([0-9]\)$/Slot Time: 23 Nov (Thu) 11:00am-12:30am, stream \1/;
s/session-id: 9\([0-9]\)$/Slot Time: 23 Nov (Thu) 3:00pm-5:00pm, stream \1/'


