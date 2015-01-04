# -*- coding: utf-8 -*-
import urllib
import urllib2
import scrapy
from scrapy.contrib.linkextractors.sgml import SgmlLinkExtractor
from scrapy.selector import Selector
from scrapy.http import Request,FormRequest
from scrapy.contrib.spiders import CrawlSpider, Rule
import sys
from crawl.items import CrawlItem

reload(sys)
sys.setdefaultencoding('utf-8')


list_first_item = lambda x:x[0] if x else None

class ExampleSpider(CrawlSpider):
    name = "carnews"
    allowed_domains = ["carnews.com","carnewsimg.com"]
    f = open("carnews.txt",'wb')
    start_urls = (
        # 'http://www.carnews.com/article-38818.html',
        'http://www.carnews.com/news',
        'http://www.carnews.com/trycar',
        'http://www.carnews.com/refit',
    )

    rules = (
        # Rule(SgmlLinkExtractor(allow=("([\w]+)", )),),
        # Rule(SgmlLinkExtractor(allow=("trycar.php?page=([\w]+)", )),),
        Rule(SgmlLinkExtractor(allow=('trycar.php\?page\=([\w]+)', )),follow=True, callback='parse_item'),
        Rule(SgmlLinkExtractor(allow=('news.php\?page\=([\w]+)', )),follow=True, callback='parse_item'),
        Rule(SgmlLinkExtractor(allow=('refit.php\?page\=([\w]+)', )),follow=True, callback='parse_item'),

        # Rule(SgmlLinkExtractor(allow=("article([\w]+)$", )),callback='parse_item'),
    )


    def parse_item(self,response):
        self.log("XXXXXXXXXXXXXXXXXXXXXXXX: parse_item ")
        hxs = Selector(response)
        for link in hxs.xpath('//div[@class="InformationBox_L_info"]/h2/a/@href').extract():
            linksub = link.split('/')
            yield Request("http://www.carnews.com/"+linksub[1], callback=self.parse_cont)


    def parse_cont(self, response):
        self.log('Hi, this is an item page! %s' % response.url)
        self.f.write(response.url+'\r\n')
        item = CrawlItem()
        hxs = Selector(response)
        s = hxs.xpath('//div[@id="NewsPages_Article"]/h1/text()').extract()
        date = hxs.xpath('//div[@class="note"]/text()').extract()
        desc = hxs.xpath('//div[@class="Article"]/p/text()').extract()
        imageurl = list_first_item(hxs.xpath('//div[@id="NewsPages_Article"]/img/@src').extract())
        name = response.url.split('/')[-1].split('.')[0]
        self.f.write('title='+list_first_item(s)+'\r\n')
        self.f.write('img='+name+'\r\n')
        item['book_covor_image_url'] = imageurl
        item['image_name'] = name
        # urllib.urlretrieve('http://s3.51cto.com/wyfs02/M00/53/E1/wKioL1Ry9_uRVxm5AAB9tJNMBRk568.jpg','test.jpeg')
        # self.log('desc ;'+str(desc))
        # filename = response.url.split("/")[-2]+'.txt'
        # f = open(filename, 'wb')
        for x in desc:
            self.f.write(x)
        if len(desc) > 0:
            self.f.writelines('\r\nXXXXXXXXXXXXXXXXXXXXXXX换行XXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n')
        self.f.flush()
        return item
