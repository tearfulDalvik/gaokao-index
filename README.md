## 前言

`本文写给今后可能感兴趣的高中学弟学妹们`

在此之前，你应确认自己熟悉 Python 和 Javascript 语法，懂得基本爬虫哲学：如 Xpath、Chrome 开发者控制台、抓包 等基本操作，并能独立搜索解决问题。
同时，你应明白 Linux 基本操作（当然也可以在 Windows 上部署，不过门槛比 Linux 还要高，仅限高级玩家），并自行安装相关以依赖。知道 pip3 和 npm 打包工具的使用。

本文会提供 CentOS 7 环境下的一些命令提示，但是你应该自行解决源和 devel 头文件等其他找不到命令或编译失败问题。

## 目录结构

```
├── gaokao-index/ (配置文件)
|   ├── contents/
|   |   └── line.js (爬取历年分数线、学校简介、收费情况、所属省、热度排名等内容)
|   |   └── constitution.py (爬取各学校招生章程)
|   |   └── schools.py (爬取学校)
|   └── data/ (保存已爬到的数据文件)
|   ...
└── \_\_main__.py (主要运行文件，修改以调整启用的配置文件)
└── index.kyx (用于服务器的可执行程序，本质是 php)
└── structure.sql (表结构，实现建立结构后便于日后导入)
```

## 本地准备

建议环境：macOS 10.13.x

安装 Python3.6（包括 pip36）和 nodejs 8.x.x（包括 npm） ，版本可以有微小的不同，但是不建议跨发行版。并安装 git 工具

```brew install pip36 npm git```

然后安装依赖并克隆仓库

```shell
$ git clone https://github.com/tearfulDalvik/gaokao-index.git
$ cd gaokao-index
$ pip36 install lxml
$ npm install
```

## 服务器准备

建议环境：php7.x 和 mariadb 10.1.x

```yum install php72w mariadb -y```

将 index.kyx 上传到网站中，如果不会配置请直接将后缀名改为 php。

自行新建数据库后导入结构

```mysql -uroot -p 数据库名 < structure.sql```

然后编辑 index.kyx 文件并填写数据库名称、服务器地址、用户名和密码等信息。

## schools.py

高考一年一度，因此很有可能系统已经不一样，但是可以借鉴本爬虫的相关思路。

1. 在招考系统中按下 Command + Option + I ，选中 Network 选项卡，点击 “浏览院校计划”
2. 在记录下来的请求中找到 jsp 可执行文件后缀的请求，并在 Preview 中查看是否是没有 css 样式的表格
3. 从该请求中提取 ACCESS TOKEN 、分类的代码（理工或文史）和分页的依据
4. 复制到 schools.py 中，将第几页替换成 %s 表示
5. 如果想增加栏目，自行 Google 爬虫的 Xpath 用法和获取

运行即可在 data 目录中获取 schools.sql，上传到服务器后导入（接下来的导入以此类推）

```mysql -uroot -p 数据库名 < schools.sql```

**我不打算再介绍 constitution.py 的用法， 阳光平台每年的变化不大，几乎直接运行即可。即使不能，我留下了 url 在里面，你可以自行分析。**



## line.js

这里使用了 nodejs 是因为这些页面是动态加载的，从网页中获得的源代码是 Javascript ，因此将计就计使用 js 来编写。

line.js 本质即为一个 REST API 请求模拟器，一般来说变化不大可以直接运行：

```npm run line```

但是一旦出现错误，你需要自行研究其接口并将结果复制到 line.js 中。

导入即可。

## License

Copyright © 2018 [Dalvik Shen](https://ifengge.cn/) 

Open source under [GNU General Public License v3.0](http://www.gnu.org/licenses/gpl-3.0.html) license

本项目已经提交到 Github：[传送门](https://github.com/tearfulDalvik/gaokao-index/) 