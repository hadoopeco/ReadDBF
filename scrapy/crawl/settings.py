# -*- coding: utf-8 -*-

# Scrapy settings for crawl project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/en/latest/topics/settings.html
#

BOT_NAME = 'crawl'

SPIDER_MODULES = ['crawl.spiders']
NEWSPIDER_MODULE = 'crawl.spiders'

ITEM_PIPELINES = [
    'scrapy.contrib.pipeline.images.ImagesPipeline',
    'crawl.pipelines.CrawlPipeline']
IMAGES_MIN_HEIGHT = 50
IMAGES_MIN_WIDTH = 50
DOWNLOAD_TIMEOUT = 1200
IMAGES_STORE = 'd:/crawl/images/'
IMAGES_THUMBS = {
     'small': (50, 50),
     'big': (270, 270),
}
# Crawl responsibly by identifying yourself (and your website) on the user-agent
#USER_AGENT = 'crawl (+http://www.yourdomain.com)'
