select:
	python available.py
	python make_selection.py
	cat selected_presenters_tba.yaml

reselect:
	mv selected_presenters.yaml.bak selected_presenters.yaml
	python available.py       
	python make_selection.py  
	cat selected_presenters_tba.yaml

confirm:
	mv selected_presenters.yaml selected_presenters.yaml.bak
	mv selected_presenters_tba.yaml selected_presenters.yaml
	python generate.py
	open build/index.html

push:
	git add .
	git commit -m "increment `date +"%d/%m/%y"`"
	git subtree push --prefix build origin gh-pages
	# git push origin `git subtree split --prefix build master`:gh-pages --force

auto:
	python increment.py
	python available.py
	python make_selection.py
	cat selected_presenters_tba.yaml
	mv selected_presenters.yaml selected_presenters.yaml.bak
	mv selected_presenters_tba.yaml selected_presenters.yaml
	python generate.py
	open build/index.html

.PHONY: auto increment select reselect confirm push