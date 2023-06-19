# .config

我的mac中的`~/.config`的核心内容。

# 使用前必读

1. 使用方式：将本仓库所有内容覆盖至`~/.config`目录下即可。
2. 本配置仓库中的部份内容依赖kitty终端，如果不使用该终端则会导致体验下降，强烈建议安装Kitty终端来使用。
3. 本配置仓库中依赖字体`MesloLGS Nerd Font`，可以在其[官方仓库](https://github.com/ryanoasis/nerd-fonts)中找到并下载`Meslo.zip`文件后安装即可，截止本文档编写期间，该字体的最新版本为[3.0.2](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip)。

# Kitty

[Kitty](https://sw.kovidgoyal.net/kitty)是一个能显示图片的强大终端，并且有着极佳的视觉效果。

安装方式：

1. 使用brew进行安装。

   ```shell
   brew install kitty
   ```

2. 按照官方文档进行安装。

   ```shell
   curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
   ```

Kitty使用直接编辑配置文件的方式来修改配置，重新加载Kitty的配置文件有多种方法，例如可以使用快捷键`control`+`command`+`,`，此外也可以向Kitty进程发送`SIGUSR1`命令，发送方式为`kill -SIGUSR1 <pid>`，其中pid为Kitty进程的pid。

如果想要修改kitty的主题，可以使用以下命令：

```shell
kitty +kitten themes --reload-in=all <optional: theme name>
```

其中，如果不填写theme name，那么就会进入选择模式，如果填写theme name，那么就会直接讲主题切换为theme name指定的内容。

# joshuto

[joshuto](https://github.com/kamiyaa/joshuto)是一个使用rust编写的类似ranger的终端下文件管理器。

> joshutou的安装方式建议参考官方仓库中的`README.md`文件，不建议使用brew进行安装，因为其当前release版本（v0.9.4）有较多问题，建议直接克隆仓库，用最新的main分支代码进行编译安装。

安装joshuto依赖rust语言：

```shell
brew install rust
```

克隆仓库：

```shell
git clone https://github.com/kamiyaa/joshuto.git
```

构建并安装到系统范围，安装路径为`/usr/local`，这里需要注意的是最终使用sudo命令进行安装，如果没有事先执行`cargo build`的构建命令，那么执行过程中下载的所有依赖包都会是root权限的，导致后续进行删除或重新构建等操作都只能使用sudo命令，比较麻烦，因此这里建议优先使用`cargo build`来进行构建，然后再安装：

```shell
#构建
cargo build
#安装到系统范围
sudo cargo install --path=. --force --root=/usr/local
```

如果要让joshuto在预览文件的时候显示高亮，那么需要安装bat（一个使用rust重写的cat命令）：

```shell
brew install bat
```

如果要让joshuto能够预览文件，那么需要确保你正在使用Kitty终端，并且使用脚本`~/.config/joshuto/joshuto_image.sh`启动脚本，注意该脚本需要使用`/bin/zsh`进行启动，为方便起见，可以使用zsh的`alias`指令来制定启动快捷键，例如可以在`.zshrc`文件中指定如下的快捷键`j`（注意修改`<username>`为你的用户名）：

```shell
alias j=/Users/<username>/.config/joshuto/joshuto_image.sh
```

# Neovim

正如Vim是Vi的升级版，[Neovim](https://neovim.io)则是Vim的升级版，在mac上可以使用`brew`进行安装：`brew install neovim`。

Neovim的可配置内容虽然与Vim大相径庭，但配置方式却有所区别，具体可以参考其[官方配置文档](https://neovim.io/doc/user/lua-guide.html)。

为了方便打开Neovim，你可以设置快捷方式来覆盖vim命令，例如在zsh下可以这么做：`alias vim=nvim`。

本仓库的Neovim配置是使用[NvChad](https://nvchad.com)来生成并自定义的，这是一个开箱即用的集成了大量常见常用的Vim配置和插件的工具，并且优化了启动速度，使得其性能也有显著的提升。bilibili上有一个[NvChad的入门视频](https://www.bilibili.com/video/BV1Ga4y1g7fq)推荐进行观看。

虽然NvChad是一个非常方便的工具，但其配置方式与原生的Neovim的配置方式会有所不同，你不再应该将`~/.config/nvim/init.vim`作为Neovim的配置文件进行编写，因为这反而可能会导致Neovim的启动速度变慢。如果要自定义Neovim的配置，需要修改`~/.config/nvim/lua/custom/`目录下的`init.lua`、`plugins.lua`或`mappings.lua`等文件，具体配置入门可以参考上文提到的入门视频的06:43一直到最后。

