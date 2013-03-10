# pack.sh
## Usage
From project root:

    sh pack.sh [add-on dir]

### If installed as a [Git Submodule](http://git-scm.com/book/en/Git-Tools-Submodules)
    sh pack_sh/pack.sh [add-on dir]

The `add-on dir` argument can be left out if the current working dir name is identical to the add-on dir name.

## Requirements
### config.php
**Note:** See Dir Structure below for mandatory location.

Inside `config.php`, a variable denoting the add-on version (`ADD_ON_V`) needs to be defined like so:

    define('ADD_ON_V', '1.1.1');

#### Ex. (config.php)
    <?php

    if (! defined('ADD_ON_V')) {
      define('ADD_ON_NAME', 'Hash Browns');
      define('ADD_ON_V', '1.1.1');
    }

    $config['name']    = ADD_ON_NAME;
    $config['version'] = ADD_ON_V;

### Dir Structure
    project_name
      add-on_dir (what devs will drop in to the CMS's add-ons dir)
        config.php
      LICENSE
      pack.sh (or pack_sh if using as submodule)
      README.md

#### Ex. without argument ([Hash Browns Add-On for ExpressionEngine](http://devot-ee.com/add-ons/hash-browns))
##### Project Dir
    hash_browns
      hash_browns
        config.php
        pi.hash_browns.php
      Hash Browns.sublime-project
      Hash Browns.sublime-workspace
      hash-browns.ai
      hash-browns.jpg
      LICENSE
      pack.sh
      README.md

##### Bash Command
    sh pack.sh

##### Output
    hash_browns_VERSION.zip
      project_name
        add-on_dir (what devs will drop in to the CMS's add-ons dir)
        LICENSE
        README.md

#### Ex. with argument ([Hash Browns Add-On for Statamic](http://trading-post.statamic.com/))
##### Project Dir
    stat_hash_browns
      hash_browns
        config.php
        pi.hash_browns.php
      Hash Browns.sublime-project
      Hash Browns.sublime-workspace
      hash-browns.ai
      hash-browns.jpg
      LICENSE
      pack.sh
      README.md

##### Bash Command
    sh pack.sh hash_browns

##### Output
    hash_browns_VERSION.zip
      project_name
        add-on_dir (what devs will drop in to the CMS's add-ons dir)
        LICENSE
        README.md
