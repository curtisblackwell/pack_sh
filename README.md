# pack.sh
## Usage
From project root:

    sh pack.sh [add-on dir] [space separated list of other files/folders to include]

### If installed as a [Git Submodule](http://git-scm.com/book/en/Git-Tools-Submodules)
    sh pack_sh/pack.sh [add-on dir] [space separated list of other files/folders to include]

The `add-on dir` argument can be left out if:
1. The current working dir name is identical to the add-on dir name and
2. No extra files/folders are being included.

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

#### Ex. without arguments ([Hash Browns Add-On for ExpressionEngine](http://devot-ee.com/add-ons/hash-browns))
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
      demo

##### Bash Command
    sh pack.sh

##### Output
    hash_browns_VERSION.zip
      project_name
        add-on_dir (what devs will drop in to the CMS's add-ons dir)
        LICENSE
        README.md

#### Ex. with arguments ([Hash Browns Add-On for Statamic](http://trading-post.statamic.com/))
##### Project Dir
    stat_hash_browns
      demo
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
    sh pack.sh hash_browns demo

##### Output
    hash_browns_VERSION.zip
      project_name
        add-on_dir (what devs will drop in to the CMS's add-ons dir)
        demo
        LICENSE
        README.md

## Config
If you want to create a config file so that you can call the script without passing any arguments,

1. copy `pack.sh.config.sample` to the dir where you call the script from,
2. rename `pack.sh.config.sample` -> `pack.sh.config`, and
3. update the variables in the file to the appropriate values.

### Dir Structure
    hash_browns
      demo
      hash_browns
        config.php
        pi.hash_browns.php
      DOCS.md
      LICENSE
      pack_sh
        pack.sh
      pack.sh.config
      README.md
