compile:
	ghc -o build/Main app/Main.hs

run:
	./build/Main

start: compile run