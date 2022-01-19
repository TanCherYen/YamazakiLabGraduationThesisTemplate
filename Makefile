PROJECT_PATH = ${PWD}

compile:
	python3 ./utils/format.py
	docker run --rm -it -v $(PROJECT_PATH):/workdir paperist/alpine-texlive-ja platex ./graduation_thesis.tex
	docker run --rm -it -v $(PROJECT_PATH):/workdir paperist/alpine-texlive-ja platex ./graduation_thesis.tex
	docker run --rm -it -v $(PROJECT_PATH):/workdir paperist/alpine-texlive-ja dvipdfmx ./graduation_thesis.dvi
	rm *.dvi *.log *.aux *.toc

compile-w:
	python  .\utils\format.py
	docker run --rm -it -v ${pwd}:/workdir paperist/alpine-texlive-ja platex ./graduation_thesis.tex
	docker run --rm -it -v ${pwd}:/workdir paperist/alpine-texlive-ja platex ./graduation_thesis.tex
	docker run --rm -it -v ${pwd}:/workdir paperist/alpine-texlive-ja dvipdfmx ./graduation_thesis.dvi
	del *.dvi
	del *.log
	del *.aux
	del *.toc
	del .\subdoc\*.aux
	del .\setting\*.aux

refresh:
	find ./ -type f -name "*.aux" -delete
	find ./ -type f -name "*.dvi" -delete
	find ./ -type f -name "*.log" -delete
	find ./ -type f -name "*.toc" -delete
