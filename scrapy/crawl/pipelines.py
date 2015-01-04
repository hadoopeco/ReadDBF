# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-
#
#
# pipeline.html
from scrapy import Request
from scrapy.contrib.pipeline.images import ImagesPipeline
from twisted.python import hashlib


class CrawlPipeline(ImagesPipeline):
    image_name = None
    # def process_item(self, item, spider):
    #     return item
#Name download version
    def file_path(self, request, response=None, info=None):

        return 'full/%s.jpg' % (self.image_name)

    #Name thumbnail version
    def thumb_path(self, request, thumb_id, response=None, info=None):
        return 'thumbs/%s.jpg' % (self.image_name)

    def image_key(self, url):
        year,month = url.split('/')[-5],url.split('/')[-6]
        image_guid = hashlib.sha1(url).hexdigest()
        img_path = "%s/%s/%s" % (year,month,'tt')
        return '%s/%s.jpg' % (img_path, self.image_name)

    def get_media_requests(self, item, info):
        if item.get('book_covor_image_url'):
            self.image_name = item['image_name']
            yield Request(item['book_covor_image_url'])
