# Contributing

Thanks for helping! Games for new grades, new subjects and better versions of existing games are all welcome.

## Rules every game follows

1. **One self-contained HTML file.** No build step, no image or sound files. Draw with three.js and make sounds with the Web Audio API.
2. **three.js r160** loaded through an import map from jsDelivr, like [`templates/starter-template.html`](templates/starter-template.html).
3. **Phone first.** Use pointer events, set `touch-action: none` on the canvas, keep tap targets at least 44 px, and fit the camera to the screen so the game works upright, sideways and on a monitor.
4. **Made for young children.**
   - Read questions aloud with `speechSynthesis`.
   - Keep words on screen short and simple.
   - Meet a wrong answer with a kind hint, never a buzzer or a "game over".
   - Rounds are short: about 10 questions.
5. **Levels and settings.** Offer Easy, Medium and Hard where it fits. Put the settings (questions per round, word lists, number ranges) in a clearly marked block at the top of the script.
6. **Private and safe.**
   - No ads, analytics, trackers or accounts.
   - No names, photos or other details of real children.
   - Save progress only in `localStorage`, under a short prefix that's unique to the game.
7. **Follow the syllabus.** Topics should match the grade (CBSE / NCERT, or say which syllabus in the game's header comment).

## Adding a game

1. Copy `templates/starter-template.html` to `grade-N/subject/game-name.html`. Use lowercase words joined by hyphens, for example `grade-2/maths/time-teller.html`.
2. Build the game. Start the file with a comment that says what it teaches and for which grade.
3. Test it:
   - on a computer, on a phone held upright and on a phone held sideways (Chrome DevTools device mode is fine);
   - play a full round on each level and check the browser console for errors.
4. Add a card for it to `grade-N/index.html`, and add it to the table in `README.md`.
5. Open a pull request with a screenshot.

## Adding a grade

1. Create `grade-N/index.html`. Copy `grade-1/index.html` and change the title and the cards.
2. On the home page (`index.html`), turn the grade's "Coming soon" card into a link.

## Ideas

Open an issue with the grade, the subject, the exact topic and how the game would play. Ideas from parents and teachers are especially welcome.
