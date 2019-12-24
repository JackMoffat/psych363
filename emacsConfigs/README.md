**Instructions**

To get started with the following configurations

1. remove, rename, or delete any existing `~/.emacs.d/` or `~/.emacs` folder
2. copy `classconfig.org`, `custom.el`, and `init.el` into `~/.emacs.d/` 
3. rename `classconfig.org` to `config.org` 
4. launch emacs


**Very Brief Rundown**

`init.el` is the basic configuration file, where some low-level changes are made and from where other configuration options are realized. The lower lines in this file provide an example of loading the file `config.org`, which is where the majority of customizations are stored. `custom.el` holds any changes made from within emacs, such as changing a font size, and keeps these changes separate from the `init.el` file.
