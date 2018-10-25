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


class Schools():
    # 结构
    # 该模型会爬取的内容
    structure = {
        # 序号
        XpathModel('serial_num', '/tr[%s]/td[1]'),

        # 院校代号	
        XpathModel('school_id', '/tr[%s]/td[2]'),
        # 院校名称
        XpathModel('school_name', '/tr[%s]/td[3]/a'),

        # 院校计划	
        XpathModel('school_plan', '/tr[%s]/td[4]'),
        # 专业类别
        XpathModel('cate_field', '/tr[%s]/td[5]'),

        # 专业代号
        XpathModel('cate_id', '/tr[%s]/td[6]'),
        # 专业名称
        XpathModel('cate_name', '/tr[%s]/td[7]'),
        # 专业计划数
        XpathModel('cate_plan', '/tr[%s]/td[8]')
    }

    # 保存数据
    def processData(self, data):
        with open("data/w_depbk.sql", "a") as f:
            try:
                f.write("INSERT INTO `w_depbk` (`serial_num`, `school_id`, `school_name`, `school_plan`, `cate_field`, `cate_id`, `cate_name`, `cate_plan`) VALUES ('"+data['serial_num']+"', '"+data['school_id'].zfill(4)+"', '"+data['school_name']+"', '"+data['school_plan']+"', '"+data['cate_field']+"', '"+data['cate_id'].zfill(2)+"', '"+data['cate_name']+"', '"+data['cate_plan']+"');" + "\n")
                f.close()
            except KeyError:
                return 

    # 获取 HTML 页面的 URL
    # Downloader 会循环小于最大页数的每一页，在这里处理好 URL
    # @params page 页码数
    # Returns Marged URL
    def getUrl(self, page):
        # 提前本科
        return 'http://222.85.224.236/ptgk/gkzy24.asp?id=742ADD1776C1DC2806049528574A491B42AEE2BEB99C37DE&key=510&page=%s' % page

    # 获取最大页数
    # Downloader 会循环小于最大页数的每一页，在这里返回最大页数
    # Returns Max page number
    def getMaxPage(self):
        return 246

    # 获取基 Xpath，从这里开始循环
    def getBasePath(self):
        return "//tr"

    def validation(self):
        return 1

    # 从何开始？
    # 一般从调试获得，只有在出现问题时才更改返回项
    def processIndex(self, index):
        return index + 2