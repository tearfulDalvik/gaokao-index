# -*- coding: utf-8 -*-  

# Copyright 2017 Dalvik
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


import requests
import chardet
from lxml import html


# 模拟登录，使用 cookie。
cookie = {}

# 从 Chrome 中复制的 Cookie
raw_cookies = ''

# for line in raw_cookies.split(';'):
  #   key, value = line.split("=", 1)
   #  cookie[key] = value  # 一些格式化操作，用来装载cookies


class Downloader:
    # Downloader 类，负责下载和解析网页内容

    # @params model 网页模型
    def download(self, model):
        # 初始化数据库
        for page in range(1, model.getMaxPage()):
            print(page)
            # 用requests，装载cookies，请求网站
            page = requests.get(model.getUrl(page), cookies=cookie)
            # html 源代码，方便后面用 XPath 来解析
            tree = html.fromstring(page.text)
            # 当前页面的序列
            index = 0
            # 初始化解析器
            parser = self.XpathParser(tree)
            # 遍历
            for aha in tree.xpath(model.getBasePath()):
                data = {}
                for node in model.structure:
                    if(node.getFindEngine() == 'text'):
                        found = node.splitText(parser.text(node.getXpath(), model.processIndex(index)))
                        if(found != "not exists"):
                            data[node.getName()] = found
                    if(node.getFindEngine() == 'href'):
                        found = node.splitText(parser.href(node.getXpath(), model.processIndex(index)))
                        if(found != "not exists"):
                            data[node.getName()] = found
                if(model.validation()):
                    model.processData(data)
                index += 1

    # xpath 解析器
    class XpathParser:
        global tree

        # 构造函数
        # @params tree HTML 字符串
        def __init__(self, tree):
            self.tree = tree

        # 解析文本
        # @params xpath 要查找的 xpath
        # @params index 序号
        def text(self, xpath, index):
            xpath_res = self.tree.xpath('/' + xpath % index + '/text()')
            if(len(xpath_res) > 0):
                return xpath_res[0]
            else:
                return "not exists"

        # 解析链接
        # @params xpath 要查找的 xpath
        # @params index 序号
        def href(self, xpath, index):
            xpath_res = self.tree.xpath('/' + xpath % index)
            if(len(xpath_res) > 0):
                return xpath_res[0].attrib['href']
            else:
                return "not exists"
