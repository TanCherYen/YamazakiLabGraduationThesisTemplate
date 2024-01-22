PROJECT_PATH = ${PWD}

compile:
	@make clear
	@python3 ./utils/format.py
	@docker run --rm -it -v $(PROJECT_PATH):/workdir paperist/texlive-ja platex ./graduation_thesis.tex
	@docker run --rm -it -v ${PROJECT_PATH}/:/workdir paperist/texlive-ja pbibtex ./graduation_thesis
	@docker run --rm -it -v $(PROJECT_PATH):/workdir paperist/texlive-ja platex ./graduation_thesis.tex
	@docker run --rm -it -v $(PROJECT_PATH):/workdir paperist/texlive-ja platex ./graduation_thesis.tex
	@docker run --rm -it -v $(PROJECT_PATH):/workdir paperist/texlive-ja dvipdfmx ./graduation_thesis.dvi
	@make clear

compile-w:
	python  .\utils\format.py
	docker run --rm -it -v ${pwd}:/workdir paperist/texlive-ja platex ./graduation_thesis.tex
	docker run --rm -it -v ${pwd}:/workdir paperist/texlive-ja pbibtex ./graduation_thesis
	docker run --rm -it -v ${pwd}:/workdir paperist/texlive-ja platex ./graduation_thesis.tex
	docker run --rm -it -v ${pwd}:/workdir paperist/texlive-ja platex ./graduation_thesis.tex
	docker run --rm -it -v ${pwd}:/workdir paperist/texlive-ja dvipdfmx ./graduation_thesis.dvi
	del *.dvi
	del *.log
	del *.aux
	del *.toc
	del .\subdoc\*.aux
	del .\setting\*.aux

clear:
	@find ./ -type f -name "*.aux" -delete
	@find ./ -type f -name "*.dvi" -delete
	@find ./ -type f -name "*.log" -delete
	@find ./ -type f -name "*.bbl" -delete
	@find ./ -type f -name "*.blg" -delete
	@find ./ -type f -name "*.toc" -delete

refresh:
	find ./ -type f -name "*.aux" -delete
	find ./ -type f -name "*.dvi" -delete
	find ./ -type f -name "*.log" -delete
	find ./ -type f -name "*.toc" -delete
