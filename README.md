A github:pages blog using jekyll
================================

Getting a jekyll based github:pages blog up and running was more effort than I expected (not a 5 minute job). This repo contains everything you need to get started, including forks of the default github:pages themes as submodules.

For github:pages, github requires a repo named USERNAME.github.com, you can fork ghpblog and rename it, or do what is described in the installation section. Remember that the themes are forks of the default github:pages themes included in this repo as submodules.

Installation
------------

1. Fork on github
2. Create a new repo USERNAME.github.com
3. git clone https://github.com/USERNAME/USERNAME.github.com.git
4. git remote add upstream https://github.com/USERNAME/ghpblog.git
5. git fetch upstream
6. git merge upstream/master
7. git submodule init
8. git submodule update --recurisve
9. git push https://github.com/USERNAME/USERNAME.github.com.git

Usage
-----

1. Edit \_config.yml to your liking, edit the owner and copyright values specifically
2. If you don't want to see the default test post's, in their respective YAML frontmatter, set published:false
3. Add your own content to \_posts following the file naming convection YYYY-MM-DD-this-is-a-post.md for markdown for example
4. Commit and push your changes

