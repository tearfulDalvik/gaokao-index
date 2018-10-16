#coding:utf-8
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


class XpathModel(object):
    # 查找方式
    global find_engine
    # Xpath 文本
    global xpath
    # 名称
    global name
    # 切割字符串从
    global split_from
    # 切割字符串到
    global split_to

    def __init__(self, name, xpath, find_engine="text", split_from=0, split_to=-1):
        self.find_engine = find_engine
        self.xpath = xpath
        self.name = name
        self.split_from = split_from
        self.split_to = split_to

    def getFindEngine(self):
        return self.find_engine

    def getXpath(self):
        return self.xpath

    def getName(self):
        return self.name

    def splitText(self, text):
        if(self.split_to < 0):
            return text[self.split_from:]
        return text[self.split_from: self.split_to]
