<a href="../../README.md">
<img 
src="../../.readme/assets/codeacademy-white.svg" 
height="42">
</a>

## Git Helpful commands

Add remote origin
```
$ git remote add origin 
https://github.com/<your_username>/<your_repository>.git
```

After that you are able to add everything you were 
working on with push and commit it:
```
$ git add .
$ git commit -m "description"
$ git push
```
> *Tip*: Use access token for your password 
(Account/Settings/Personal access tokens)

Reset commit changes:
```
$ git reset HEAD~1
```

To see which branch you are on:
```
$ git branch -v
or
$ git branch -a
```

Check git commit logs history using graph option:
```
$ git log --pretty=format:"%h %s" --graph
```

To create new branch you would first will need to 
pull the changes from the upstream:
```
$ git pull
```

Create the new branch on local machine and switch 
to it:
> *Tip*: To read more about the difference visit
[linuxhandbook](https://linuxhandbook.com/git-switch-checkout/)
and yes, to switch to the exisitng you would need 
to remove -b or -c accordingly
```
$ git chekout -b <name_of_new_branch> 
or 
$ git switch -c <name_of_new_branch>
```

> *Tip*: It's better to do merges on Github with pull requests

Finally merge the new local branch with the main
remote:
> *Tip*: To merge already pushed branch with
main you would need to do that on Github
by creating a pull request
```
$ git checkout main
$ git merge <name_of_the_branch>
$ git push origin main
```

Or push the new branch altogether with commit on remote:
```
$ git push origin <name_of_new_branch>
or 
$ git push --set-upstream origin <name_of_branch> --force
```

Delete the branch: 
```
locally
$ git branch -d <name_of_the_branch>
locally forced
$ git branch -D <name_of_the_branch>
on Github
$ git push origin :<name_of_the_branch>
```

#### Branching

Regular Git Branches:
- Development (dev)
- Master (master)
- QA (QA) or test branch

Temporary Git Branches
- bugfix
- hotfix
- feature
- expiremental
- WIP 

Branching naming convention
- starting branch name with a Group word (experimental_home-button-add) or (branch-type_commit)
- using the Unique ID (hotfix_1111_rename-variable) or (branch-type_id_commit)
- adding author name (nonamekk_feature_registration-window) or (author_branch-type_branch-name)


