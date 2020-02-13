# Batch migrating Mercurial (Hg) Bitbucket repositories to Git

## WARNING!!!: Dont forget to `git clone --recursive <project url>` this repository as it includes *fast-transform* submodule that is required for scripts to work.

Since Bitbucket announced [end of Mercurial support](https://bitbucket.org/blog/sunsetting-mercurial-support-in-bitbucket) here is the instruction and scripts to help migrating multiple repositories from Bitbucket Mercurial (Hg) to Git. 

**Prerequisites**: Bash, Python 2.

Please follow instructios below:

### 1. Configure Bitbucket to use SSH protocol
Follow instructions [here](https://confluence.atlassian.com/bitbucket/set-up-an-ssh-key-728138079.html)

### 2. Collect list of repository names to **repositories.txt**

Using [Scraper Chrome extension](https://chrome.google.com/webstore/detail/scraper/mbigbapnjcgaffohmbkdlecaccepngjd) it is easy to extract repository names from Bitbucket web site. Put extracted repository names into **repositories.txt** file one line each.

### 3. Clone Mercurial repositories locally

Execute `bash clone.sh prefix` command, substituting `prefix` with your organisation or personal Bitbucket URL prefix. This will clone all repositories into `./hg/` folder locally.

### 4. Convert Mercurial repositories to Git

Execute `bash transform.sh` command to convert all Mercurial repositories in `hg` folder into Git repositories and output them to `git` folder. The proces will drop all non-merged unnamed heads from hg repositories, which is usually OK. If your repository is well maintained and merged nameless heads only represent abandoned lines of work.

.hgignore files has to be converted to .gitignore manually. Fortunately such conversion only needed if you continue to work on the project.

### 5. Configure Gitlab to use SSH

Create [Gitlab](https://gitlab.com/) account (if not already) and [configure it to use SSH](https://docs.gitlab.com/ee/gitlab-basics/create-your-ssh-keys.html).

Create groups on Gitlab to match your organization names from Bitbucket.

### 6. Push new Git repositories to Gitlab

Execute `bash push.sh prefix` to push all repositories from `git` folder to Gitlab, substituting `prefix` with your Group name or personal URL prefix.

### 7. Repeat steps 2 - 6 for each organization in Bitbucket.

### 8. Say bye to Bitbucket.
