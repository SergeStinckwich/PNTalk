creating
openInputFile

"fnstream := fn asFilename readStream."
fnstream := FileStream fileNamed: fn.

^fnstream