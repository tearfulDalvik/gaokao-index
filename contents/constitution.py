#coding:utf-8
from model.xpath_model import XpathModel

#
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
#


class Constitution():
    # 结构
    # 该模型会爬取的内容
    structure = {
        # 此网页每行有两个大学
        # 学校名称 1
        XpathModel('school1', '/tr[%s]/td[1]/a'),
        # 学校名称 2
        XpathModel('school2', '/tr[%s]/td[3]/a'),
        # URL 1
        XpathModel('url1', '/tr[%s]/td[1]/a', 'href'),
        # URL 2
        XpathModel('url2', '/tr[%s]/td[3]/a', 'href'),
    }

    # 保存数据
    def processData(self, data):
        with open("data/constitution.sql", "a") as f:
            try:
                f.write("UPDATE `dypbk` SET `constitution` = 'http://gaokao.chsi.com.cn%s' WHERE `dypbk`.`school_name` = '%s';" % (data['url1'],data['school1']) + "\n")
                f.write("UPDATE `dypbk` SET `constitution` = 'http://gaokao.chsi.com.cn%s' WHERE `dypbk`.`school_name` = '%s';" % (data['url2'],data['school2']) + "\n")
                f.close()
            except KeyError:
                return 

    # 获取 HTML 页面的 URL
    # Downloader 会循环小于最大页数的每一页，在这里处理好 URL
    # @params page 页码数
    # Returns Marged URL
    def getUrl(self, page):
        # 阳光高考信息平台
        return 'http://gaokao.chsi.com.cn/zsgs/zhangcheng/listVerifedZszc--method-index,lb-1,ssdm-00,start-%s00.dhtml' % (page - 1)

    # 获取最大页数
    # Downloader 会循环小于最大页数的每一页，在这里返回最大页数
    # Returns Max page number
    def getMaxPage(self):
        return 31


    # 获取基 Xpath，从这里开始循环
    def getBasePath(self):
        return "/html/body/div[2]/table[2]/tbody/tr"


    def validation(self):
        return 1
    
    # 从何开始？
    # 一般从调试获得，只有在出现问题时才更改返回项
    def processIndex(self, index):
        return index + 1