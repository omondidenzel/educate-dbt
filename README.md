### How to install this on your machine

- Make sure you have `python3` installed.
- `git clone` this repo
- Navigate to repo directory: `cd educate-dbt`
- Create a `dbt` virtualenv to insulate dependencies: `virtualenv venv`
- Activate the virtualenv: `. venv/bin/activate` on Mac
- Install `dbt` and the required packages: `pip3 install -r requirements.txt`

- Setup your database connections in `~/.dbt/profiles.yml`