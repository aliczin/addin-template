call vrunner init-dev --src ./tools/cf

call vrunner syntax-check --settings=tools/vanessa/runner.json

call opm install precommit1c

git config --local core.quotepath false
git config --local core.longpaths true

call precommit1c --install

