# 🎈 Open Learning Games

Free 3D learning games for kids. Each game is a single HTML file built with [three.js](https://threejs.org/) that runs in the browser on a phone or a computer. There are no ads, no accounts and no tracking.

**▶ Play now: https://frozenprakash.github.io/open-learning-games/**

Grade 1 is ready. Topics follow the CBSE / NCERT syllabus, so most of it suits any Grade 1 child. Other grades are welcome: see [Contributing](CONTRIBUTING.md).

## Games

### Grade 1

| Game | Subject | What it teaches |
|---|---|---|
| [🎈 Balloon Pop Party](https://frozenprakash.github.io/open-learning-games/grade-1/maths/balloon-pop-party.html) | Maths | Counting, numbers to 100, before / after / between, simple sums |
| [🚀 Number Blaster](https://frozenprakash.github.io/open-learning-games/grade-1/maths/number-blaster.html) | Maths | Adding and taking away to 20, missing numbers, doubles, making 10 |
| [🧱 Number Tower](https://frozenprakash.github.io/open-learning-games/grade-1/maths/number-tower.html) | Maths | Tens and ones with 3D blocks, 10 more / 10 less, groups of 2, 5 and 10 |
| [🍕 Pizza Party](https://frozenprakash.github.io/open-learning-games/grade-1/maths/pizza-party.html) | Maths | Equal parts, halves, quarters, sharing equally |
| [🔍 Shape Hunter](https://frozenprakash.github.io/open-learning-games/grade-1/maths/shape-hunter.html) | Maths | Spheres, cubes, cuboids, cylinders and cones: which roll and which stack |
| [🛒 Money Market](https://frozenprakash.github.io/open-learning-games/grade-1/maths/money-market.html) | Maths | Indian coins and notes, counting money, paying the exact price, change |
| [🏮 Word Lanterns](https://frozenprakash.github.io/open-learning-games/grade-1/english/word-lanterns.html) | English | Reading sight words aloud: the microphone lights the lantern |

## How the games work

- **One file per game.** Everything is drawn by code: there are no image or sound files. three.js loads from the jsDelivr CDN, so the first load needs internet.
- **Phone and computer.** The 3D view resizes to fit any screen, including a phone held sideways. Buttons are large and touch-friendly.
- **Kind feedback.** Questions are read aloud, a wrong answer gets a gentle hint, and first-try answers earn stars.
- **Levels.** Most games have Easy, Medium and Hard. A settings block at the top of each file sets the number of questions and other options.
- **Private.** Best scores are saved only in the browser on that device.

### Word Lanterns and the microphone

Word Lanterns uses the browser's speech recognition (Chrome on Android, Windows and Mac). The page must be opened from its `https://` link: browsers block the microphone for files opened from a phone's storage or from Google Drive. If the mic is not available or mishears, a grown-up can tap 👍.

To make your own word lists, edit [`grade-1/english/word-lanterns-words.txt`](grade-1/english/word-lanterns-words.txt) and run:

```sh
pwsh tools/make-word-lanterns.ps1
```

This rebuilds `grade-1/english/word-lanterns.html` from [`templates/word-lanterns-template.html`](templates/word-lanterns-template.html).

## Run it on your computer

Any static web server works, for example:

```sh
python -m http.server 8000
```

Then open http://localhost:8000.

## Folder layout

```
index.html                 home page: pick a grade
grade-1/
  index.html               the grade's game list
  maths/                   one HTML file per game
  english/
templates/
  starter-template.html    start a new game from this
  word-lanterns-template.html
tools/
  make-word-lanterns.ps1   builds a reading game from a word list
```

## Contributing

New games, new grades, translations and bug fixes are all welcome. Read [CONTRIBUTING.md](CONTRIBUTING.md) for the rules every game follows.

## License

[MIT](LICENSE). Free to use, change and share.
